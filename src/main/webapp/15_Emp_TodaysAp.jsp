<%@page import = "java.sql.*" %>
<%@page import = "ds.vaishu.db.*" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Today's Appointments</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('img/v4.jpg'); /* Add your background image here */
    		background-size: cover;
            background-color: #f0f0f0;
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: black;
            color: #ffffff;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        h1 {
            text-align: center;
            color: black;
            font-family: 'Lucida Handwriting', cursive;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

	
    <h1>Today's Appointments</h1>
    <table>
        <tr>
            <th>Appointment ID</th>
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
        
        
            try 
            {
            	int eid = Emp.getEid();
                Connection con = ConnectDB.dbCon();
                String todayDate = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
                PreparedStatement ps = con.prepareStatement("SELECT * FROM appointment WHERE adate = ? and eid=?");
                ps.setString(1, todayDate);
                ps.setInt(2, eid);
                ResultSet rs = ps.executeQuery();
                
                while (rs.next()) 
                {
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
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</body>
</html>
