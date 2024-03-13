package com.khoadev.ManagementDemo.dao;

import com.khoadev.ManagementDemo.model.Roles;
import com.khoadev.ManagementDemo.model.User;
import com.khoadev.ManagementDemo.service.SQLiteConnector;

import java.sql.*;
import java.util.*;

public class UserDAO {
    private static final String URL = "jdbc:sqlite:D:\\$$$$$\\TaskManagement_Java_JSP-Servlet\\ManagementDemo\\StaffDb.db";
    private Roles role;

    public UserDAO() {

    }

    private static Map<String, User> users = new HashMap<>();

    public  List<User> getAllUser() {
        List<User> users = new ArrayList<>();
        try(Connection connection = SQLiteConnector.connect()){
            String sql = "SELECT * FROM User";
            try(PreparedStatement ps = connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
                while(rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("user_id"));
                    user.setFirstName(rs.getString("first_name"));
                    user.setLastName(rs.getString("last_name"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password"));
                    if (rs.getString("role").equals("ADMIN") ) {
                        user.setRole(Roles.ADMIN);
                    } else if(rs.getString("role").equals("LEADER")) {
                        user.setRole(Roles.LEADER);
                    } else if(rs.getString("role").equals("SUB_LEADER")) {
                        user.setRole(Roles.SUB_LEADER);
                    } else {
                        user.setRole(Roles.USER);
                    }
                    user.setAddress(rs.getString("address"));
                    user.setPhoneNumber(rs.getString("phone_number"));
                    users.add(user);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public void Insert(User user) {
        // Add User to DB
        try {
            Class.forName("org.sqlite.JDBC");
            try (Connection connection = DriverManager.getConnection(URL)) {
                String sql = "INSERT INTO User (first_name, last_name, email, password, role, phone_number, address) VALUES (?,?,?,?,?,?,?)";
                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                    preparedStatement.setString(1, user.getFirstName());
                    preparedStatement.setString(2, user.getLastName());
                    preparedStatement.setString(3, user.getEmail());
                    preparedStatement.setString(4, user.getPassword());
                    preparedStatement.setString(5, String.valueOf(user.getRole()));
                    preparedStatement.setString(6, user.getPhoneNumber());
                    preparedStatement.setString(7, user.getAddress());
                    preparedStatement.executeUpdate();
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        // Create & Save Token
        String token = generateToken();
        saveToken(user.getEmail(), token);
        user.setToken(token);
    }

    public void Update(User user) {
        try {
            Class.forName("org.sqlite.JDBC");
            try (Connection connection = DriverManager.getConnection(URL)) {
                String sql = "UPDATE User SET first_name=?, last_name=?, email=?, password=?, role=?, phone_number=?, address=? WHERE id =?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                    preparedStatement.setString(1, user.getFirstName());
                    preparedStatement.setString(2, user.getLastName());
                    preparedStatement.setString(3, user.getEmail());
                    preparedStatement.setString(4, user.getPassword());
                    preparedStatement.setString(5, String.valueOf(user.getRole()));
                    preparedStatement.setString(6, user.getPhoneNumber());
                    preparedStatement.setString(7, user.getAddress());
                    preparedStatement.setInt(8,user.getId());
                    preparedStatement.executeUpdate();
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public void Delete(int id) {
        try {
            Class.forName("org.sqlite.JDBC");
            try (Connection connection = DriverManager.getConnection(URL)) {
                String sql = "DELETE FROM User WHERE id=?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                    preparedStatement.setInt(1, id);
                    preparedStatement.executeUpdate();
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

//    public static boolean Delete(int id) throws SQLException {
//        String sql = "DELETE FROM User WHERE id=?";
//        Connection connection = SQLiteConnector.connect();
//        PreparedStatement preparedStatement = connection.prepareStatement(sql);
//        preparedStatement.setInt(1, id);
//        preparedStatement.executeUpdate();
//        return true;
//    }

    public User loginUser(String email, String password) {
        try {
            Class.forName("org.sqlite.JDBC");
            try (Connection connection = DriverManager.getConnection(URL)) {
                String sql = "SELECT * FROM User WHERE email=? AND password=?";
                try (PreparedStatement ps = connection.prepareStatement(sql)) {
                    ps.setString(1, email);
                    ps.setString(2, password);

                    ResultSet rs = ps.executeQuery();

                    if (rs.next()) {
                        String role = rs.getString("role");
                        return new User(email, password, role);
                    } else {
                        return null;
                    }

                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    /** HANDLE TOKEN **/
    public static boolean isTokenValid(String email, String token) {
        if(token == null || token.isEmpty()) {
            return false;
        }

        try(Connection connection = getConnection();
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM Token WHERE email=? AND token=?")) {
            ps.setString(1, email);
            ps.setString(2, token);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private static void saveToken(String email, String token) {
        try(Connection connection = getConnection();
            PreparedStatement ps = connection.prepareStatement("INSERT INTO Token (email, token) VALUES (?,?)")) {
            ps.setString(1, email);
            ps.setString(2, token);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static Connection getConnection() throws SQLException {
        try {
            Class.forName("org.sqlite.JDBC");
            String url = "jdbc:sqlite:D:\\INTERN\\ManagementDemo\\StaffDb.db";
            return DriverManager.getConnection(url);
        } catch (ClassNotFoundException e) {
            throw new SQLException("JDBC Driver not found", e);
        }
    }

    private static String generateToken() {
        return UUID.randomUUID().toString();
    }

    public void updateResetToken(User user, String resetToken) {
        try {
            Class.forName("org.sqlite.JDBC");
            try(Connection connection = DriverManager.getConnection(URL)) {

            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public User getUserByResetToken(String resetToken) {
        try {
            Class.forName("org.sqlite.JDBC");
            try(Connection connection = DriverManager.getConnection(URL)) {
                String query = "SELECT * FROM Token WHERE token=?";
                try(PreparedStatement ps = connection.prepareStatement(query)) {
                    ps.setString(1, resetToken);
                    try(ResultSet rs = ps.executeQuery()) {
                        if(rs.next()) {
//                            return mapResultSetToUser(rs);
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

//    public List<User> getUsersByRole(String role) {
//        List<User> users = new ArrayList<>();
//
//        try {
//            Class.forName("org.sqlite.JDBC");
//            try(Connection connection = DriverManager.getConnection(URL)) {
//                String query = "SELECT * FROM User WHERE role=?";
//                try(PreparedStatement ps = connection.prepareStatement(query)) {
//                    ps.setString(1, role);
//                    try(ResultSet rs = ps.executeQuery()) {
//                        while (rs.next()) {
//                            User user = new User(
//                                    rs.getString("first_name"),
//                                    rs.getString("last_name"),
//                                    rs.getString("email"),
//                                    rs.getString("password"),
//                                    rs.getString("role"),
//                                    rs.getString("address"),
//                                    rs.getString("phone_number")
//                            );
//                            users.add(user);
//                        }
//                    }
//                }
//            }
//        } catch (ClassNotFoundException | SQLException e) {
//            e.printStackTrace();
//        }
//        return users;
//    }

    public User getUserById(int id) {
        List<User> users = new ArrayList<>();
        try {
            Class.forName("org.sqlite.JDBC");
            try(Connection connection = DriverManager.getConnection(URL)) {
                String query = "SELECT * FROM User WHERE id=?";
                try(PreparedStatement ps = connection.prepareStatement(query)) {
                    ps.setInt(1, id);
                    try(ResultSet rs = ps.executeQuery()) {
                        if(rs.next()) {
                            User user = new User();
                            user.setId(rs.getInt("id"));
                            user.setFirstName(rs.getString("first_name"));
                            user.setLastName(rs.getString("last_name"));
                            user.setEmail(rs.getString("email"));
                            user.setPassword(rs.getString("password"));
                            if (rs.getString("role").equals("ADMIN") ) {
                                user.setRole(Roles.ADMIN);
                            } else if(rs.getString("role").equals("LEADER")) {
                                user.setRole(Roles.LEADER);
                            } else if(rs.getString("role").equals("SUB_LEADER")) {
                                user.setRole(Roles.SUB_LEADER);
                            } else {
                                user.setRole(Roles.USER);
                            }
                            user.setAddress(rs.getString("address"));
                            user.setPhoneNumber(rs.getString("phone_number"));
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return (User) users;

    }

    public  List<Integer> getAllUserID() {
        List<Integer> userIDs = new ArrayList<>();
        try(Connection connection = SQLiteConnector.connect()){
            String sql = "SELECT user_id FROM User";
            try(PreparedStatement ps = connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
                while(rs.next()) {
                    int userID = rs.getInt("user_id");
                    userIDs.add(userID);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userIDs;
    }
}
