#!/bin/bash

teacher_file="teachers.txt"
student_file="students.txt"
marks_file="marks.txt"
attendance_file="attendance.txt"
notice_file="notices.txt"
course_material_file="course_material.txt"
admin_file="admin.txt"

touch $teacher_file
touch $student_file
touch $marks_file
touch $attendance_file
touch $notice_file
touch $course_material_file
touch $admin_file

echo "nirma123:12345678" > $admin_file

echo "Parita Oza:OS:123" > $teacher_file
echo "Ashwin Verma:DSA:123" >> $teacher_file
echo "Usha Mehta:VLSI:123" >> $teacher_file
echo "Yogesh Trivedi:DCOMM:123" >> $teacher_file
echo "Rutul Patel:EWP:123" >> $teacher_file
echo "Rachna Sharma:CT:123" >> $teacher_file

echo "Harsh:123" > $student_file
echo "Veer:123" >> $student_file
echo "Karan:123" >> $student_file
echo "Yash:123" >> $student_file
echo "Prem:123" >> $student_file
echo "Aman:123" >> $student_file

#!/bin/bash

# Function to print the title (along with date and greeting message)
print_title() {
    # Colors
    bold=$(tput bold)
    normal=$(tput sgr0)
    red=$(tput setaf 1)
    green=$(tput setaf 2)
    yellow=$(tput setaf 3)
    cyan=$(tput setaf 6)

    # Clear the screen
    clear

    # Title formatting
    echo -e "${cyan}${bold}"
    echo "***************************************************"
    echo "*                                                 *"
    echo "*         ${yellow}MINI STUDENT MANAGEMENT SYSTEM${red}          *"
    echo "*                                                 *"
    echo "***************************************************"
    echo -e "${normal}"

    # Display the current date and time (IST)
    export TZ="Asia/Kolkata"
    echo "$(date)"
    echo -e "\n"
    
    echo "${bold}Welcome to the Mini Student Management System!${normal}"
    echo -e "\n"
}

# Admin login function
admin_login() {
    echo "Enter admin username:"
    read admin_name
    
    # Check if admin exists
    if grep -q "^$admin_name:" $admin_file; then
        line=$(grep "^$admin_name:" $admin_file)
        IFS=':' read -r username password <<< "$line"

        # Loop for password attempts
        while true; do
            echo "Enter admin password:"
            read -s admin_password

            if [ "$admin_password" == "$password" ]; then
                echo "Admin Login successful!"
                break
            else
                echo "Incorrect password. Please try again."
                echo "(Press CTRL+C to exit)"
            fi
        done

        # Proceed to the admin's menu
        admin_menu
    else
        echo "Admin not found. Try again."
        echo "(Press CTRL+C to exit)"
        admin_login
    fi
}

# Teacher login function
teacher_login() {
    echo "Enter your name:"
    read teacher_name
    
    # Check if teacher exists
    if grep -q "^$teacher_name:" $teacher_file; then
        line=$(grep "^$teacher_name:" $teacher_file)
        IFS=':' read -r name subject password <<< "$line"

        # Loop for password attempts
        while true; do
            echo "Enter your password:"
            read -s teacher_password

            if [ "$teacher_password" == "$password" ]; then
                echo "Login successful! Subject assigned: $subject"
                break
            else
                echo "Incorrect password. Please try again."
                echo "(Press CTRL+C to exit)"
            fi
        done

        # Proceed to the teacher's menu
        teacher_menu
    else
        echo "Teacher not found. Try again."
        echo "(Press CTRL+C to exit)"
        teacher_login
    fi
}

# Student login function
student_login() {
    echo "Enter your name:"
    read student_name
    
    # Check if student exists
    if grep -q "^$student_name:" $student_file; then
        line=$(grep "^$student_name:" $student_file)
        IFS=':' read -r name password <<< "$line"

        # Loop for password attempts
        while true; do
            echo "Enter your password:"
            read -s student_password

            if [ "$student_password" == "$password" ]; then
                echo "Login successful! Welcome, $student_name."
                break
            else
                echo "Incorrect password. Please try again."
                echo "(Press CTRL+C to exit)"
            fi
        done

        # Proceed to the student menu
        student_menu
    else
        echo "Student not found. Try again."
        echo "(Press CTRL+C to exit)"
        student_login
    fi
}

# Functions for admin functionalities
view_teachers_data() {
    cat $teacher_file
}

