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
import ds.vaishu.db.User;

/**
 * Servlet implementation class _04_User_Login
 */
public class _04_User_Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public _04_User_Login() {
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

        try {
            String uemail = request.getParameter("uemail");
            String upassword = request.getParameter("upassword");

            Connection con = ConnectDB.dbCon();
            User.setUemail(uemail);

            PreparedStatement ps = con.prepareStatement("select * from user where uemail=? and upassword=?");
            ps.setString(1, uemail);
            ps.setString(2, upassword);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) 
            {
                
               
            	User.setUid(rs.getInt("uid"));
                User.setUname(rs.getString("uname"));
                User.setUdesg(rs.getString("udesg"));
                User.setUdep(rs.getString("udep"));
                User.setCname(rs.getString("cname"));
                User.setUcontact(rs.getString("ucontact"));
                User.setUadd(rs.getString("uadd"));
                User.setUemail(rs.getString("uemail"));
                User.setUpassword(rs.getString("upassword"));

                
               
                response.sendRedirect("01_User_Welcome.html");
            } 
            else 
            {
                
                response.sendRedirect("index.html");
            }

        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
