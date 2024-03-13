package com.khoadev.ManagementDemo.model;

public class User {
    private int id;
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private Roles role;
    private String address;
    private String phoneNumber;
    private String token;


    public User(int id, String firstName, String lastName, String email1, String s, String role, String address, String email, String password) {
    }

    public User(int id, String firstName, String lastName, String email, String password, Roles role, String address, String phoneNumber, String token) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.role = role;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.token = token;
    }

    public User(int id, String firstName, String lastName, String email, String password, String phoneNumer, String address, String token) {

    }

    public User(String email, String password, String role) {

    }

    public User() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Roles getRole() {
        return role;
    }

    public void setRole(Roles role) {
        this.role = role;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setRole(String role) {
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }
}
