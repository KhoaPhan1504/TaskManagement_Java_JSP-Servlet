package com.khoadev.ManagementDemo.dao;

import com.khoadev.ManagementDemo.model.Task;
import com.khoadev.ManagementDemo.service.SQLiteConnector;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TaskDAO {
    private static final String URL = "jdbc:sqlite:D:\\$$$$$\\TaskManagement_Java_JSP-Servlet\\ManagementDemo\\StaffDb.db";

    public TaskDAO() {
    }

    public List<Task> getAllTasks() {
        List<Task> tasks = new ArrayList<>();
        try(Connection connection = SQLiteConnector.connect()) {
            String sql = "SELECT * FROM Task";
            try(PreparedStatement ps = connection.prepareStatement(sql)) {
                ResultSet rs = ps.executeQuery();
                while(rs.next()) {
                    Task task = new Task();
                    task.setTaskID(rs.getInt("task_id"));
                    task.setTaskName(rs.getString("task_name"));
                    task.setTaskType(rs.getString("task_type"));
                    task.setCreatedDate(rs.getDate("created_date"));
                    task.setEndedDate(rs.getDate("ended_date"));
                    task.setTaskDescription(rs.getString("task_description"));
//                    task.setUserID(rs.getInt("user_id"));
                    task.setTaskParentID(rs.getInt("task_parent_id"));
                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public void createTask(Task task) {
        try {
            Class.forName("org.sqlite.JDBC");
            try (Connection connection = DriverManager.getConnection(URL)) {
                String sql = "INSERT INTO Task (task_name, task_type, created_date, ended_date, task_description, user_id, task_parent_id) VALUES (?,?,?,?,?,?,?)";
                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                    preparedStatement.setString(1, task.getTaskName());
                    preparedStatement.setString(2, task.getTaskType());
                    preparedStatement.setString(3, String.valueOf(task.getCreatedDate()));
                    preparedStatement.setString(4, String.valueOf(task.getEndedDate()));
                    preparedStatement.setString(5, task.getTaskDescription());
                    preparedStatement.setString(6, String.valueOf(task.getUserID()));
                    preparedStatement.setString(7, String.valueOf(task.getTaskParentID()));
                    preparedStatement.executeUpdate();
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public void readTask(Task task) {

    }

    public void updateTask(Task task) {

    }

        public void deleteTask(Task task) {

    }
}
