package com.onlineexam.servlet;
import com.onlineexam.dao.ExamDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/exam")
public class ExamServlet extends HttpServlet {
    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        String examName = request.getParameter("examName");
        String subject = request.getParameter("subject");
        int duration = Integer.parseInt(request.getParameter("duration"));
        int totalQuestions = Integer.parseInt(request.getParameter("totalQuestions"));
        ExamDAO examDAO = new ExamDAO();
        boolean success = examDAO.addExam(examName, subject, duration, totalQuestions);
        if (success) {
            response.sendRedirect("manageExams.jsp?success=added");
        } 
        else {
            response.sendRedirect("manageExams.jsp?error=failed");
        }
    }
}