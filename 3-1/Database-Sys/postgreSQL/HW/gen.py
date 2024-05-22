# Creating 12 empty files with pattern names using a for loop
for i in range(13, 17):
    file_name = f'4_{i}.sql'
    with open(file_name, 'w') as file:
        pass
    print(f'Created {file_name}')