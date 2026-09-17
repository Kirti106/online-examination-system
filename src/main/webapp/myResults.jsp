<%@ page import="java.util.List" %>
<%@ page import="com.onlineexam.dao.StudentResultDAO" %>

<%
    String role = (String) session.getAttribute("role");
    if (!"STUDENT".equals(role)) {
        response.sendRedirect("index.jsp");
        return;
    }
    Integer userId =(Integer) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    StudentResultDAO resultDAO = new StudentResultDAO();
    List<String[]> results = resultDAO.getResultsByStudent(userId);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>My Results</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background: #f4f6fb;
                margin: 0;
            }

            header {
                background: #6378e8;
                color: white;
                padding: 25px;
                text-align: center;
            }

            .container {
                width: 90%;
                max-width: 1000px;
                margin: 40px auto;
            }

            .result-card {
                background: white;
                padding: 25px;
                border-radius: 15px;
                box-shadow: 0 8px 25px rgba(0,0,0,0.08);
                overflow-x: auto;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th {
                background: #6378e8;
                color: white;
                padding: 14px;
                text-align: left;
            }

            td {
                padding: 14px;
                border-bottom: 1px solid #ddd;
            }

            tr:hover {
                background: #f7f8fc;
            }

            .grade {
                font-weight: bold;
            }

            .no-results {
                text-align: center;
                padding: 40px;
                color: #666;
            }

            .back-btn {
                display: inline-block;
                margin-top: 25px;
                padding: 12px 22px;
                background: #6378e8;
                color: white;
                text-decoration: none;
                border-radius: 8px;
            }

            .back-btn:hover {
                background: #4f63d4;
            }
        </style>
    </head>

    <body>
        <header>
            <h1>My Results</h1>
            <p>View your previous examination results</p>
        </header>

        <div class="container">
            <div class="result-card">

                <% if (results.isEmpty()) { %>
                    <div class="no-results">
                        <h2>No Results Yet</h2>
                        <p>You have not completed any exams yet.</p>
                    </div>
                    <% } else { %>
                        <table>
                            <tr>
                                <th>Exam</th>
                                <th>Score</th>
                                <th>Percentage</th>
                                <th>Grade</th>
                                <th>Date</th>
                            </tr>
        
                            <%    
                            for (String[] result : results) {
                                %>
                                <tr>
                                    <td><%= result[1] %></td>
                                    <td><%= result[2] %></td>
                                    <td><%= result[3] %>%</td>
                                    <td class="grade"><%= result[4] %></td>
                                    <td><%= result[5] %></td>

                                </tr>
                                <%
                            }
                            %>
                        </table>
                        <% } %>
                            <a href="studentdashboard.jsp" class="back-btn">
                                Back to Dashboard
                            </a>
            </div>
        </div>
    </body>
</html>