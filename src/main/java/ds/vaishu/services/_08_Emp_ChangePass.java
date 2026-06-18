package ds.vaishu.services;

import java.io.IOException;
import java.sql.*;
import ds.vaishu.db.ConnectDB;
import ds.vaishu.db.Emp;
import ds.vaishu.db.User;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class _08_Emp_ChangePass
 */
public class _08_Emp_ChangePass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public _08_Emp_ChangePass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		try
		{
			String epassword = request.getParameter("epassword");
	        String newPassword = request.getParameter("newPassword");
	        String confirmPassword = request.getParameter("confirmPassword");
	        String email=Emp.getEmail();
	        if(!newPassword.equals(epassword))
	        {
	        	if(newPassword.equals(confirmPassword))
		        {
	        		Connection con= ConnectDB.dbCon();
	        		 PreparedStatement ps=con.prepareStatement("update employee set epassword=? where email=?");
		        	 ps.setString(1, newPassword);
		        	 ps.setString(2, email);
		        	 int i= ps.executeUpdate();
		        	 if(i>0)
		        	 {
		        		 response.sendRedirect("01_Emp_Welcome.html");
		        	 }
		        	 else
		        	 {
		        		 response.sendRedirect("error.html");
		        	 }
		        }
		        else
		        {
		        	System.out.println("The Password does not matched");
		        }
	        }
	        else
	        {
	        	System.out.println("The Password you have entered is Same as previous");
	        }
		}
		catch (Exception e) 
		{
				
			e.printStackTrace();
		}
		
	}

}