# Function to add a teacher
add_teacher() {
    option=1
    while test $option -eq 1; do
        echo "Enter Teacher's name:"
        read teacher_name
        if ! grep -q "^$teacher_name:" $teacher_file; then
            echo "Enter Teacher's subject:"
            read subject
            echo "Enter Teacher's password:"
            read password
            echo "$teacher_name:$subject:$password" >> $teacher_file
            echo "Teacher added successfully."
        else
            echo "Teacher already exists!"
        fi
        echo "Enter:
              (1). to continue
              (0). to exit"
        read option
    done
}

# Function to delete a teacher
delete_teacher() {
    option=1
    while test $option -eq 1; do
        echo "Enter Teacher's name:"
        read teacher_name
        if grep -q "^$teacher_name:" $teacher_file; then
            grep -v "^$teacher_name:" $teacher_file > temp
            mv temp $teacher_file
            echo "Teacher deleted successfully."
            rm -f temp
        else
            echo "Teacher does not exist!"
        fi
        echo "Enter:
              (1). to continue
              (0). to exit"
        read option
    done
}

view_students_data() {
    cat $student_file
}

# Function to add a student
add_student() {
    option=1
    while test $option -eq 1; do
        echo "Enter Student's name:"
        read student_name
        if ! grep -q "^$student_name:" $student_file; then
            echo "Enter Student's password:"
            read password
            echo "$student_name:$password" >> $student_file
            echo "Student added successfully."
        else
            echo "Student already exists!"
        fi
        echo "Enter:
              (1). to continue
              (0). to exit"
        read option
    done
}

# Function to delete a student
delete_student() {
    option=1
    while test $option -eq 1; do
        echo "Enter Student's name:"
        read student_name
        if grep -q "^$student_name:" $student_file; then
            grep -v "^$student_name:" $student_file > temp
            mv temp $student_file
            echo "Student deleted successfully."
        else
            echo "Student does not exist!"
        fi
        echo "Enter:
              (1). to continue
              (0). to exit"
        read option
    done
}

# Functions for teacher functionalities
view_students() {
    echo "Enter:
          (1). to view marks data
          (2). to view attendance data"
    read option
    case $option in
        1) grep "$subject:" $marks_file ;;
        2) grep "$subject:" $attendance_file ;;
    esac
}

upload_marks() {
    option=1
    while test $option -eq 1; do
        grep "$subject:" $marks_file
        echo "Enter student name:"
        read student_name
        if grep -q "^$student_name:" $student_file; then
            if ! grep -q "^$student_name:$subject:" $marks_file; then
                echo "Enter marks for $subject (out of 100):"
                read marks
                if [ "$marks" -ge 0 ] && [ "$marks" -le 100 ]; then
                    echo "$student_name:$subject:$marks" >> $marks_file
                    echo "Marks of $student_name uploaded successfully for $subject."
                else
                    echo "Out Of Range."
                fi
            else
                echo "Marks already uploaded for $student_name in $subject."
            fi
        else
            echo "No student found!"
        fi
        echo "Enter:
              (1). to continue
              (0). to exit"
        read option
    done
}

edit_marks() {
    option=1
    while test $option -eq 1; do
        grep "$subject:" $marks_file
        echo "Enter student name to edit marks:"
        read student_name
        if grep -q "^$student_name:" $student_file; then
            if grep -q "^$student_name:$subject:" $marks_file; then
                grep -v "^$student_name:$subject:" $marks_file > temp.txt
                mv temp.txt $marks_file
                echo "Enter new marks for $subject (out of 100):"
                read marks
                if [ "$marks" -ge 0 ] && [ "$marks" -le 100 ]; then
                    echo "$student_name:$subject:$marks" >> $marks_file
                    echo "Marks of $student_name edited successfully for $subject."
                else
                    echo "Out Of Range."
                fi
            else
                echo "Marks not uploaded for $student_name in $subject."
            fi
        else
            echo "No student found!"
        fi
        echo "Enter:
              (1). to continue
              (0). to exit"
        read option
    done
}

upload_attendance() {
    option=1
    while test $option -eq 1; do
        grep "$subject:" $attendance_file
        echo "Enter student name:"
        read student_name
        if grep -q "^$student_name:" $student_file; then
            if ! grep -q "^$student_name:$subject:" $attendance_file; then
                echo "Enter attendance for $subject (out of 100):"
                read attendance
                if [ "$attendance" -ge 0 ] && [ "$attendance" -le 100 ]; then
                    echo "$student_name:$subject:$attendance%" >> $attendance_file
                    echo "Attendance of $student_name uploaded successfully for $subject."
                else
                    echo "Out Of Range."
                fi
            else
                echo "Attendance already uploaded for $student_name in $subject."
            fi
        else
            echo "No student found!"
        fi
        echo "Enter:
              (1). to continue
              (0). to exit"
        read option
    done
}

