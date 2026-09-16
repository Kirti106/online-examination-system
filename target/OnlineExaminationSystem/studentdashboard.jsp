<%@ page import="java.util.List" %>
<%@ page import="com.onlineexam.dao.StudentExamDAO" %>

<%
    StudentExamDAO examDAO = new StudentExamDAO();
    List<String[]> exams = examDAO.getAvailableExams();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Student Dashboard</title>

        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                background: #f4f6fb;
            }

            .header {
                background: #667eea;
                color: white;
                padding: 20px 40px;
            }

            .header h1 {
                margin: 0;
            }

            .container {
                padding: 40px;
            }

            .welcome {
                background: white;
                padding: 25px;
                border-radius: 12px;
                margin-bottom: 25px;
                box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            }

            .cards {
                display: flex;
                gap: 20px;
            }

            .card {
                background: white;
                padding: 25px;
                width: 250px;
                border-radius: 12px;
                box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            }

            .card h2 {
                color: #667eea;
            }

            .btn {
                display: inline-block;
                padding: 10px 18px;
                background: #667eea;
                color: white;
                text-decoration: none;
                border-radius: 7px;
            }

            .results-btn {
                display: inline-block;
                padding: 12px 22px;
                background: #6378e8;
                color: white;
                text-decoration: none;
                border-radius: 8px;
                margin: 10px;
            }

            .results-btn:hover {
                background: #4f63d4;
            }

            .exam-section {
                margin-top: 40px;
            }

            .exam-section h2 {
                margin-bottom: 25px;
            }

            .exam-container {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
                gap: 25px;
            }

            .exam-card {
                background: white;
                padding: 25px;
                border-radius: 15px;
                box-shadow: 0 8px 25px rgba(0,0,0,0.08);
            }

            .exam-card h3 {
                margin-top: 0;
                margin-bottom: 15px;
            }

            .exam-card p {
                margin: 10px 0;
            }

            .start-btn {
                display: inline-block;
                margin-top: 15px;
                padding: 11px 20px;
                background: #6378e8;
                color: white;
                text-decoration: none;
                border-radius: 7px;
            }

            .start-btn:hover {
                background: #4f63d4;
            }
        </style>
    </head>

    <body>
        <div class="header">
            <h1>Student Dashboard</h1>
        </div>
        <div class="container">
            <div class="welcome">
                <h2>Welcome, Student! 👋</h2>
                <p>You can view and attempt available examinations from here.</p>
            </div>

            <div class="cards">
                <div class="card">
                    <h2>Exams</h2>
                    <p>View available examinations.</p>
                    <a href="#" class="btn">View Exams</a>
                </div>
                <div class="card">
                    <h2>Results</h2>
                    <p>Check your examination results.</p>
                    <a href="myResults.jsp" class="results-btn">My Results</a>
                </div>
            </div>

            <div class="exam-section">
                <h2>Available Exams</h2>
                <% if (exams.isEmpty()) { %>
                    <p>No exams are currently available.</p>
                <% } else { %>
                    <div class="exam-container">
                        <% for (String[] exam : exams) { %>
                            <div class="exam-card">
                                <h3><%= exam[1] %></h3>
                                <p>
                                    <strong>Subject:</strong>
                                    <%= exam[2] %>
                                </p>
                                <p>
                                    <strong>Duration:</strong>
                                    <%= exam[3] %> minutes
                                </p>
                                <p>
                                    <strong>Questions:</strong>
                                    <%= exam[4] %>
                                </p>
                                <a href="startExam.jsp?examId=<%= exam[0] %>" class="start-btn">
                                    Start Exam
                                </a>
                            </div>
                        <% } %>
                    </div>
                <% } %>
            </div>
        </div>
    </body>
</html>