package com.onlineexam.servlet;
import com.onlineexam.dao.ExamDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteExam")
public class DeleteExamServlet extends HttpServlet {
    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        int examId = Integer.parseInt(request.getParameter("examId"));
        ExamDAO examDAO = new ExamDAO();
        boolean success = examDAO.deleteExam(examId);
        if (success) {
            response.sendRedirect("manageExams.jsp?success=deleted");
        } 
        else {
            response.sendRedirect("manageExams.jsp?error=deletefailed");
        }
    }
}