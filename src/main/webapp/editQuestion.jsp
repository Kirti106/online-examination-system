<%@ page import="com.onlineexam.dao.QuestionDAO" %>

<%
    int questionId = Integer.parseInt(request.getParameter("id"));
    QuestionDAO questionDAO = new QuestionDAO();
    String[] question = questionDAO.getQuestionById(questionId);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Question</title>

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
                max-width: 800px;
                margin: 40px auto;
            }

            .card {
                background: white;
                padding: 35px;
                border-radius: 18px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            }

            .form-group {
                margin-bottom: 20px;
            }

            label {
                display: block;
                font-weight: bold;
                margin-bottom: 8px;
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
            <h1>Edit Question</h1>
        </header>

        <div class="container">
            <div class="card">
                <% if (question != null) { %>
                    <form action="updateQuestion" method="post">
                        <input type="hidden" name="questionId" value="<%= question[0] %>">
                        <input type="hidden" name="examId" value="<%= question[1] %>">

                    <div class="form-group">
                        <label>Question</label>
                        <textarea name="questionText" required><%= question[2] %></textarea>
                    </div>

                    <div class="form-group">
                        <label>Option A</label>
                        <input type="text" name="optionA" value="<%= question[3] %>" required>
                    </div>

                    <div class="form-group">
                        <label>Option B</label>
                        <input type="text" name="optionB" value="<%= question[4] %>" required>
                    </div>

                    <div class="form-group">
                        <label>Option C</label>
                        <input type="text" name="optionC" value="<%= question[5] %>" required>
                    </div>

                    <div class="form-group">
                        <label>Option D</label>
                        <input type="text" name="optionD" value="<%= question[6] %>" required>
                    </div>


                    <div class="form-group">
                        <label>Correct Answer</label>
                        <select name="correctAnswer" required>
                            <option value="A"
                                <%= "A".equals(question[7]) ? "selected" : "" %>>
                                A
                            </option>

                            <option value="B"
                                <%= "B".equals(question[7]) ? "selected" : "" %>>
                                B
                            </option>

                            <option value="C"
                                <%= "C".equals(question[7]) ? "selected" : "" %>>
                                C
                            </option>

                            <option value="D"
                                <%= "D".equals(question[7]) ? "selected" : "" %>>
                                D
                            </option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Marks</label>
                        <input type="number" name="marks" value="<%= question[8] %>" min="1" required>
                    </div>

                    <button type="submit" class="btn">Update Question</button>
                    <a href="manageQuestions.jsp?examId=<%= question[1] %>" class="cancel">Cancel</a>
                </form>

                <% } else { %>
                    <h2>Question not found.</h2>
                    <a href="manageExams.jsp">Back</a>
                <% } %>
            </div>
        </div>
    </body>
</html>