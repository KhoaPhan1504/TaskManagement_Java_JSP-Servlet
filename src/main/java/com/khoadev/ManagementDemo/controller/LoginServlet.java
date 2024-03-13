package com.khoadev.ManagementDemo.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID =1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (authenticateUser(email, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
            session.setAttribute("role", getUserRole(email));
            System.out.println("Email in session: " + session.getAttribute("email"));
            System.out.println("Role in session: " + session.getAttribute("role"));

            String role = (String) session.getAttribute("role");
            if (role != null && role.equals("ADMIN")) {
                response.sendRedirect("AdminDashboard.jsp");
            } else if (role != null && role.equals("LEADER")) {
                response.sendRedirect("LeaderDashboard.jsp");
            } else if (role != null && role.equals("SUB_LEADER")) {
                response.sendRedirect("SubLeaderDashboard.jsp");
            } else if (role != null && role.equals("USER")) {
                response.sendRedirect("UserDashboard.jsp");
            } else {
                response.sendRedirect("Signin.jsp?error=1");
            }
        }
    }

    private boolean authenticateUser(String email, String password) {
       try {
           Class.forName("org.sqlite.JDBC");
           try (Connection connection = DriverManager.getConnection("jdbc:sqlite:D:\\$$$$$\\TaskManagement_Java_JSP-Servlet\\ManagementDemo\\StaffDb.db")){
               String sql = "SELECT * FROM User WHERE email=? AND password=?";
               try (PreparedStatement ps = connection.prepareStatement(sql)){
                   ps.setString(1, email);
                   ps.setString(2, password);
                   ResultSet rs = ps.executeQuery();
                   System.out.println("Trying to authenticate user: " + email);
                   System.out.println("Password: " + password);
                   return rs.next();

               }
           }
       } catch (ClassNotFoundException | SQLException e) {
           e.printStackTrace();
           return false;
       }
    }

    private String getUserRole(String roleName) {
        try (Connection connection = DriverManager.getConnection("jdbc:sqlite:D:\\$$$$$\\TaskManagement_Java_JSP-Servlet\\ManagementDemo\\StaffDb.db")){
            String sql = "SELECT role FROM User WHERE email=?";
            try(PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, roleName);
                System.out.println("Getting role for user: " + roleName);
                ResultSet rs = ps.executeQuery();
                if(rs.next()) {
                    return rs.getString("role");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
