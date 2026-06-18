<%@page import = "java.sql.*" %>
<%@page import = "ds.vaishu.db.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Disapproved Appointments</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-image: url('img/ooopa.jpg'); /* Replace with your preferred background image */
        background-size: cover;/* Ensures the background image covers the entire body */
         /* Centers the background image */
        background-repeat: no-repeat; /* Prevents the background image from repeating */
        margin: 0;
        padding: 0;
    }
    
    .container {
        width: 80%;
        margin: 20px auto;
        background-color: rgba(255, 255, 255, 0.8); /* Adds a semi-transparent white background to the container */
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
    }
    
    h1 {
        text-align: center;
        color: black;
        padding: 20px;
        font-family: 'Lucida Handwriting', cursive;
    }
    
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    
    table, th, td {
        border: 1px solid #ccc;
    }
    
    th, td {
        padding: 10px;
        text-align: left;
    }
    
    th {
        background-color: #f2f2f2;
    }
    
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    
    tr:hover {
        background-color: #e0e0e0;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>View Disapproved Appointments</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>Employee ID</th>
                <th>User Name</th>
                <th>User Contact</th>
                <th>User Email</th>
                <th>Status</th>
            </tr>
           
            <%
                try 
            {
                	int eid = Emp.getEid();
                    Connection con = ConnectDB.dbCon();
                    PreparedStatement ps = con.prepareStatement("select * from appointment where astatus=? and eid=? ");
                    ps.setString(1, "Disapproved");
                    ps.setInt(2, eid);
                    ResultSet rs = ps.executeQuery();
                    
                    while(rs.next()) {
                        %>
                        <tr>
                            <td><%=rs.getInt(1)%></td>
                            <td><%=rs.getInt(2)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><%=rs.getString(8)%></td>
                            <td><%=rs.getString(14)%></td>
                            <td><%=rs.getString(15)%></td>
                        </tr>
                        <%
                    }
                    
                } 
            	catch(Exception e)
            	{
                    e.printStackTrace();
                }
            %>
        </table>
    </div>
</body>
</html>
