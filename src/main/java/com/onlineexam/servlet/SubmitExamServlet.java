package com.onlineexam.servlet;
import com.onlineexam.dao.ResultDAO;
import com.onlineexam.dao.EvaluationDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/submitExam")
public class SubmitExamServlet extends HttpServlet {
    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int examId = Integer.parseInt(request.getParameter("examId"));
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        Map<Integer, String> answers = new HashMap<>();

        for (String parameterName :
                request.getParameterMap().keySet()) {
            if (parameterName.startsWith("answer_")) {
                String questionIdText = parameterName.substring(7);
                int questionId = Integer.parseInt(questionIdText);
                String selectedAnswer = request.getParameter(parameterName);

                answers.put(questionId,selectedAnswer
                );
            }
        }

        EvaluationDAO evaluationDAO = new EvaluationDAO();

        int score = evaluationDAO.calculateScore(examId, userId, answers);

        int totalMarks = evaluationDAO.getTotalMarks(examId);

        double percentage = 0;

        if (totalMarks > 0) {
            percentage =((double) score / totalMarks) * 100;
        }

        String grade;
        if (percentage >= 90) {
            grade = "A+";
        } 
        else if (percentage >= 80) {
            grade = "A";
        } 
        else if (percentage >= 70) {
            grade = "B";
        } 
        else if (percentage >= 60) {
            grade = "C";
        } 
        else if (percentage >= 50) {
            grade = "D";
        } 
        else {
            grade = "F";
        }

        ResultDAO resultDAO = new ResultDAO();
        boolean saved = resultDAO.saveResult(userId, examId, score, percentage, grade);

        if (!saved) {
            System.out.println("WARNING: Result was not saved.");
        }

        session.setAttribute("examId", examId);
        session.setAttribute("score", score);
        session.setAttribute("answers", answers);

        response.sendRedirect("result.jsp");
    }
}