package com.khoadev.ManagementDemo.controller;

import com.khoadev.ManagementDemo.dao.UserDAO;
import com.khoadev.ManagementDemo.model.Roles;
import com.khoadev.ManagementDemo.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/AccountServlet")
public class AccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO = new UserDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException {
        String action = request.getParameter("action");

        List<User> userList = userDAO.getAllUser();

        request.setAttribute("userList", userList);

        request.getRequestDispatcher("AccountServlet.jsp").forward(request, response);
    }

    private void showAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String role = request.getParameter("role");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");

    }

    private void createAccount(HttpServletRequest request, HttpServletResponse response) {

    }

    private void updateAccount(HttpServletRequest request, HttpServletResponse response) {

    }

    private void deleteAccount(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        userDAO.Delete(id);
    }

    public List<User> getAllUsers() {
        List<User> userList = new ArrayList<>();

        try {
            Class.forName("org.sqlite.JDBC");
            String url = "jdbc:sqlite:D:\\$$$$$\\TaskManagement_Java_JSP-Servlet\\ManagementDemo\\StaffDb.db";
            Connection connection = DriverManager.getConnection(url);

            String sql = "SELECT * FROM User";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String role = rs.getString("role");
                String address = rs.getString("address");
                String phoneNumber = rs.getString("phoneNumber");
                String token = rs.getString("token");

                User user = new User(id, firstName, lastName, email, password, role, address, phoneNumber, token);
                userList.add(user);
            }
            rs.close();
            ps.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }


}
