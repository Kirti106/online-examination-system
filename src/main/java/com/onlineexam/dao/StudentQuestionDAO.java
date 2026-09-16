package com.onlineexam.dao;
import com.onlineexam.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StudentQuestionDAO {
    public List<String[]> getQuestionsByExam(int examId) {
        List<String[]> questions = new ArrayList<>();
        String sql = "SELECT question_id, question_text, " +
                     "option_a, option_b, option_c, option_d, marks " +
                     "FROM questions WHERE exam_id = ? " +
                     "ORDER BY question_id";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setInt(1, examId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String[] question = {
                    String.valueOf(resultSet.getInt("question_id")),
                    resultSet.getString("question_text"),
                    resultSet.getString("option_a"),
                    resultSet.getString("option_b"),
                    resultSet.getString("option_c"),
                    resultSet.getString("option_d"),
                    String.valueOf(resultSet.getInt("marks"))
                };
                questions.add(question);
            }
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
        return questions;
    }
}