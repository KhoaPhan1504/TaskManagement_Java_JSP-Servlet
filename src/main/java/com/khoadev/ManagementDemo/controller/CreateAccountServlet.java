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

@WebServlet("/CreateAccountServlet")
public class CreateAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String role = request.getParameter("role");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");

        try {
            Connection connection = DriverManager.getConnection("jdbc:sqlite:D:\\$$$$$\\TaskManagement_Java_JSP-Servlet\\ManagementDemo\\StaffDb.db");

            String sql = "INSERT INTO User (first_name, last_name, email, password, role, phone_number, address) VALUES (?,?,?,?,?,?,?)";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, firstName);
                ps.setString(2, lastName);
                ps.setString(3, email);
                ps.setString(4, password);
                ps.setString(5, role);
                ps.setString(6, phoneNumber);
                ps.setString(7, address);
                ps.executeUpdate();
            }

            boolean addAccount = performRegistration(firstName, lastName, email, password, role, address, phoneNumber);
            if(addAccount) {
                response.sendRedirect("AccountManagement.jsp");
            } else {
                response.sendRedirect("form-create-account.jsp");
            }

            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private boolean performRegistration(String fistName, String lastName, String email, String password, String role, String address, String phoneNumber) {

        return true;
    }
}
