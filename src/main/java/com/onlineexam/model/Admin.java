package com.onlineexam.model;

public class Admin extends User {
    private String adminCode;

    public Admin() {
        super();
        setRole("ADMIN");
    }

    public Admin(
            int userId,
            String name,
            String email,
            String password,
            String adminCode) {
        super(userId, name, email, password, "ADMIN");
        this.adminCode = adminCode;
    }

    public String getAdminCode() {
        return adminCode;
    }

    public void setAdminCode(String adminCode) {
        this.adminCode = adminCode;
    }

    public void displayAdminInfo() {
        System.out.println("Admin Name: " + getName());
        System.out.println("Email: " + getEmail());
        System.out.println("Role: " + getRole());
    }
}