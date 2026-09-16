package com.onlineexam.servlet;
import com.onlineexam.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        UserDAO userDAO = new UserDAO();
        String role = userDAO.validateUser(email, password);
        if ("ADMIN".equals(role)) {
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
            session.setAttribute("role", "ADMIN");
            response.sendRedirect("admindashboard.jsp");
        } 
        else if ("STUDENT".equals(role)) {
            int userId = userDAO.getUserIdByEmail(email);
            HttpSession session = request.getSession();
            session.setAttribute("userId", userId);
            session.setAttribute("email", email);
            session.setAttribute("role", "STUDENT");

            response.sendRedirect("studentdashboard.jsp");
        } 
        else {
            response.sendRedirect("index.jsp?error=invalid");
        }
    }
}