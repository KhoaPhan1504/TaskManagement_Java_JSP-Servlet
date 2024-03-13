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

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String role = request.getParameter("role");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");

        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPassword(password);
        user.setRole(Roles.valueOf(role));
        user.setAddress(address);
        user.setPhoneNumber(phoneNumber);


        UserDAO userDAO = new UserDAO();
        userDAO.Insert(user);



        boolean registrationSucess = performRegistration(firstName, lastName, email, password, role, address, phoneNumber);

        if(registrationSucess) {

            response.sendRedirect("RegistrationSuccess.jsp");
        } else {

            response.sendRedirect("Signup.jsp");
        }
    }

    private boolean performRegistration(String fistName, String lastName, String email, String password, String role, String address, String phoneNumber) {

        return true;
    }

}
