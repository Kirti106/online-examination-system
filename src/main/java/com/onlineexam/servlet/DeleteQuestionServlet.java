package com.onlineexam.servlet;
import com.onlineexam.dao.QuestionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteQuestion")
public class DeleteQuestionServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int questionId = Integer.parseInt(request.getParameter("questionId"));
        int examId = Integer.parseInt(request.getParameter("examId"));
        QuestionDAO questionDAO = new QuestionDAO();
        boolean success =questionDAO.deleteQuestion(questionId);

        if (success) {
            response.sendRedirect("manageQuestions.jsp?examId=" + examId + "&success=deleted");
        } 
        else {
            response.sendRedirect("manageQuestions.jsp?examId=" + examId + "&error=deletefailed");
        }
    }
}