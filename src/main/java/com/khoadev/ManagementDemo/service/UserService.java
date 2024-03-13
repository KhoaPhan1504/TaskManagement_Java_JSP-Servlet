package com.khoadev.ManagementDemo.service;

import com.khoadev.ManagementDemo.model.User;

import java.util.ArrayList;
import java.util.List;

public class UserService {
    private static List<User> userList = new ArrayList<>();

    public void registerUser(User user) {
        userList.add(user);
    }

    public boolean checkLogin(String email, String password) {
        for(User user : userList) {
            if(user.getEmail().equals(email) && user.getPassword().equals(password)) {
                return true;
            }
        }
        return  false;
    }
}
