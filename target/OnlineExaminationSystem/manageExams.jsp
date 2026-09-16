<%@ page import="java.util.List" %>
<%@ page import="com.onlineexam.dao.ExamDAO" %>
<%
    ExamDAO examDAO = new ExamDAO();
    List<String[]> exams = examDAO.getAllExams();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Exams</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f6fb;
        }

        header {
            background: #303030;
            color: white;
            padding: 25px 50px;
        }

        header h1 {
            margin: 0;
        }

        .container {
            padding: 40px 50px;
        }

        .card {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
        }

        .btn {
            background: #637bea;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn:hover {
            background: #5068d8;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background: #f4f6fb;
        }

        .delete-btn {
            background: #e74c3c;
            color: white;
            border: none;
            padding: 8px 14px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
        }

        .delete-btn:hover {
            background: #c0392b;
        }

        .edit-btn {
            display: inline-block;
            background: #6378e8;
            color: white;
            text-decoration: none;
            padding: 8px 14px;
            border-radius: 6px;
            margin-right: 5px;
            font-size: 14px;
        }

        .edit-btn:hover {
            background: #4f63d4;
        }

        .question-btn {
            display: inline-block;
            background: #27ae60;
            color: white;
            text-decoration: none;
            padding: 8px 14px;
            border-radius: 6px;
            margin-right: 5px;
            font-size: 14px;
        }

        .question-btn:hover {
            background: #219150;
        }
    </style>
</head>

<body>
    <header>
        <h1>Manage Exams</h1>
    </header>
    <div class="container">
        <div class="card">
            <h2>Add New Exam</h2>
            <form action="exam" method="post">
                <div class="form-group">
                    <label>Exam Name</label>
                    <input type="text" name="examName" placeholder="Enter exam name" required>
                </div>

                <div class="form-group">
                    <label>Subject</label>
                    <input type="text" name="subject" placeholder="Enter subject" required>
                </div>

                <div class="form-group">
                    <label>Duration (minutes)</label>
                    <input type="number" name="duration" min="1" placeholder="Enter duration" required>
                </div>

                <div class="form-group">
                    <label>Total Questions</label>
                    <input type="number" name="totalQuestions" min="1" placeholder="Enter number of questions" required>
                </div>

                <button type="submit" class="btn"> Add Exam </button>
            </form>
        </div>
        <div class="card">
            <h2>Existing Exams</h2>
             <% if (exams.isEmpty()) { %>
                <p>No exams available.</p>
            <% } else { %>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Exam Name</th>
                        <th>Subject</th>
                        <th>Duration</th>
                        <th>Questions</th>
                        <th>Action</th>
                    </tr>
                    <% for (String[] exam : exams) { %>
                    <tr>
                        <td><%= exam[0] %></td>
                        <td><%= exam[1] %></td>
                        <td><%= exam[2] %></td>
                        <td><%= exam[3] %> min</td>
                        <td><%= exam[4] %></td>

                        <td>
                            <a href="editExam.jsp?id=<%= exam[0] %>" class="edit-btn">Edit</a>
                            <form action="deleteExam" method="post"
                                    onsubmit="return confirm('Are you sure you want to delete this exam?');" style="display:inline;">
                                <input type="hidden" name="examId" value="<%= exam[0] %>">
                                <button type="submit" class="delete-btn">Delete</button>
                            </form>
                            <a href="manageQuestions.jsp?examId=<%= exam[0] %>" class="question-btn">Questions</a>
                        </td>
                    </tr>
                    <% } %>
                </table>
            <% } %>
        </div>
    </div>
</body>
</html>