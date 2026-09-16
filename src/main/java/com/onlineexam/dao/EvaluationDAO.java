package com.onlineexam.dao;
import com.onlineexam.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class EvaluationDAO {
    public int calculateScore(int examId, int userId, Map<Integer, String> answers) {
        int score = 0;
        String sql = "SELECT correct_answer, marks " +
                     "FROM questions " +
                     "WHERE question_id = ? AND exam_id = ?";
        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            for (Integer questionId : answers.keySet()) {
                String selectedAnswer = answers.get(questionId);
                statement.setInt(1, questionId);
                statement.setInt(2, examId);
                ResultSet resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    String correctAnswer = resultSet.getString("correct_answer");
                    int marks = resultSet.getInt("marks");
                    if (selectedAnswer.equals(correctAnswer)) {
                        score += marks;
                    }
                }
            }
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
        return score;
    }

    public List<String[]> getAnswerDetails( int examId, Map<Integer, String> answers) {
        List<String[]> details = new ArrayList<>();

        String sql = "SELECT question_id, question_text, " +
                     "option_a, option_b, option_c, option_d, " +
                     "correct_answer, marks " +
                     "FROM questions " +
                     "WHERE question_id = ? AND exam_id = ?";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            for (Integer questionId : answers.keySet()) {
                statement.setInt(1, questionId);
                statement.setInt(2, examId);
                ResultSet resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    String selectedAnswer = answers.get(questionId);
                    String correctAnswer = resultSet.getString("correct_answer");
                    String selectedText = "";

                    if ("A".equals(selectedAnswer)) {
                        selectedText = resultSet.getString("option_a");
                    } 
                    else if ("B".equals(selectedAnswer)) {
                        selectedText = resultSet.getString("option_b");
                    } 
                    else if ("C".equals(selectedAnswer)) {
                        selectedText = resultSet.getString("option_c");
                    } 
                    else if ("D".equals(selectedAnswer)) {
                        selectedText = resultSet.getString("option_d");
                    }

                    String correctText = "";
                    if ("A".equals(correctAnswer)) {
                        correctText = resultSet.getString("option_a");
                    } 
                    else if ("B".equals(correctAnswer)) {
                        correctText = resultSet.getString("option_b");
                    } 
                    else if ("C".equals(correctAnswer)) {
                        correctText = resultSet.getString("option_c");
                    } 
                    else if ("D".equals(correctAnswer)) {
                        correctText = resultSet.getString("option_d");
                    }

                    String status;
                    if (selectedAnswer.equals(correctAnswer)) {
                        status = "Correct";
                    } 
                    else {
                        status = "Wrong";
                    }

                    details.add(new String[] {
                        String.valueOf( resultSet.getInt("question_id")),
                        resultSet.getString("question_text"),
                        selectedAnswer,
                        selectedText,
                        correctAnswer,
                        correctText,
                        status
                    });
                }
            }
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
        return details;
    }

    public int getTotalMarks(int examId) {
        int totalMarks = 0;
        String sql =
                "SELECT SUM(marks) AS total_marks " +
                "FROM questions WHERE exam_id = ?";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setInt(1, examId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                totalMarks = resultSet.getInt("total_marks");
            }
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
        return totalMarks;
    }
}