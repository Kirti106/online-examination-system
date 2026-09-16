package com.onlineexam.dao;
import com.onlineexam.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class QuestionDAO {
    public boolean addQuestion(
            int examId, String questionText, String optionA, String optionB, String optionC, String optionD, String correctAnswer, int marks) {
        String sql = "INSERT INTO questions " +
                     "(exam_id, question_text, option_a, option_b, " +
                     "option_c, option_d, correct_answer, marks) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setInt(1, examId);
            statement.setString(2, questionText);
            statement.setString(3, optionA);
            statement.setString(4, optionB);
            statement.setString(5, optionC);
            statement.setString(6, optionD);
            statement.setString(7, correctAnswer);
            statement.setInt(8, marks);
            int rows = statement.executeUpdate();
            return rows > 0;
        } 
        catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<String[]> getQuestionsByExam(int examId) {
        List<String[]> questions = new ArrayList<>();
        String sql = "SELECT question_id, question_text, " +
                     "option_a, option_b, option_c, option_d, " +
                     "correct_answer, marks " +
                     "FROM questions WHERE exam_id = ?";
        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setInt(1, examId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String[] question = {
                    String.valueOf( resultSet.getInt("question_id")),
                    resultSet.getString("question_text"),
                    resultSet.getString("option_a"),
                    resultSet.getString("option_b"),
                    resultSet.getString("option_c"),
                    resultSet.getString("option_d"),
                    resultSet.getString("correct_answer"),
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

    public boolean deleteQuestion(int questionId) {
        String sql = "DELETE FROM questions WHERE question_id = ?";
        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setInt(1, questionId);
            int rows = statement.executeUpdate();
            return rows > 0;
        } 
        catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public String[] getQuestionById(int questionId) {
        String sql = "SELECT question_id, exam_id, question_text, " +
                    "option_a, option_b, option_c, option_d, " +
                    "correct_answer, marks " +
                    "FROM questions WHERE question_id = ?";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement =connection.prepareStatement(sql)
        ) {
            statement.setInt(1, questionId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return new String[] {
                    String.valueOf(resultSet.getInt("question_id")),
                    String.valueOf(resultSet.getInt("exam_id")),

                    resultSet.getString("question_text"),
                    resultSet.getString("option_a"),
                    resultSet.getString("option_b"),
                    resultSet.getString("option_c"),
                    resultSet.getString("option_d"),
                    resultSet.getString("correct_answer"),

                    String.valueOf(resultSet.getInt("marks"))
                };
            }
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateQuestion(
        int questionId,
        String questionText,
        String optionA,
        String optionB,
        String optionC,
        String optionD,
        String correctAnswer,
        int marks) {

    String sql = "UPDATE questions SET question_text = ?, " +
                 "option_a = ?, option_b = ?, option_c = ?, " +
                 "option_d = ?, correct_answer = ?, marks = ? " +
                 "WHERE question_id = ?";

    try (
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql)
    ) {

        statement.setString(1, questionText);
        statement.setString(2, optionA);
        statement.setString(3, optionB);
        statement.setString(4, optionC);
        statement.setString(5, optionD);
        statement.setString(6, correctAnswer);
        statement.setInt(7, marks);
        statement.setInt(8, questionId);

        int rows = statement.executeUpdate();

        return rows > 0;

    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}
}