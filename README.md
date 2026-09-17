# Online Examination & Automated Evaluation System

## Project Overview

The Online Examination & Automated Evaluation System is a Java-based web application designed to conduct online examinations and automatically evaluate student responses.

The system provides separate modules for students and administrators. Students can register, log in, attempt available examinations, submit answers, and view their results. Administrators can manage examinations and questions and view student and examination results.

## Features

### Student Module
- Student registration
- Student login
- View available examinations
- Attempt MCQ-based examinations
- Exam timer
- Submit examination
- Automatic evaluation
- View score, percentage and grade
- View result history
- Logout

### Admin Module
- Admin login
- Create examinations
- Update examinations
- Delete examinations
- Add examination questions
- Update questions
- Delete questions
- View student records
- View examination results
- Logout

### System Features
- MySQL database storage
- JDBC database connectivity
- Input validation
- Exception handling
- Role-based access
- Automatic result generation
- Java multithreading demonstration
- Git version control

## Technologies Used

- Java
- Jakarta Servlets
- JSP
- HTML
- CSS
- JavaScript
- MySQL
- JDBC
- Apache Maven
- Apache Tomcat
- Git & GitHub
- Visual Studio Code

## Project Structure

```text
OnlineExaminationSystem
│
├── src
│   └── main
│       ├── java
│       │   └── com.onlineexam
│       │       ├── dao
│       │       ├── exception
│       │       ├── model
│       │       ├── servlet
│       │       ├── thread
│       │       └── util
│       │
│       └── webapp
│
├── pom.xml
└── README.md
```
## Installation and Setup

### Prerequisites

Install the following:

- Java JDK
- MySQL Server
- Apache Maven
- Apache Tomcat
- Visual Studio Code

### Database Setup

Create a MySQL database named:
    CREATE DATABASE online_exam;

Create the required tables for:

- Users
- Exams
- Questions
- Answers
- Results

### Database Configuration

The application uses an environment variable named:
    DB_PASSWORD
to access the MySQL database.

Set the environment variable to your MySQL password before running the application. 

### Build the Project

Open PowerShell in the project directory and run:
    mvn package

The generated WAR file will be located in:
    target/OnlineExaminationSystem.war

### Deploy the Tomcat

Copy the generated WAR file into the Tomcat: webapps

Start Apache Tomcat and open the application in a web browser.

### Testing

The following functionality should be tested:

1. Student registration
2. Duplicate email validation
3. Student login
4. Admin login
5. Exam creation
6. Exam update and deletion
7. Question creation
8. Question update and deletion
9. Starting an examination
10. Exam timer
11. Answer submission
12. Automatic evaluation
13. Result generation
14. Student result history
15. Admin result viewing
16. Student record viewing
17. Logout and session validation

## Version Control

Git is used for version control and the project is maintained in a GitHub repository.

## Future Enhancements

Possible future enhancements include:

- Password hashing
- More question types
- Improved timer handling
- Email notifications
- Advanced analytics
- JPA-based database access
- More detailed admin reports