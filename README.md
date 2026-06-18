# Appointment Manager System

## Overview

Appointment Manager System is a web-based application developed using Java Servlets, JSP, JDBC, and MySQL to streamline appointment scheduling and management. The system enables users to register, log in, book appointments, and manage their appointment details, while administrators can monitor users, manage appointments, and oversee system activities through an administrative dashboard.

The project follows the MVC (Model-View-Controller) architecture using Servlets as controllers, JSP for the presentation layer, and JDBC for database operations.

---

## Features

### User Module
- User Registration
- User Login and Logout
- Appointment Booking
- View Appointment Details
- Manage Personal Information
- Session-Based Authentication

### Admin Module
- Admin Login
- View Registered Users
- Manage Appointments
- View Appointment Records
- Update Appointment Status
- Administrative Dashboard

### System Features
- Dynamic Web Pages using JSP
- Database Connectivity using JDBC
- Session Management
- Form Validation
- CRUD Operations
- MVC-Based Project Structure

---

## Technology Stack

### Frontend
- HTML5
- CSS3
- JavaScript
- JSP (Java Server Pages)

### Backend
- Java
- Servlets
- JDBC

### Database
- MySQL

### Web Server
- Apache Tomcat 9

### Development Tools
- Eclipse IDE for Enterprise Java Developers
- MySQL Workbench

---

## Project Architecture

```
User
  |
  v
JSP Pages
  |
  v
Servlet Controllers
  |
  v
JDBC Layer
  |
  v
MySQL Database
```

---

## Prerequisites

Before running the project, install the following software:

- Java JDK 17 (Recommended)
- Apache Tomcat 9.x
- MySQL Server 8.x
- MySQL Workbench
- Eclipse IDE for Enterprise Java Developers

---

## Database Setup

### Step 1: Create Database

```sql
CREATE DATABASE appointment_db;
```

### Step 2: Import SQL Script

Import the provided SQL file:

```text
appointment_db.sql
```

using MySQL Workbench or MySQL command line tools.

### Step 3: Configure Database Connection

Update the database configuration in the project source code:

```java
String url = "jdbc:mysql://localhost:3306/appointment_db";
String username = "root";
String password = "your_password";
```

---

## Installation and Setup

### 1. Clone Repository

```bash
git clone https://github.com/vaishnaviborase15/AppointmentManager.git
```

### 2. Import Project into Eclipse

```
File
→ Import
→ Existing Projects into Workspace
→ Select Project Folder
→ Finish
```

### 3. Configure Apache Tomcat

```
Window
→ Preferences
→ Server
→ Runtime Environments
→ Add Apache Tomcat 9
```

### 4. Add Project to Server

```
Right Click Project
→ Run As
→ Run on Server
→ Select Tomcat 9
```

### 5. Access Application

Open your browser and visit:

```
http://localhost:8080/AppointmentManager
```

---

## Recommended Environment

| Component | Version |
|------------|----------|
| Java | JDK 17 |
| Tomcat | 9.0.x |
| MySQL | 8.x |
| Eclipse | Latest Enterprise Edition |

---

## Project Modules

### Authentication Module
- User Login
- User Registration
- Admin Login
- Session Handling

### Appointment Management Module
- Create Appointment
- View Appointment
- Update Appointment Information
- Delete Appointment

### User Management Module
- User Profile Management
- User Information Tracking

### Administration Module
- User Monitoring
- Appointment Monitoring
- Dashboard Management

---

## Security Improvements Recommended

This project was originally developed as a learning project. For production deployment, the following improvements are recommended:

- Replace plain text passwords with BCrypt hashing.
- Use PreparedStatement for all database queries.
- Implement Role-Based Access Control (RBAC).
- Add CSRF Protection.
- Add Input Validation and Sanitization.
- Store sensitive configuration in environment variables.
- Implement centralized exception handling.

---

## Future Enhancements

- Spring Boot Migration
- Spring Security Integration
- REST API Development
- Email Notifications
- SMS Notifications
- Appointment Reminders
- Responsive Bootstrap UI
- Docker Support
- Cloud Deployment
- Reporting and Analytics Dashboard

---

## Deployment Options

The project can be deployed using:

- Apache Tomcat Server
- Docker Containers
- AWS EC2
- AWS Elastic Beanstalk
- Railway
- Render

---

## Learning Outcomes

Through this project, the following concepts were implemented and explored:

- Java Servlets
- JSP Development
- JDBC Connectivity
- MySQL Database Operations
- MVC Architecture
- Session Management
- CRUD Operations
- Web Application Deployment
- Client-Server Architecture

---

## Author

**Vaishnavi Borase**

Java Full Stack Developer | AI/ML Enthusiast

GitHub: https://github.com/vaishnaviborase15

LinkedIn: https://www.linkedin.com/in/vaishnavi-borase-0ba971259

---


## License

This project is intended for educational and academic purposes. Feel free to use, modify, and enhance the application for learning and development.
