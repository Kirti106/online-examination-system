package com.onlineexam.dao;
import com.onlineexam.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    public String validateUser(String email, String password) {
        String sql = "SELECT role FROM users WHERE email = ? AND password = ?";
        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setString(1, email);
            statement.setString(2, password);
            System.out.println("Login email received: " + email);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String role = resultSet.getString("role");
                System.out.println("LOGIN SUCCESS - Role: " + role);
                return role;
            } 
            else {
                System.out.println("LOGIN FAILED - No matching user found.");
            }
        } 
        catch (Exception e) {
            System.out.println("DATABASE ERROR:");
            e.printStackTrace();
        }
        return null;
    }
}