package com.onlineexam.dao;

import com.onlineexam.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Map;

public class AnswerDAO {
    public boolean saveAnswers(int studentId, int examId,
            Map<Integer, String> answers) {

        String sql =
                "INSERT INTO answers " +
                "(student_id, exam_id, question_id, selected_answer) " +
                "VALUES (?, ?, ?, ?)";

        try (
            Connection connection = DBConnection.getConnection();

            PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            for (Map.Entry<Integer, String> entry : answers.entrySet()) {
                statement.setInt(1, studentId);
                statement.setInt(2, examId);
                statement.setInt(3, entry.getKey());
                statement.setString(4, entry.getValue());
                statement.addBatch();
            }
            statement.executeBatch();
            return true;
        } 
        catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}