<%@page import = "java.sql.*" %>
<%@page import = "ds.vaishu.db.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Approve User</title>
</head>
<body>

	<%
		try
		{	
			String aid = request.getParameter("id");
			System.out.println(aid);
			Connection con = ConnectDB.dbCon();
			PreparedStatement ps = con.prepareStatement("update appointment set astatus=? where aid=?");
			ps.setString(1, "Approved");
			ps.setInt(2, Integer.parseInt(aid));
			int i = ps.executeUpdate();
			
			if(i>0)
			{
				response.sendRedirect("11_View_Pending.jsp");
			}
			else
			{
				response.sendRedirect("error.html");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	%>
	

	

</body>
</html>