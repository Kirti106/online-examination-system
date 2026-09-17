package com.onlineexam.dao;
import com.onlineexam.util.DBConnection;

import com.onlineexam.exception.InvalidLoginException;
import com.onlineexam.exception.EmptyFieldException;
import com.onlineexam.exception.EmailAlreadyExistsException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    public String validateUser(String email, String password) throws InvalidLoginException, EmptyFieldException {
        if (email == null || email.trim().isEmpty()
                || password == null || password.trim().isEmpty()) {
            throw new EmptyFieldException(
                "Email and password cannot be empty"
            );
        }

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
                throw new InvalidLoginException("Invlid email or password");
            }
        }
        catch (InvalidLoginException e) {
            throw e;
        } 
        catch (Exception e) {
            System.out.println("DATABASE ERROR:");
            e.printStackTrace();
        }
        return null;
    }

    public int getUserIdByEmail(String email) {
        String sql = "SELECT user_id FROM users WHERE email = ?";
        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setString(1, email);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt("user_id");
            }
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public boolean registerStudent(String name, String email, String password) throws EmailAlreadyExistsException{
        String sql =
                "INSERT INTO users (name, email, password, role) " +
                "VALUES (?, ?, ?, 'STUDENT')";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, password);

            int rows = statement.executeUpdate();
            return rows > 0;
        } 
        catch (java.sql.SQLIntegrityConstraintViolationException e) {
            throw new EmailAlreadyExistsException("Email already registered");
        }
        catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}