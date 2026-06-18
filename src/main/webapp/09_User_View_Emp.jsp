<%@page import="java.sql.*" %>
<%@page import="ds.vaishu.db.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>View All</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('img/juo.jpg'); /* Add your background image here */
    background-size: cover; /* Cover the entire screen */
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
            margin-bottom: 20px;
            color: black;
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
        td a {
            display: inline-block;
            padding: 6px 12px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }
        td a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>


    <div class="container">
        <h1>View All Employees</h1>
        <table>
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
                    
                    while(rs.next())
                     {
                        %>
                        <tr>
                            <td><%=rs.getInt(1)%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><%=rs.getString(5)%></td>
                            <td><%=rs.getString(6)%></td>
                            <td><%=rs.getString(7)%></td>
                            <td><a href="17_User_BookAp.jsp?eid=<%=rs.getInt(1)%>">Book</a></td>
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
