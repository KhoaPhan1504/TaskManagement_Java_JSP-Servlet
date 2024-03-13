package com.khoadev.ManagementDemo.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/CreateTaskServlet")
public class CreateTaskServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String taskName = request.getParameter("taskName");
        String taskType = request.getParameter("taskType");
        String createdDate = request.getParameter("createdDate");
        String endedDate = request.getParameter("endedDate");
        String taskDescription = request.getParameter("taskDescription");
        int userID = Integer.parseInt(request.getParameter("userID"));
        int taskParentID = Integer.parseInt(request.getParameter("taskParentID"));

        try {
            Connection connection = DriverManager.getConnection("jdbc:sqlite:D:\\$$$$$\\TaskManagement_Java_JSP-Servlet\\ManagementDemo\\StaffDb.db");

            String sql = "INSERT INTO User (task_name, task_type, created_date, ended_date, task_description, user_id, task_parent_id) VALUES (?,?,?,?,?,?,?)";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, taskName);
                ps.setString(2, taskType);
                ps.setString(3, createdDate);
                ps.setString(4, endedDate);
                ps.setString(5, taskDescription);
                ps.setInt(6, userID);
                ps.setInt(7, taskParentID);
                ps.executeUpdate();
            }

            boolean addTask = performCreateTask(taskName, taskType, createdDate, endedDate, taskDescription, userID, taskParentID);
            if(addTask) {
                response.sendRedirect("TaskManagement.jsp");
            } else {
                response.sendRedirect("CreateTask.jsp");
            }

            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private boolean performCreateTask(String taskName, String taskType, String createdDate, String endedDate, String taskDescription, int userID, int taskParentID) {

        return true;
    }
}
