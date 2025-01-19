
# **Mini Student Management System**

The Mini Student Management System is a Bash script-based project designed as a simplified solution to manage the essential functionalities of a student management system. This project demonstrates core concepts of shell scripting while providing an interactive interface for three types of users: Admin, Teachers, and Students. Each user type has a specific set of functionalities, ensuring a clear and organized system for managing academic data.


## **Features**

### 1. **User Roles and Access**

- **Admin**:
    - View teacher and student data.
    - Add or delete teacher and student records.
- **Teachers**:
    - View student data (marks and attendance).
    - Upload and edit marks and attendance records.
    - Upload notices and course materials.
- **Students**:
    - View personal marks, attendance, notices, and course materials.

### 2. **Data Storage**

The system stores all data in plain text files for simplicity:

- `teachers.txt`: Stores teacher details (name, subject, password).
- `students.txt`: Stores student details (name, password).
- `marks.txt`: Stores student marks for specific subjects.
- `attendance.txt`: Stores student attendance percentages.
- `notices.txt`: Stores notices for students.
- `course_material.txt`: Stores uploaded course materials.
- `admin.txt`: Stores admin credentials.

### 3. **Interactive Interface**

- Role-based login with password authentication.
- Organized menus for each user role to navigate functionalities.
- Input validation to ensure data integrity.

### 4. **Data Operations**

- Add, delete, and view records for teachers and students.
- Upload and edit marks and attendance for specific subjects.
- Post notices and share course materials for students.
## **How It Works**

### **Admin**
- Login using predefined credentials stored in `admin.txt`.
- Access functionalities to:
    - Manage teacher and student records.
    - View all teacher and student data.

### **Teacher**
- Login with name and password stored in `teachers.txt`.
- Perform the following:
    - View student marks or attendance data.
    - Upload and edit marks and attendance.
    - Post notices or share course materials.

### **Student**
- Login with name and password stored in `students.txt`.
- Access personal data such as:
    - Marks and attendance.
    - Notices and course materials uploaded by teachers.
## **Script Highlights**

- **Authentication**: Each role is authenticated using credentials stored in respective files.
- **Data Validation**: Prevents duplicate entries and ensures valid input ranges for marks and attendance.
- **Dynamic Menus**: Role-specific options are dynamically displayed for easy navigation.
- **Modular Design**: Functions are used for specific operations, enhancing maintainability and readability.
## **Usage**

### **Prerequisites**
- Bash shell installed on the system.
- Basic understanding of shell scripting.

### **Setup**

1. Clone the repository:

   ```bash
   git clone <repository_url>

2. Navigate to the project directory:

   ```bash
   cd Mini_Student_Management_System

3. Make the script executable:

   ```bash
   chmod +x Mini_Student_Management_System.sh

4. Run the script:

   ```bash
   ./Mini_Student_Management_System.sh

### **Default Credentials**

- Admin:
    - Username: `nirma123`
    - Password: `12345678`

- Teachers and Students:
    - Refer to the `teachers.txt` and `students.txt` files for predefined credentials.
## **Example Scenarios**

First of all, main menu appears:

![App Screenshot](https://github.com/itsharshschoice/Mini-Student-Management-System-Using-Bash/blob/main/Screenshots/Main_menu.png?raw=true)

1. Admin adds a teacher:
- Enter the teacher's name, subject, and password.
- The teacher's details are added to `teachers.txt`.

![App Screenshot](https://github.com/itsharshschoice/Mini-Student-Management-System-Using-Bash/blob/main/Screenshots/Example_1.png?raw=true)

2. Teacher uploads marks:
- Enter the student's name and marks.
- Marks are appended to `marks.txt` with subject association.

![App Screenshot](https://github.com/itsharshschoice/Mini-Student-Management-System-Using-Bash/blob/main/Screenshots/Example_2.png?raw=true)

3. Student views attendance and marks:
- Logs in and selects the option to first view attendance and then marks.
- Attendance data is displayed from `attendance.txt` and marks data is displayed from `marks.txt`.

![App Screenshot](https://github.com/itsharshschoice/Mini-Student-Management-System-Using-Bash/blob/main/Screenshots/Example_3.png?raw=true)
## **Limitations**

- Data is stored in plain text files, which is not secure or scalable for large systems.
- No graphical user interface (GUI).
## **Future Enhancements**

- Implement database integration for secure and scalable data management.
- Add a GUI for better usability.
- Include features like automated report generation and role-based permissions.
## **Conclusion**

The **Mini Student Management System** demonstrates how Bash scripting can create a functional and interactive tool for managing academic data. It offers role-based access for administrators, teachers, and students, handling tasks like data management, marks, and attendance. The project highlights the flexibility and power of shell scripting in building real-world applications. It serves as a practical example of using command-line tools to solve common academic management challenges efficiently.