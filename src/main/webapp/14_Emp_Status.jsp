<%@page import="java.sql.*" %>
<%@page import="ds.vaishu.db.*" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>View Appointment Status</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('img/ooopa.jpg'); /* Replace with your preferred background image */
       	    background-size: cover;
            background-color: #f0f0f0;
            margin: 20px;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: black ;
            margin-bottom: 20px;
            font-family: 'Lucida Handwriting', cursive;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: black;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #e9ecef;
        }
        .message {
            margin-top: 20px;
            padding: 10px;
           
            color: #fff;
            border-radius: 5px;
            text-align: center;
        }
    </style>
</head>
<body>

	 
        
    <div class="container">
        <h1>Your Appointment Status</h1>
        <table>
            <tr>
                <th>Appointment ID</th>
                <th>Employee ID</th>
                <th>User Name</th>
                <th>Purpose</th>
                <th>Date</th>
                <th>Time</th>
                <th>Status</th>
            </tr>
            <%
                int eid = 1; 
                String message = "";
                try 
                {
                	eid = Emp.getEid();
                    Connection con = ConnectDB.dbCon();
                    String todayDate = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM appointment WHERE eid = ?");
                    ps.setInt(1,eid);
                    ResultSet rs = ps.executeQuery();
                    
                    boolean hasAppointments = false;
                    
                    while (rs.next()) 
                    {
                        hasAppointments = true;
            		%>
            		<tr>
                        <td><%= rs.getInt("aid") %></td>
                        <td><%= rs.getInt("eid") %></td>
                        <td><%= rs.getString("uname") %></td>
                        <td><%= rs.getString("purpose") %></td>
                        <td><%= rs.getString("adate") %></td>
                        <td><%= rs.getString("atime") %></td>
                        <td><%= rs.getString("astatus") %></td>
                    </tr>
            <%
                    }
                    if (!hasAppointments) 
                    {
                        message = "No appointments found.";
                    }
                } 
                catch (Exception e) 
                {
                    e.printStackTrace();
                    message = "An error occurred while retrieving appointment status.";
                }
            %>
        </table>
        
        <div class="message"><%= message %></div>
    </div>
</body>
</html>
