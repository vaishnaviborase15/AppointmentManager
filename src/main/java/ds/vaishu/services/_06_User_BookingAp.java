package ds.vaishu.services;

import java.io.IOException;

import ds.vaishu.db.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class _06_User_BookingAp
 */
public class _06_User_BookingAp extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public _06_User_BookingAp() {
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
        	int aid = 0;
        	String  eid = request.getParameter("eid");
        	int uid = User.getUid();
        	
            String uname = User.getUname();
            String udesg = User.getUdesg();
            String udep = User.getUdep();
            String cname = User.getCname();
            String ucontact = User.getUcontact();
            String uadd = User.getUadd();
            String uemail = User.getUemail();

        	
        	
        	String purpose = request.getParameter("purpose");
			String adesc = request.getParameter("adesc");
			String adate = request.getParameter("adate");
			String atime = request.getParameter("atime");
			String astatus = "Pending";
			

			

				Connection con = ConnectDB.dbCon();
				PreparedStatement ps = con.prepareStatement("insert into appointment values (?, ?, ?, ?,? ,?,?, ?, ?, ?,? ,?,?, ?, ?)");
				
				ps.setInt(1, aid);
				ps.setString(2, eid);
				ps.setInt(3, uid);
				ps.setString(4, uname);
				ps.setString(5, udesg);
				ps.setString(6, udep);
				ps.setString(7, cname);
				ps.setString(8, ucontact);
				ps.setString(9, uadd);
				ps.setString(10, purpose);
				ps.setString(11, adesc);
				ps.setString(12, adate);
				ps.setString(13, atime);
				ps.setString(14, uemail);
				ps.setString(15, astatus);
				
				int i = ps.executeUpdate();
				if (i > 0)
				{
					response.sendRedirect("17_User_BookAp.jsp");
				}
        }
		 catch (Exception e)
        {
			e.printStackTrace();
		}
	}
}


