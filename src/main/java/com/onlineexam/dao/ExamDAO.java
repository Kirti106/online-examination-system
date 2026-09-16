package com.onlineexam.dao;
import com.onlineexam.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ExamDAO {
    public boolean addExam(String examName, String subject, int duration, int totalQuestions) {
        String sql = "INSERT INTO exams " + "(exam_name, subject, duration, total_questions) " + "VALUES (?, ?, ?, ?)";
        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setString(1, examName);
            statement.setString(2, subject);
            statement.setInt(3, duration);
            statement.setInt(4, totalQuestions);
            int rows = statement.executeUpdate();
            return rows > 0;
        } 
        catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<String[]> getAllExams() {
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

    public boolean deleteExam(int examId) {
        String sql = "DELETE FROM exams WHERE exam_id = ?";
        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setInt(1, examId);
            int rows = statement.executeUpdate();
            return rows > 0;
        } 
        catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateExam(int examId, String examName, String subject, int duration, int totalQuestions) {
        String sql = "UPDATE exams SET exam_name = ?, subject = ?, " + "duration = ?, total_questions = ? WHERE exam_id = ?";
        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setString(1, examName);
            statement.setString(2, subject);
            statement.setInt(3, duration);
            statement.setInt(4, totalQuestions);
            statement.setInt(5, examId);
            int rows = statement.executeUpdate();
            return rows > 0;
        } 
        catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public String[] getExamById(int examId) {
        String sql = "SELECT exam_id, exam_name, subject, " + "duration, total_questions FROM exams WHERE exam_id = ?";
        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setInt(1, examId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return new String[] {
                    String.valueOf(resultSet.getInt("exam_id")),
                    resultSet.getString("exam_name"),
                    resultSet.getString("subject"),
                    String.valueOf(resultSet.getInt("duration")),
                    String.valueOf(resultSet.getInt("total_questions"))
                };
            }
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}