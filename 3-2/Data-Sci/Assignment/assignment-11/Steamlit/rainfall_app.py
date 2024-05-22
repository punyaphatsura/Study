import streamlit as st
import pandas as pd
import altair as alt
import pydeck as pdk

# Load the dataset
@st.cache_data 
def load_data():
    data = pd.read_csv("RainDaily_Tabular.csv", delimiter=",")
    data["date"] = pd.to_datetime(data["date"])
    return data

data = load_data()

# Sidebar - Province selection
province_list = data["province"].unique().tolist()
province_selection = st.sidebar.multiselect("Select Province(s)", province_list)

if len(province_selection) == 0:
    province_selection = province_list

# Sidebar - Date selection
min_date = data["date"].min().date()  # Ensure we"re working with python date objects
max_date = data["date"].max().date()  # Ensure we"re working with python date objects

date_options = [date.date() for date in pd.date_range(min_date, max_date)]  # List of date objects
date_selection = st.sidebar.select_slider("Select Date Range",
                                          options=date_options,
                                          value=(min_date, max_date),
                                          )

# Filtering data by province and date
# Convert date_selection to pandas timestamps to filter the dataframe
start_date, end_date = pd.to_datetime(date_selection[0]), pd.to_datetime(date_selection[1])
filtered_data = data[(data["province"].isin(province_selection)) &
                     (data["date"].dt.date.between(start_date.date(), end_date.date()))]

# Bar chart by province
st.subheader("Bar chart of average rain by province")
bar_chart_data = filtered_data.groupby("province")["rain"].mean().reset_index()
bar_chart = alt.Chart(bar_chart_data).mark_bar().encode(
    x=alt.X("province:N", sort="-y"),
    y="rain:Q",
    tooltip=["province", "rain"]
).interactive()
st.altair_chart(bar_chart, use_container_width=True)

st.subheader("Line chart of average rain by date")
# Group data by both "date" and "province" and calculate mean rain
line_chart_data = filtered_data.groupby(["date", "province"])["rain"].mean().reset_index()

# Create line chart
line_chart = alt.Chart(line_chart_data).mark_line().encode(
    x="date:T",
    y="rain:Q",
    color="province:N",  # Use "province" for color
    tooltip=["date", "rain", "province"]  # Include "province" in tooltip
).interactive()

# Display the chart
st.altair_chart(line_chart, use_container_width=True)

# Helper function to interpolate between red and green
def interpolate_color(rain_amount, min_rain, max_rain):
    # Normalize rain amount between 0 and 1
    normalized_rain = (rain_amount - min_rain) / (max_rain - min_rain)
    red = 255 * (1 - normalized_rain)
    green = 255 * normalized_rain
    return [red, green, 0, 160]

# Update the map with dynamic color based on rain amount
st.subheader("Map of rain in area")

# Define aggregation functions for each column
aggregation_functions = {
    "rain": "mean",      # Sum the rain column
    "longitude": "mean",   # Take the average longitude value for each group
    "latitude": "mean",    # Take the average latitude value for each group
    "province": "first",   # Take the first province value for each group
}
# Apply aggregation to grouped data
map_data = filtered_data.groupby("province").agg(aggregation_functions)

min_rain = map_data["rain"].min()
max_rain = map_data["rain"].max()

map_data["color"] = map_data.apply(lambda row: interpolate_color(row["rain"], min_rain, max_rain), axis=1)
map_data["rain"] = map_data["rain"].round(2)  # Round the rain amount to 2 decimal places

layer = pdk.Layer(
    "ScatterplotLayer",
    data=map_data,
    get_position="[longitude, latitude]",
    get_color="color",  # Use the new color column for the color of each point
    pickable=True,
    get_radius="12000 + rain * 1500",
    opacity=0.8
)

view_state = pdk.ViewState(latitude=data["latitude"].mean(), longitude=data["longitude"].mean(), zoom=4.4)
deck = pdk.Deck(layers=[layer], initial_view_state=view_state, map_style="mapbox://styles/mapbox/dark-v11", tooltip={"text": "{province} \n rain amount: {rain} mm"})

st.pydeck_chart(deck)

aggregation_functions = {
    "rain": "mean",      # Calculate the mean rain for each group
    "province": "first",   # Take the first province value for each group
    "date": "first"        # Take the first date value for each group
}

# Apply aggregation to grouped data
summarize_data = filtered_data.groupby(["date", "province"]).agg(aggregation_functions)

# Aggregate statistics
# Maximum average rainfall per province
max_avg_rain_per_province = data.groupby("province")["rain"].mean().idxmax()
max_avg_rain_value = data.groupby("province")["rain"].mean().max()

# Maximum and minimum rainfall recorded

# Group data by both "province" and "date" and calculate the mean rain
grouped_data = data.groupby(["province", "date"])["rain"].mean().reset_index()

# Find the date with the maximum average rainfall for each province
max_rain_by_province_date = grouped_data.loc[grouped_data.groupby("province")["rain"].idxmax()]

