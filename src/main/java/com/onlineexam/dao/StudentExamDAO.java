package com.onlineexam.dao;
import com.onlineexam.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StudentExamDAO {
    public List<String[]> getAvailableExams() {
        List<String[]> exams = new ArrayList<>();
        String sql = "SELECT exam_id, exam_name, subject, " + "duration, total_questions FROM exams";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery()
        ) {
            while (resultSet.next()) {
                String[] exam = {
                    String.valueOf(resultSet.getInt("exam_id")),
                    resultSet.getString("exam_name"),
                    resultSet.getString("subject"),
                    String.valueOf(resultSet.getInt("duration")),
                    String.valueOf(resultSet.getInt("total_questions"))
                };
                exams.add(exam);
            }
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
        return exams;
    }
}