package com.onlineexam.servlet;
import com.onlineexam.dao.UserDAO;

import jakarta.servlet.ServletException;
import com.onlineexam.exception.EmailAlreadyExistsException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        try {
            boolean registered = userDAO.registerStudent( name, email, password);
            if (registered) {
                response.sendRedirect("index.jsp?registered=success");
            } 
            else {
                response.sendRedirect("register.jsp?error=failed");
            }
        } 
        catch (EmailAlreadyExistsException e) {
            response.sendRedirect("register.jsp?error=exists");
        }
    }
}