package com.khoadev.ManagementDemo.utils;

import com.khoadev.ManagementDemo.service.SQLiteConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TestDB {
    public static void main(String[] args) {
        Connection con = SQLiteConnector.connect();
        if (con != null) {
            System.out.println("Connection successfull");
            String sql = "SELECT * FROM User";
            String s = "INSERT INTO User (first_name, last_name, email, password, role, phone_number, address) VALUES (?,?,?,?,?,?,?)";
            try {
                PreparedStatement ps = con.prepareStatement(sql);
//                PreparedStatement ps = con.prepareStatement(s);
//                ps.setString(1,"Hà Quang");
//                ps.setString(2, "Minh");
//                ps.setString(3, "minh123@gmail.com");
//                ps.setString(4, "12345678");
//                ps.setString(5, "USER");
//                ps.setString(6, "123456678");
//                ps.setString(7, "Hà Đông");
//                ps.executeUpdate();
//                System.out.println("Insert Data Successfully!");

                ResultSet rs = ps.executeQuery();
                while (rs.next())
                    System.out.println(rs.getString("first_name") + " "
                                    + rs.getString("last_name") + " - "
                                    + rs.getString("email") + " - "
                                    + rs.getString("password") + " - "
                                    + rs.getString("role") + " - "
                                    + rs.getString("phone_number") + " - "
                                    + rs.getString("address"));
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("No Connection!");
        }
    }
}