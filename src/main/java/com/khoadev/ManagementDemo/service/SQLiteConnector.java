package com.khoadev.ManagementDemo.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SQLiteConnector {
    public static Connection connect() {
        try {
            Class.forName("org.sqlite.JDBC");
            String url = "jdbc:sqlite:D:\\$$$$$\\TaskManagement_Java_JSP-Servlet\\ManagementDemo\\StaffDb.db";
            return DriverManager.getConnection(url);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return  null;
        }
    }
}
