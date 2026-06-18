package ds.vaishu.services;

import java.io.IOException;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ds.vaishu.db.ConnectDB;
import ds.vaishu.db.Emp;
import ds.vaishu.db.User;


/**
 * Servlet implementation class _03_Emp_Login
 */
public class _03_Emp_Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public _03_Emp_Login() {
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
		
			String email = request.getParameter("email");
			String epassword = request.getParameter("epassword");
			
			Connection con = ConnectDB.dbCon();
			
			
			PreparedStatement ps = con.prepareStatement("select * from employee where email=? and epassword=?");
			ps.setString(1, email);
			ps.setString(2, epassword);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next())
            {
            	Emp.setEid(rs.getInt("eid"));
            	Emp.setEmail(rs.getString("email"));
            	response.sendRedirect("01_Emp_Welcome.html");
            }
            else
            {
            	response.sendRedirect("register.html");
            }
            
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
	}

}
