package com.onlineexam.servlet;
import com.onlineexam.dao.QuestionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/question")
public class QuestionServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int examId = Integer.parseInt(request.getParameter("examId"));
        String questionText = request.getParameter("questionText");
        String optionA = request.getParameter("optionA");
        String optionB = request.getParameter("optionB");
        String optionC = request.getParameter("optionC");
        String optionD = request.getParameter("optionD");
        String correctAnswer = request.getParameter("correctAnswer");
        int marks = Integer.parseInt( request.getParameter("marks"));
        
        QuestionDAO questionDAO = new QuestionDAO();

        boolean success = questionDAO.addQuestion(examId, questionText, optionA, optionB, optionC, optionD, correctAnswer, marks);
        if (success) {
            response.sendRedirect("manageQuestions.jsp?examId=" + examId + "&success=added");
        } 
        else {
            response.sendRedirect("manageQuestions.jsp?examId=" + examId + "&error=failed");
        }
    }
}