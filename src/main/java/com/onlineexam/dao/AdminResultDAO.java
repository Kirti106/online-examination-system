package com.onlineexam.dao;
import com.onlineexam.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AdminResultDAO {
    public List<String[]> getAllResults() {
        List<String[]> results = new ArrayList<>();
        String sql =
                "SELECT r.result_id, " +
                "u.name, " +
                "u.email, " +
                "e.exam_name, " +
                "r.score, " +
                "r.percentage, " +
                "r.grade, " +
                "r.result_date " +
                "FROM results r " +
                "JOIN users u ON r.student_id = u.user_id " +
                "JOIN exams e ON r.exam_id = e.exam_id " +
                "ORDER BY r.result_date DESC";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery()
        ) {
            while (resultSet.next()) {
                String[] result = {
                    resultSet.getString("name"),
                    resultSet.getString("email"),
                    resultSet.getString("exam_name"),
                    String.valueOf(resultSet.getInt("score")),
                    String.format("%.2f", resultSet.getDouble("percentage")),

                    resultSet.getString("grade"),
                    String.valueOf(resultSet.getTimestamp("result_date"))
                };
                results.add(result);
            }
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
        return results;
    }
}