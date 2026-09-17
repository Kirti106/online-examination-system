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

    public List<String[]> getAnswerDetails(int examId, Map<Integer, String> answers) {
        List<String[]> details = new ArrayList<>();
        String sql =
                "SELECT question_id, question_text, " +
                "option_a, option_b, option_c, option_d, " +
                "correct_answer, marks " +
                "FROM questions " +
                "WHERE exam_id = ? " +
                "ORDER BY question_id";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setInt(1, examId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int questionId = resultSet.getInt("question_id");
                String questionText = resultSet.getString("question_text");
                String optionA = resultSet.getString("option_a");
                String optionB = resultSet.getString("option_b");
                String optionC = resultSet.getString("option_c");
                String optionD = resultSet.getString("option_d");
                String correctAnswer = resultSet.getString("correct_answer");
                String selectedAnswer = answers.get(questionId);
                String selectedText = "Not Attempted";
                String correctText = "";

                if (selectedAnswer != null) {
                    if (selectedAnswer.equals("A")) {
                        selectedText = optionA;
                    } 
                    else if (selectedAnswer.equals("B")) {
                        selectedText = optionB;
                    } 
                    else if (selectedAnswer.equals("C")) {
                        selectedText = optionC;
                    } 
                    else if (selectedAnswer.equals("D")) {
                        selectedText = optionD;
                    }
                }

                if (correctAnswer.equals("A")) {
                    correctText = optionA;
                } 
                else if (correctAnswer.equals("B")) {
                    correctText = optionB;
                } 
                else if (correctAnswer.equals("C")) {
                    correctText = optionC;
                } 
                else if (correctAnswer.equals("D")) {
                    correctText = optionD;
                }

                String status;
                if (selectedAnswer == null) {
                    status = "Not Attempted";
                } 
                else if (selectedAnswer.equals(correctAnswer)) {
                    status = "Correct";
                } 
                else {
                    status = "Wrong";
                }

                String[] detail = { String.valueOf(questionId),
                    questionText, selectedAnswer == null ? "-" : selectedAnswer,
                    selectedText, correctAnswer, correctText, status
                };
                details.add(detail);
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