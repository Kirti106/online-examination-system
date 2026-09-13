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
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString("role");
            }
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}