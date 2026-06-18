<%@page import="java.sql.*"%>
<%@page import="ds.vaishu.db.*"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Today's Appointments</title>
    <style>
        body {
            background-image: url('img/juo.jpg'); /* Background image */
            background-size: cover; /* Cover the entire screen */
            background-position: center; /* Center the background image */
            font-family: Arial, sans-serif;
            background-color: #2c2c2c; /* Dark background color */
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            width: 80%;
            background-color: white; /* White background for the container */
            padding: 20px;
            border-radius: 10px;
            color: #000; /* Black text color */
            text-align: center;
        }
        table {
            width: 100%; /* Full width of the container */
            border-collapse: collapse;
            background-color: #ffffff;
            border-radius: 5px;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #3e4444; /* Dark header background */
            color: white;
            text-transform: uppercase;
        }
        tr:nth-child(even) {
            background-color: #ffffff; /* Uniform background color for all rows */
        }
        tr:hover {
            background-color: #ffffff; /* No hover effect */
        }
        .title {
            font-family: 'Lucida Handwriting', cursive;
            font-size: 28px;
            color: #ffb900; /* Highlight color */
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="title">Today's Appointments</div>
        <table>
            <tr>
                <th>ID</th>
                <th>Employee ID</th>
                <th>User Name</th>
                <th>Designation</th>
                <th>Department</th>
                <th>Company Name</th>
                <th>Contact</th>
                <th>Address</th>
                <th>Purpose</th>
                <th>Description</th>
                <th>Date</th>
                <th>Time</th>
                <th>Status</th>
            </tr>
            <% 
                try {
                    int uid = User.getUid();
                    Connection con = ConnectDB.dbCon();
                    String todayDate = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM appointment WHERE adate = ? and uid=?");
                    ps.setString(1, todayDate);
                    ps.setInt(2, uid);
                    ResultSet rs = ps.executeQuery();
                    
                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("aid") %></td>
                <td><%= rs.getInt("eid") %></td>
                <td><%= rs.getString("uname") %></td>
                <td><%= rs.getString("udesg") %></td>
                <td><%= rs.getString("udep") %></td>
                <td><%= rs.getString("cname") %></td>
                <td><%= rs.getString("ucontact") %></td>
                <td><%= rs.getString("uadd") %></td>
                <td><%= rs.getString("purpose") %></td>
                <td><%= rs.getString("adesc") %></td>
                <td><%= rs.getString("adate") %></td>
                <td><%= rs.getString("atime") %></td>
                <td><%= rs.getString("astatus") %></td>
            </tr>
            <% 
                    }
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </table>
    </div>
</body>
</html>
