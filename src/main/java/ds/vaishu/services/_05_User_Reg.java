package ds.vaishu.services;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ds.vaishu.db.ConnectDB;


/**
 * Servlet implementation class _05_User_Reg
 */
public class _05_User_Reg extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public _05_User_Reg() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
        
        try {
            int uid = 0;
            String uname = request.getParameter("uname");
            String udesg = request.getParameter("udesg");
            String udep = request.getParameter("udep");
            String cname = request.getParameter("cname");
            String ucontact = request.getParameter("ucontact");
            String uadd = request.getParameter("uadd");
            String uemail = request.getParameter("uemail");
            String upassword = request.getParameter("upassword");
            
            Connection con = ConnectDB.dbCon();
            PreparedStatement ps = con.prepareStatement("INSERT INTO user (uid, uname, udesg, udep, cname, ucontact, uadd, uemail, upassword) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
            
            ps.setInt(1, uid);
            ps.setString(2, uname);
            ps.setString(3, udesg);
            ps.setString(4, udep);
            ps.setString(5, cname);
            ps.setString(6, ucontact);
            ps.setString(7, uadd);
            ps.setString(8, uemail);
            ps.setString(9, upassword);
            
            int i = ps.executeUpdate();
            
            if (i > 0) {
                response.sendRedirect("01_User_Welcome.html");
            } else {
                response.sendRedirect("error.html");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
