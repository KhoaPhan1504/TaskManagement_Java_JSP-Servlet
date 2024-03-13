package com.khoadev.ManagementDemo.controller;

import com.khoadev.ManagementDemo.dao.UserDAO;
import com.khoadev.ManagementDemo.model.User;
import com.khoadev.ManagementDemo.service.Email;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/EmailSendingServlet")
public class EmailSendingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private String host;
    private String port;
    private String user;
    private String pass;

    public void init() {
        ServletContext context = getServletContext();
        host = context.getInitParameter("smtp.gmail.com");
        port = context.getInitParameter("587");
        user = context.getInitParameter("Khoahttt01@gmail.com");
        pass = context.getInitParameter("riebdznhlleokpgt");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = request.getParameter("token");
        String newPassword = request.getParameter("newPassword");

        String recipient = request.getParameter("recipient");
        String subject = "Your temporary password details";
        //String content = "<a href='http://localhost:8081/ManagementDemo/ForgotPassword.jsp'>Click on Link</a>";
        String content = "Hello! I am sending this message from a servlet! Happy days.";

//        if(token == null || token.trim().isEmpty() || newPassword == null || newPassword.trim().isEmpty()) {
//            response.sendRedirect("ResetPassword.jps?error=emptyFields");
//            return;
//        }
//
//        UserDAO userDAO = new UserDAO();
//        User user = userDAO.getUserByResetToken(token);

        String resultMessage="";

        try {
            Email.sendMail(host, port, user, pass, recipient, subject, content);
            resultMessage = "The email was sent successfully";
        } catch (Exception e) {
            e.printStackTrace();
            resultMessage = "There is an error\t" + e.getMessage();
        } finally {
            request.setAttribute("Message", resultMessage);
            getServletContext().getRequestDispatcher("/Result.jsp").forward(request, response);
        }

    }
}
