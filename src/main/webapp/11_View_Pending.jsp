<%@page import="java.sql.*" %>
<%@page import="ds.vaishu.db.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pending Appointments</title>
<!-- Include Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
    body {
        font-family: Arial, sans-serif;
        background-image: url('img/ooopa.jpg'); /* Replace with your preferred background image */
        background-size: cover; /* Ensures the background image covers the entire body */
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
    
    .header {
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
        position: relative;
        text-align: center;
    }
    
    .logo {
        position: absolute;
        left: 20px;
        top: 20px;
        font-size: 24px;
        color: black;
    }
    
    .logout {
        position: absolute;
        right: 20px;
        top: 20px;
        color: black;
        text-decoration: none;
        font-size: 16px;
        font-weight: bold;
    }
    
    h1 {
        color: black;
        font-family: 'Lucida Handwriting', cursive;
        margin: 0;
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
    <div class="header">
        
        <h1>View Pending Appointments</h1>
    </div>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Employee ID</th>
                <th>User Name</th>
                <th>User Contact</th>
                <th>User Email</th>
                <th>Status</th>
                <th>Action-1</th>
                <th>Action-2</th>
            </tr>
        </thead>
        <tbody>
        <% 
            try {
                int eid = Emp.getEid();
                Connection con = ConnectDB.dbCon();
                PreparedStatement ps = con.prepareStatement("select * from appointment where astatus=? and eid=?");
                ps.setString(1, "Pending");
                ps.setInt(2, eid);
                
                ResultSet rs = ps.executeQuery();
                
                while(rs.next()) {
                    %>
                    <tr>
                        <td><%=rs.getInt(1)%></td>
                        <td><%=rs.getInt(2)%></td>
                        <td style="vertical-align: middle;"><%=rs.getString(4)%></td> <!-- Align center vertically -->
                        <td><%=rs.getString(8)%></td>
                        <td><%=rs.getString(14)%></td>
                        <td><%=rs.getString(15)%></td>
                        <td><a href="21_Approve_User.jsp?id=<%=rs.getInt(1)%>" class="approve-link">Approve</a></td>
                        <td><a href="22_Disapprove_User.jsp?id=<%=rs.getInt(1)%>" class="disapprove-link">Disapprove</a></td>
                    </tr>
                    <%
                }
            } catch(Exception e) {
                e.printStackTrace();
            }
        %>
        </tbody>
    </table>
</div>

</body>
</html>
