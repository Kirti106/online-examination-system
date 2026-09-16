<%@ page import="java.util.List" %>
<%@ page import="com.onlineexam.dao.QuestionDAO" %>
<%@ page import="com.onlineexam.dao.ExamDAO" %>

<%
    int examId = Integer.parseInt(request.getParameter("examId"));
    ExamDAO examDAO = new ExamDAO();
    String[] exam = examDAO.getExamById(examId);
    QuestionDAO questionDAO = new QuestionDAO();
    List<String[]> questions = questionDAO.getQuestionsByExam(examId);
%>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>Manage Questions</title>

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
                max-width: 1100px;
                margin: 40px auto;
            }

            .card {
                background: white;
                padding: 30px;
                border-radius: 18px;
                margin-bottom: 30px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            }

            h2 {
                margin-top: 0;
            }

            .form-group {
                margin-bottom: 18px;
            }

            label {
                display: block;
                font-weight: bold;
                margin-bottom: 7px;
            }

            input,
            textarea,
            select {
                width: 100%;
                box-sizing: border-box;
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 8px;
                font-size: 15px;
            }

            textarea {
                height: 100px;
                resize: vertical;
            }

            .btn {
                background: #6378e8;
                color: white;
                border: none;
                padding: 12px 22px;
                border-radius: 8px;
                cursor: pointer;
                font-size: 15px;
            }

            .btn:hover {
                background: #4f63d4;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th,
            td {
                padding: 13px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background: #f4f6fb;
            }

            .edit-btn {
                display: inline-block;
                background: #6378e8;
                color: white;
                text-decoration: none;
                padding: 8px 12px;
                border-radius: 6px;
                margin-right: 5px;
                font-size: 14px;
            }

            .edit-btn:hover {
                background: #4f63d4;
            }

            .delete-btn {
                background: #e74c3c;
                color: white;
                border: none;
                padding: 8px 12px;
                border-radius: 6px;
                cursor: pointer;
                font-size: 14px;
            }

            .delete-btn:hover {
                background: #c0392b;
            }

            .back {
                display: inline-block;
                margin-top: 20px;
                text-decoration: none;
                color: #6378e8;
                font-weight: bold;
            }
        </style>
    </head>

    <body>
        <header>
            <h1>Manage Questions</h1>
            <% if (exam != null) { %>
                <p>Exam: <%= exam[1] %></p>
            <% } %>
        </header>

        <div class="container">
            <div class="card">
                <h2>Add New Question</h2>
                <form action="question" method="post">
                    <input type="hidden" name="examId" value="<%= examId %>">

                    <div class="form-group">
                        <label>Question</label>
                        <textarea name="questionText" placeholder="Enter question" required></textarea>
                    </div>

                    <div class="form-group">
                        <label>Option A</label>
                        <input type="text" name="optionA" required>
                    </div>

                    <div class="form-group">
                        <label>Option B</label>
                        <input type="text" name="optionB" required>
                    </div>

                    <div class="form-group">
                        <label>Option C</label>
                        <input type="text" name="optionC" required>
                    </div>

                    <div class="form-group">
                        <label>Option D</label>
                        <input type="text" name="optionD" required>
                    </div>

                    <div class="form-group">
                        <label>Correct Answer</label>
                        <select name="correctAnswer" required>
                            <option value="">Select Answer</option>
                            <option value="A">A</option>
                            <option value="B">B</option>
                            <option value="C">C</option>
                            <option value="D">D</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Marks</label>
                        <input type="number" name="marks" min="1" value="1" required>
                    </div>

                    <button type="submit" class="btn">Add Question</button>
                </form>
            </div>

            <div class="card">
                <h2>Existing Questions</h2>
                <% if (questions.isEmpty()) { %>
                    <p>No questions added yet.</p>
                <% } else { %>
                    <table>
                        <tr>
                            <th>ID</th>
                            <th>Question</th>
                            <th>Option A</th>
                            <th>Option B</th>
                            <th>Option C</th>
                            <th>Option D</th>
                            <th>Answer</th>
                            <th>Marks</th>
                            <th>Action</th>
                        </tr>
                        <% for (String[] question : questions) { %>
                        <tr>
                            <td><%= question[0] %></td>
                            <td><%= question[1] %></td>
                            <td><%= question[2] %></td>
                            <td><%= question[3] %></td>
                            <td><%= question[4] %></td>
                            <td><%= question[5] %></td>
                            <td><%= question[6] %></td>
                            <td><%= question[7] %></td>
                            <td>
                                <a href="editQuestion.jsp?id=<%= question[0] %>" class="edit-btn">
                                    Edit
                                </a>
                                <form action="deleteQuestion" method="post" style="display:inline;"
                                     onsubmit="return confirm('Are you sure you want to delete this question?');">

                                    <input type="hidden" name="questionId" value="<%= question[0] %>">
                                    <input type="hidden" name="examId" value="<%= examId %>">
                                    <button type="submit" class="delete-btn">
                                        Delete
                                    </button>
                                </form>
                            </td>
                        </tr>
                        <% } %>
                    </table>
                <% } %>
            </div>
            <a href="manageExams.jsp" class="back">← Back to Manage Exams</a>
        </div>
    </body>
</html>