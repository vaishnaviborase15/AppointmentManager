<%@page import="java.sql.*" %>
<%@page import="ds.vaishu.db.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>View All Users</title>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-image: url('img/juo.jpg'); /* New Background Image URL */
            background-size: cover; /* Cover the entire page */
            background-position: center; /* Center the background image */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            width: 100%;
            max-width: 900px;
            background-color: rgba(51, 51, 51, 0.8); /* Semi-transparent background */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            color: #fff;
        }
        h1 {
            text-align: center;
            color: #ffb900; /* Highlight color */
            margin-bottom: 20px;
            font-family: 'Lucida Handwriting', cursive;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: rgba(0, 0, 0, 0.7); /* Slightly transparent background */
            border-radius: 8px;
            overflow: hidden;
        }
        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #444;
        }
        th {
            background-color: #444;
            color: #ffb900;
            text-transform: uppercase;
        }
        th:hover {
            background-color: #555;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #333;
        }
        tr:hover {
            background-color: #444;
        }
        a {
            color: #e74c3c; /* Red color for links */
            text-decoration: none;
            font-weight: bold;
        }
        a:hover {
            color: #c0392b; /* Darker red on hover */
            text-decoration: underline;
        }
        .home-btn {
            background-color: #ffb900;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px;
            cursor: pointer;
            font-size: 18px;
            position: absolute;
            top: 20px;
            right: 20px;
            transition: background-color 0.3s ease;
        }
        .home-btn:hover {
            background-color: #e59400;
        }
    </style>
</head>
<body>
    <button class="home-btn" onclick="window.location.href='welcome.html';">
        <i class="fas fa-home"></i>
    </button>

    <div class="container">
        <h1>View All Users</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>User's Name</th>
                <th>Designation</th>
                <th>Department</th>
                <th>Company Name</th>
                <th>Contact</th>
                <th>Address</th>
                <th>Email</th>
            </tr>
            <%
                try {
                    Connection con = ConnectDB.dbCon();
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM user");
                    ResultSet rs = ps.executeQuery();
                    
                    while(rs.next()) {
                        %>
                        <tr>
                            <td><%=rs.getInt(1)%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><%=rs.getString(5)%></td>
                            <td><%=rs.getString(6)%></td>
                            <td><%=rs.getString(7)%></td>
                            <td><%=rs.getString(8)%></td>
                        </tr>
                        <%
                    }
                } catch(Exception e) {
                    e.printStackTrace();
                }
            %>
        </table>
    </div>
</body>
</html>
