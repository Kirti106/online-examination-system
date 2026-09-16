package com.onlineexam.dao;
import com.onlineexam.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class ResultDAO {
    public boolean saveResult(
            int studentId, int examId, int score, double percentage, String grade) {

        String sql =
                "INSERT INTO results " +
                "(student_id, exam_id, score, percentage, grade) " +
                "VALUES (?, ?, ?, ?, ?)";
        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setInt(1, studentId);
            statement.setInt(2, examId);
            statement.setInt(3, score);
            statement.setDouble(4, percentage);
            statement.setString(5, grade);

            int rows = statement.executeUpdate();
            return rows > 0;
        } 
        catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}