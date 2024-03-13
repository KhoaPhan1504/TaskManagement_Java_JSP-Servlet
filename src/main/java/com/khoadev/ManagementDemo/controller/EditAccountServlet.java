package com.khoadev.ManagementDemo.controller;

import com.khoadev.ManagementDemo.dao.UserDAO;
import com.khoadev.ManagementDemo.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/EditAccountServlet")
public class EditAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
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

            String sql =  "UPDATE User SET first_name=?, last_name=?, email=?, password=?, role=?, phone_number=?, address=? WHERE id =?";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, firstName);
                ps.setString(2, lastName);
                ps.setString(3, email);
                ps.setString(4, password);
                ps.setString(5, role);
                ps.setString(6, phoneNumber);
                ps.setString(7, address);
                ps.setInt(8, id);
                ps.executeUpdate();
            }

            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    private void showEditModal(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userID = Integer.parseInt(request.getParameter("id"));
        User user = userDAO.getUserById(userID);

    }
}