# Find the highest average rainfall across all provinces and dates
overall_max_rain = max_rain_by_province_date.loc[max_rain_by_province_date["rain"].idxmax()]

max_rain = overall_max_rain["rain"]
max_rain_province = overall_max_rain["province"]
max_rain_date = overall_max_rain["date"]

# Minimum rainfall recorded
min_rain = data["rain"].min()
min_rain_province = data.groupby("province")["rain"].min().idxmin()
min_rain_date = data.groupby("date")["rain"].min().idxmin()

# Maximum average daily rainfall
max_avg_daily_rain_date = data.groupby("date")["rain"].mean().idxmax()
max_avg_daily_rain_value = data.groupby("date")["rain"].mean().max()

# Minimum average daily rainfall
min_avg_daily_rain_date = data.groupby("date")["rain"].mean().idxmin()
min_avg_daily_rain_value = data.groupby("date")["rain"].mean().min()

# Number of unique provinces and dates
number_of_provinces = data["province"].nunique()
number_of_dates = data["date"].nunique()

# Display the calculated statistics in summary boxes
summary_text = f"""- Total number of unique provinces: {number_of_provinces}
- Total number of recorded dates: {number_of_dates}
- Province with the highest average rainfall: {max_avg_rain_per_province} with an average of {max_avg_rain_value:.2f} mm
- Maximum rainfall recorded: {max_rain:.2f} mm in {max_rain_province} on {max_rain_date.strftime("%d/%m/%Y")}
- Date with the highest average rainfall: {max_avg_daily_rain_date.strftime("%d/%m/%Y")} with an average of {max_avg_daily_rain_value:.2f} mm
- Date with the lowest average rainfall: {min_avg_daily_rain_date.strftime("%d/%m/%Y")} with an average of {min_avg_daily_rain_value:.2f} mm
"""

st.subheader("Summary of All Data")
st.write(summary_text)

if not (filtered_data["province"].nunique() == data["province"].nunique() and filtered_data["date"].nunique() == data["date"].nunique()):
    # Aggregate statistics
    # Maximum average rainfall per province
    max_avg_rain_per_province = filtered_data.groupby("province")["rain"].mean().idxmax()
    max_avg_rain_value = filtered_data.groupby("province")["rain"].mean().max()

    # Maximum and minimum rainfall recorded

    # Group data by both "province" and "date" and calculate the mean rain
    grouped_data = filtered_data.groupby(["province", "date"])["rain"].mean().reset_index()

    # Find the date with the maximum average rainfall for each province
    max_rain_by_province_date = grouped_data.loc[grouped_data.groupby("province")["rain"].idxmax()]

    # Find the highest average rainfall across all provinces and dates
    overall_max_rain = max_rain_by_province_date.loc[max_rain_by_province_date["rain"].idxmax()]

    max_rain = overall_max_rain["rain"]
    max_rain_province = overall_max_rain["province"]
    max_rain_date = overall_max_rain["date"]

    # Minimum rainfall recorded
    min_rain = filtered_data["rain"].min()
    min_rain_province = filtered_data.groupby("province")["rain"].min().idxmin()
    min_rain_date = filtered_data.groupby("date")["rain"].min().idxmin()

    # Maximum average daily rainfall
    max_avg_daily_rain_date = filtered_data.groupby("date")["rain"].mean().idxmax()
    max_avg_daily_rain_value = filtered_data.groupby("date")["rain"].mean().max()

    # Minimum average daily rainfall
    min_avg_daily_rain_date = filtered_data.groupby("date")["rain"].mean().idxmin()
    min_avg_daily_rain_value = filtered_data.groupby("date")["rain"].mean().min()

    # Number of unique provinces and dates
    number_of_provinces = filtered_data["province"].nunique()
    number_of_dates = filtered_data["date"].nunique()

    st.subheader("Summary of Selected Data")
    st.write(f"""
    - Total number of unique provinces: {number_of_provinces}
    - Total number of recorded dates: {number_of_dates}
    - Province with the highest average rainfall: {max_avg_rain_per_province} with an average of {max_avg_rain_value:.2f} mm
    - Maximum rainfall recorded: {max_rain:.2f} mm in {max_rain_province} on {max_rain_date.strftime("%d/%m/%Y")}
    - Date with the highest average rainfall: {max_avg_daily_rain_date.strftime("%d/%m/%Y")} with an average of {max_avg_daily_rain_value:.2f} mm
    - Date with the lowest average rainfall: {min_avg_daily_rain_date.strftime("%d/%m/%Y")} with an average of {min_avg_daily_rain_value:.2f} mm
    """)


# Display station codes
code = ", r".join(filtered_data["code"].unique())
st.subheader(f"Station Codes:")
st.write(code)

st.subheader('Source code:')
with open('rainfall_app.py', 'r') as file:
    st.code(file.read(), language='python')