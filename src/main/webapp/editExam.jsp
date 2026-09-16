<%@ page import="com.onlineexam.dao.ExamDAO" %>
<%
    String id = request.getParameter("id");
    ExamDAO examDAO = new ExamDAO();
    String[] exam = examDAO.getExamById(Integer.parseInt(id));
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Exam</title>

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
                width: 80%;
                max-width: 700px;
                margin: 50px auto;
            }

            .card {
                background: white;
                padding: 35px;
                border-radius: 18px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            }

            h2 {
                margin-bottom: 25px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            label {
                display: block;
                font-weight: bold;
                margin-bottom: 8px;
            }

            input {
                width: 100%;
                box-sizing: border-box;
                padding: 13px;
                border: 1px solid #ccc;
                border-radius: 8px;
                font-size: 16px;
            }

            .btn {
                background: #6378e8;
                color: white;
                border: none;
                padding: 13px 25px;
                border-radius: 8px;
                font-size: 16px;
                cursor: pointer;
            }

            .btn:hover {
                background: #4f63d4;
            }

            .cancel {
                margin-left: 10px;
                text-decoration: none;
                color: #555;
            }

        </style>
    </head>

    <body>
    <header>
        <h1>Edit Exam</h1>
    </header>

    <div class="container">
        <div class="card">
            <h2>Update Exam Details</h2>
            <% if (exam != null) { %>
            <form action="updateExam" method="post">
                <input type="hidden" name="examId" value="<%= exam[0] %>">
                <div class="form-group">
                    <label>Exam Name</label>
                    <input type="text" name="examName" value="<%= exam[1] %>" required>
                </div>

                <div class="form-group">
                    <label>Subject</label>
                    <input type="text" name="subject" value="<%= exam[2] %>" required>
                </div>

                <div class="form-group">
                    <label>Duration (minutes)</label>
                    <input type="number" name="duration" value="<%= exam[3] %>" min="1" required>
                </div>

                <div class="form-group">
                    <label>Total Questions</label>
                    <input type="number" name="totalQuestions" value="<%= exam[4] %>" min="1" required>
                </div>

                <button type="submit" class="btn">Update Exam</button>
                    <a href="manageExams.jsp" class="cancel">Cancel</a>
            </form>

            <% } else { %>
                <h2>Exam not found.</h2>
                <a href="manageExams.jsp">Back to Manage Exams</a>
            <% } %>
        </div>
    </div>
    </body>
</html>