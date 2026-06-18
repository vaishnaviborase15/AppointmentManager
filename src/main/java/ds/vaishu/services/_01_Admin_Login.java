package ds.vaishu.services;

import java.io.IOException;

import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ds.vaishu.db.ConnectDB;

/**
 * Servlet implementation class _01_Admin_Login
 */
public class _01_Admin_Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public _01_Admin_Login() {
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
			String password = request.getParameter("password");
			
			Connection con = ConnectDB.dbCon();
		
            
            if(email.equals("admin@gmail.com") && password.equals("admin"))
            {
            	response.sendRedirect("welcome.html");
            }
            else
            {
            	response.sendRedirect("index.html");
            }
            
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
	}

}
