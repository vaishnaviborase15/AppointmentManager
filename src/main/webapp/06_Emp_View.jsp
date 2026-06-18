<%@page import = "java.sql.*" %>
<%@page import = "ds.vaishu.db.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View All Employees</title>
<!-- Font Awesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-image: url('img/juo.jpg');
        background-size: cover; /* Ensure the image covers the entire page */
        background-position: center center; /* Center the image */
        background-attachment: fixed; /* Keep the image fixed during scroll */
        background-color: #2c2c2c;
        color: #fff;
        padding: 0;
        margin: 0;
        display: flex;
    }
    .sidebar {
        width: 250px;
        background-color: black;
        padding: 20px;
        position: fixed;
        height: 100vh;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .sidebar h2 {
        color: #ffb900;
        text-align: center;
        margin-bottom: 30px;
        font-family: 'Cursive', sans-serif;
    }
    .sidebar ul {
        list-style: none;
        padding: 0;
        width: 100%;
    }
    .sidebar ul li {
        margin: 15px 0;
    }
    .sidebar ul li a {
        color: #fff;
        text-decoration: none;
        font-size: 18px;
        display: flex;
        align-items: center;
        padding: 10px;
        border-radius: 5px;
        text-align: center;
        transition: background-color 0.3s ease;
    }
    .sidebar ul li a i {
        margin-right: 10px; /* Space between icon and text */
    }
    .sidebar ul li a:hover {
        background-color: #444;
    }
    .sidebar .logo {
        font-size: 24px;
        color: #ffb900;
        margin-bottom: 20px;
    }
    .container {
    margin: 20px 50px 100px 350px; /* Top, Right, Bottom, Left */
    max-width: calc(100% - 270px); /* Adjusted width to account for the sidebar width */
    background-color: rgba(51, 51, 51, 0.8); /* Semi-transparent background */
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.3);
    overflow-x: auto; /* Ensure horizontal scroll if needed */
}

    .container h1 {
        color: #ffb900; /* Highlight color */
        text-align: center;
        margin-bottom: 20px;
        font-family: 'Lucida Handwriting', cursive;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        background-color: rgba(0, 0, 0, 0.6); /* Slightly transparent background */
        border-radius: 8px;
        overflow: hidden;
    }
    table th, table td {
        padding: 12px;
        text-align: left;
    }
    table th {
        background-color: #444;
        color: #ffb900;
        border-bottom: 2px solid #333;
    }
    table th:hover {
        background-color: #555; /* Background color on hover */
        color: #fff; /* Text color on hover */
    }
    table td {
        background-color: #333;
        border-bottom: 1px solid #444;
    }
    table tr:nth-child(even) {
        background-color: #2c2c2c;
    }
    table tr:hover {
        background-color: #444;
        cursor: pointer;
    }
    table td a {
        color: #e74c3c; /* Red color for delete links */
        text-decoration: none;
        font-weight: bold;
    }
    table td a:hover {
        text-decoration: underline;
        color: #c0392b; /* Darker red on hover */
    }
    .delete-button {
        background-color: #e74c3c;
        color: white;
        padding: 8px 16px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 14px;
        transition: background-color 0.3s ease;
    }
    .delete-button:hover {
        background-color: #c0392b;
    }
</style>
</head>
<body>
<div class="sidebar">
    <div class="logo">
        <i class="fas fa-briefcase"></i>
    </div>
    <h2>Dashboard</h2>
    <ul>
        <li><a href="05_Emp_Add.html"><i class="fas fa-user-plus"></i>Add Employee</a></li>
        <li><a href="06_Emp_View.jsp"><i class="fas fa-users"></i>View Employees</a></li>
        <li><a href="10_Admin_View_Users.jsp"><i class="fas fa-users"></i>View Users</a></li>
        <li><a href="welcome.html"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
    </ul>
</div>
<div class="container">
    <h1>View All Employees</h1>
    <table id="employeeTable">
        <tr>
            <th>ID</th>
            <th>Employee Name</th>
            <th>Designation</th>
            <th>Department</th>
            <th>Contact</th>
            <th>Email</th>
            <th>Password</th>
            <th>Action</th>
        </tr>
        <%
            try {
                Connection con = ConnectDB.dbCon();
                PreparedStatement ps = con.prepareStatement("select * from employee ");
                ResultSet rs = ps.executeQuery();
                
                while(rs.next()) {
                    %>
                    <tr onclick="selectRow(this)">
                        <td><%=rs.getInt(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(6)%></td>
                        <td><%=rs.getString(7)%></td>
                        <td><a href="07_Emp_Del.jsp?eid=<%=rs.getInt(1)%>" class="delete-button">Delete</a></td>
                    </tr>
                    <%
                }
            } catch(Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</div>
<script>
    function selectRow(row) {
        var selected = document.querySelectorAll('tr.selected');
        selected.forEach(function (elem) {
            elem.classList.remove('selected');
        });
        row.classList.add('selected');
    }
</script>
</body>
</html>
