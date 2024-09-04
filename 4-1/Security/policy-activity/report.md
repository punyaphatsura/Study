# Activity II : Security Policy

## Part I: Coffee Shop "Too Late To Sleep"

### 1.1 Identify Users and Roles

#### Customers:

- **Chulalongkorn University Members (Students, Faculty, and Staff)**
  - **Role:** Free Entry, access to Chula Member Zone with Chula card ID authentication.
- **Outsiders (Non-Chulalongkorn University Members)**
  - **Role:** Free Entry to General Areas, no access to Chula Member Zone.

#### Non-Customers:

- **Coffee Shop Employees**
  - **Role:** Staff Access, full access to all areas, including employee-only zones.
- **Food Riders (Deliveries)**
  - **Role:** Restricted Access (Delivery Zone Only)
- **Maintenance Personnel**
  - **Role:** Restricted Access (Maintenance Zones Only)

### 1.2 Physical Design and Services

- **Entrance Door:**
  - Located at the front of the shop. Only one entrance with a security gate that allows free entry to all users.
- **Coffee Service Area:**
  - Open to all users. Serves coffee, snacks, and beverages.
- **Bathroom:**
  - Located towards the back. Accessible to all users.
- **Seating Area:**
  - **Chula Member Zone:** Exclusive access for Chulalongkorn University members (students, faculty, staff) with free Wi-Fi, free electricity, study tables, and a quiet environment. Access controlled by Chula card ID authentication.
  - **General Seating:** Open to all users, including outsiders, with free electricity and Wi-Fi.
- **Additional Features:**
  - **Outdoor Seating:** Open to all users, no ID or payment required.
  - **Meeting Rooms:** Available for booking by faculty, staff, and students. Outsiders can book for an additional fee.
  - **Electricity Access:** Free electricity available in both Chula Member Zone and General Seating Zone.

<div style="page-break-after: always; visibility: hidden">
\pagebreak
</div>

### 1.3 Resources Requiring Access Control

- **Entrance Door:**
  - Free entry for all users.
- **Chula Member Zone:**
  - Access restricted to Chulalongkorn University members only; controlled via Chula card ID authentication.
- **Meeting Rooms:**
  - Requires booking; access controlled via ID or reservation code.
- **Employee Areas (Staff Room, Kitchen, Storage):**
  - Restricted to coffee shop employees only.

### 1.4 Authorization System Design

- **Chulalongkorn University Members:**
  - Free access to all areas except employee-only zones.
  - Chula card ID required for access to the Chula Member Zone and booking meeting rooms.
- **Outsiders:**
  - Free entry to general areas (General Seating, Outdoor Seating).
  - No access to the Chula Member Zone.
  - Additional payment required for booking meeting rooms.
- **Coffee Shop Employees:**
  - Full access to all areas, including employee-only zones.
- **Food Riders and Maintenance Personnel:**
  - Restricted access only to delivery and maintenance zones.

<div style="page-break-after: always; visibility: hidden">
\pagebreak
</div>

## Part II: Chulalongkorn University Registration System

### 2.1 Identify Users and Roles

- **Students**
  - **Role:** Register and manage for courses, view grades, request transcripts.
- **Instructors**
  - **Role:** Manage course content, enter grades, view student information.
- **Academic Advisors**
  - **Role:** Approve course registration, view student academic records.
- **Registrar's Office Staff**
  - **Role:** Manage student records, process graduation applications.
- **System Administrators**
  - **Role:** Full access to maintain and configure the system.

### 2.2 Identify Resources (Data and Objects)

- **Student Records:** Personal information, course history, grades.
- **Course Information:** Syllabus, schedule, instructor details.
- **Registration Data:** Course enrollments, waitlists.
- **Transcripts:** Academic performance reports.
- **System Configuration:** Settings, user roles, access logs.

### 2.3 Identify Functions (Actions for Resources)

- **Read:** Viewing information (e.g., students viewing their grades, instructors viewing course enrollment).
- **Write:** Modifying information (e.g., instructors entering grades, students registering for courses).
- **Approve:** Academic advisors approving course selections.
<!-- - **Configure:** System administrators managing system settings. -->

### 2.4 Authorization System Design (Access Control Matrix)

| **Role**                  | **Student Records**        | **Course Information** | **Registration Data** | **Transcripts** | **System Configuration** |
| ------------------------- | -------------------------- | ---------------------- | --------------------- | --------------- | ------------------------ |
| **Students**              | Read/Write (own)           | Read                   | Write (own)           | Read (own)      | None                     |
| **Instructors**           | Read (all), Write (grades) | Write (own courses)    | Read                  | Read            | None                     |
| **Academic Advisors**     | Read (advisees)            | Read                   | Approve               | Read            | None                     |
| **Registrar's Office**    | Read/Write (all)           | Read                   | Read/Write            | Read/Write      | None                     |
| **System Administrators** | Full Access                | Full Access            | Full Access           | Full Access     | Full Access              |
