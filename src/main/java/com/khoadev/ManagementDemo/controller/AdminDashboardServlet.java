package com.khoadev.ManagementDemo.controller;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AdminDashboardServlet extends HttpServlet{
    private static final long serialVersionUID =1L;

    protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(!"ADMIN".equals(session.getAttribute("role"))) {
            response.sendRedirect("/client/dashboard");
            return;
        }

        request.getRequestDispatcher("AdminDashboard.jsp").forward(request,response);
    }
}
