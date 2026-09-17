package com.onlineexam.model;

public class Student extends User {
    private String course;
    public Student() {
        super();
        setRole("STUDENT");
    }

    public Student(
            int userId,
            String name,
            String email,
            String password,
            String course) {

        super(userId, name, email, password, "STUDENT");
        this.course = course;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public void displayStudentInfo() {

        System.out.println("Student Name: " + getName());
        System.out.println("Email: " + getEmail());
        System.out.println("Course: " + course);
        System.out.println("Role: " + getRole());
    }
}