edit_attendance() {
    option=1
    while test $option -eq 1; do
        grep "$subject:" $attendance_file
        echo "Enter student name to edit attendance:"
        read student_name
        if grep -q "^$student_name:" $student_file; then
            if grep -q "^$student_name:$subject:" $attendance_file; then
                grep -v "^$student_name:$subject:" $attendance_file > temp.txt
                mv temp.txt $attendance_file
                echo "Enter new attendance for $subject (out of 100):"
                read attendance
                if [ "$attendance" -ge 0 ] && [ "$attendance" -le 100 ]; then
                    echo "$student_name:$subject:$attendance%" >> $attendance_file
                    echo "Attendance of $student_name edited successfully for $subject."
                else
                    echo "Out Of Range."
                fi
            else
                echo "Attendance not uploaded for $student_name in $subject."
            fi
        else
            echo "No student found!"
        fi
        echo "Enter:
              (1). to continue
              (0). to exit"
        read option
    done
}


upload_notice() {
    echo "Enter notice to upload:"
    read notice
    echo "$(date "+%Y-%m-%d") $notice" >> $notice_file
    echo "Notice uploaded successfully."
}

upload_course_material() {
    echo "Enter course material info to upload:"
    read material
    echo "$(date "+%Y-%m-%d"): $material" >> $course_material_file
    echo "Course material uploaded successfully."
}

# Functions for student functionalities

view_marks() {
    grep "^$student_name:" $marks_file || echo "No marks found."
}

view_attendance() {
    grep "^$student_name:" $attendance_file || echo "No attendance found."
}

view_notices() {
    if [ -s $notice_file ]; then
        cat $notice_file
    else
        echo "No notices found."
    fi
}

view_course_materials() {
    if [ -s $course_material_file ]; then
        cat $course_material_file
    else
        echo "No course material found."
    fi
}

# Main menu

main_menu() {
    echo "Main menu:"
    echo "1. Admin Login"
    echo "2. Teacher Login"
    echo "3. Student Login"
    echo "0. Exit"
    read choice

    case $choice in
        1) admin_login ;;
        2) teacher_login ;;
        3) student_login ;;
        0) exit 0 ;;
        *) echo "Invalid choice, please try again."
           main_menu ;;
    esac
}

# Admin menu

admin_menu() {
    echo "Admin Menu:"
    echo "1. View Teachers data"
    echo "2. Add Teacher"
    echo "3. Delete Teacher"
    echo "4. View Students data"
    echo "5. Add Student"
    echo "6. Delete Student"
    echo "0. Logout"
    read choice

    case $choice in
        1) view_teachers_data ;;
        2) add_teacher ;;
        3) delete_teacher ;;
        4) view_students_data ;;
        5) add_student ;;
        6) delete_student ;;
        0) main_menu ;;
        *) echo "Invalid choice, please try again."
           admin_menu ;;
    esac
    admin_menu
}

# Teacher menu

teacher_menu() {
    echo "Teacher Menu:"
    echo "1. View students data"
    echo "2. Upload Marks"
    echo "3. Edit Marks"
    echo "4. Upload Attendance"
    echo "5. Edit Attendance"
    echo "6. Upload Notice"
    echo "7. Upload Course Material"
    echo "0. Logout"
    read choice

    case $choice in
        1) view_students ;;
        2) upload_marks ;;
        3) edit_marks ;;
        4) upload_attendance ;;
        5) edit_attendance ;;
        6) upload_notice ;;
        7) upload_course_material ;;
        0) main_menu ;;
        *) echo "Invalid choice, please try again."
           teacher_menu ;;
    esac
    teacher_menu
}

# Student menu

student_menu() {
    echo "Student Menu:"
    echo "1. View Marks"
    echo "2. View Attendance"
    echo "3. View Notices"
    echo "4. View Course Materials"
    echo "0. Logout"
    read choice

    case $choice in
        1) view_marks ;;
        2) view_attendance ;;
        3) view_notices ;;
        4) view_course_materials ;;
        0) main_menu ;;
        *) echo "Invalid choice, please try again."
           student_menu ;;
    esac
    student_menu
}

# Start the program

print_title
main_menu
