<%@page import = "java.sql.*" %>
<%@page import = "ds.vaishu.db.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Book Appointment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            
    background-image: url('img/v4.jpg'); /* Add your background image here */
    background-size: cover; /* Cover the entire screen */
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            text-align: center;
            width: 400px;
        }
        .container h3 {
            color: black; /* Set the text color to black */
            margin-bottom: 20px; /* Add some space below the heading */
        }
        input[type="text"], input[type="email"], input[type="date"], input[type="time"], textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: black;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: black;
        }
    </style>
</head>
<body>

	

    <% String eid = request.getParameter("eid"); %>
    
    <div class="container">
        <form action="_06_User_BookingAp" method="post">
            <h3>Book Appointment</h3>
             
            <input type="text" name="eid" value="<%= eid %>">
            <br><br>
            <input type="text" name="purpose" placeholder="Purpose of Appointment" required>
            <br>
            <textarea name="adesc" placeholder="Description" required></textarea>
            <br><br>
            <input type="date" name="adate" required>
            <input type="time" name="atime" required>
            <br><br>
            <input type="submit" value="Book Appointment">
        </form>
    </div>
            
</body>
</html>
