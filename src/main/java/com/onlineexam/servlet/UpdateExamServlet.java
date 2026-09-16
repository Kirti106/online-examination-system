package com.onlineexam.servlet;
import com.onlineexam.dao.ExamDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updateExam")
public class UpdateExamServlet extends HttpServlet {
    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        int examId = Integer.parseInt(request.getParameter("examId"));
        String examName = request.getParameter("examName");
        String subject = request.getParameter("subject");
        int duration = Integer.parseInt(request.getParameter("duration"));
        int totalQuestions = Integer.parseInt(request.getParameter("totalQuestions"));
        ExamDAO examDAO = new ExamDAO();
        boolean success = examDAO.updateExam(examId, examName, subject, duration, totalQuestions);
        if (success) {
            response.sendRedirect("manageExams.jsp?success=updated");
        }
        else {
            response.sendRedirect("manageExams.jsp?error=updatefailed");
        }
    }
}