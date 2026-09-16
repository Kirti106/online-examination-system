<%@ page import="java.util.List" %>
<%@ page import="com.onlineexam.dao.AdminResultDAO" %>

<%
    String role = (String) session.getAttribute("role");

    if (!"ADMIN".equals(role)) {
        response.sendRedirect("index.jsp");
        return;
    }

    AdminResultDAO resultDAO = new AdminResultDAO();

    List<String[]> results =
            resultDAO.getAllResults();
%>

<!DOCTYPE html>
<html>
<head>

    <title>Admin Results</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background: #f4f6fb;
            margin: 0;
            padding: 30px;
        }

        .container {
            width: 95%;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 25px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 14px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background: #6378e8;
            color: white;
        }

        tr:nth-child(even) {
            background: #f8f9fc;
        }

        .back-btn {
            display: inline-block;
            margin-top: 25px;
            padding: 12px 20px;
            background: #555;
            color: white;
            text-decoration: none;
            border-radius: 8px;
        }

        .back-btn:hover {
            background: #333;
        }

        .no-results {
            text-align: center;
            padding: 30px;
            color: #777;
        }

    </style>

</head>

<body>

<div class="container">

    <h1>📊 Student Results</h1>

    <% if (results.isEmpty()) { %>

        <div class="no-results">
            <h3>No results available yet.</h3>
        </div>

    <% } else { %>

        <table>

            <tr>
                <th>Student Name</th>
                <th>Email</th>
                <th>Exam</th>
                <th>Score</th>
                <th>Percentage</th>
                <th>Grade</th>
                <th>Date</th>
            </tr>

            <% for (String[] result : results) { %>

                <tr>

                    <td><%= result[0] %></td>

                    <td><%= result[1] %></td>

                    <td><%= result[2] %></td>

                    <td><%= result[3] %></td>

                    <td><%= result[4] %>%</td>

                    <td><%= result[5] %></td>

                    <td><%= result[6] %></td>

                </tr>

            <% } %>

        </table>

    <% } %>

    <a href="admindashboard.jsp" class="back-btn">
        ← Back to Dashboard
    </a>

</div>

</body>
</html>