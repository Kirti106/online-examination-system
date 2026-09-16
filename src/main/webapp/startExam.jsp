<%@ page import="java.util.List" %>
<%@ page import="com.onlineexam.dao.StudentQuestionDAO" %>
<%@ page import="com.onlineexam.dao.ExamDAO" %>

<%
    int examId = Integer.parseInt(request.getParameter("examId"));
    ExamDAO examDAO = new ExamDAO();
    String[] exam = examDAO.getExamById(examId);
    StudentQuestionDAO questionDAO = new StudentQuestionDAO();
    List<String[]> questions = questionDAO.getQuestionsByExam(examId);
%>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>Start Exam</title>
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
                max-width: 900px;
                margin: 35px auto;
            }

            .exam-info {
                background: white;
                padding: 25px;
                border-radius: 15px;
                margin-bottom: 25px;
                box-shadow: 0 8px 25px rgba(0,0,0,0.08);
            }

            .question-card {
                background: white;
                padding: 25px;
                border-radius: 15px;
                margin-bottom: 20px;
                box-shadow: 0 8px 25px rgba(0,0,0,0.08);
            }

            .question {
                font-size: 18px;
                font-weight: bold;
                margin-bottom: 18px;
            }

            .option {
                display: block;
                padding: 12px;
                margin: 8px 0;
                border: 1px solid #ddd;
                border-radius: 8px;
                cursor: pointer;
            }

            .option:hover {
                background: #f4f6fb;
            }

            .submit-btn {
                background: #6378e8;
                color: white;
                border: none;
                padding: 14px 30px;
                border-radius: 8px;
                font-size: 16px;
                cursor: pointer;
            }

            .submit-btn:hover {
                background: #4f63d4;
            }

            .no-questions {
                background: white;
                padding: 30px;
                border-radius: 15px;
                text-align: center;
            }

        </style>
    </head>

    <body>
        <header>
            <% if (exam != null) { %>
                <h1><%= exam[1] %></h1>
                <p>
                    Subject: <%= exam[2] %>
                    |
                    Duration: <%= exam[3] %> minutes
                </p>
            <% } %>
        </header>

        <div class="container">
            <% if (questions.isEmpty()) { %>
                <div class="no-questions">
                    <h2>No questions available</h2>
                    <p>
                        The administrator has not added questions
                        to this exam yet.
                    </p>
                </div>
            <% } else { %>

            <form action="submitExam" method="post">
                <input type="hidden" name="examId" value="<%= examId %>">

                <div class="exam-info">
                    <h2>Instructions</h2>
                    <p>• Answer all questions.</p>
                    <p>• Select one option for each question.</p>
                    <p>• Submit the exam after completing all questions.</p>
                    <p>
                        Total Questions:
                        <strong><%= questions.size() %></strong>
                    </p>
                </div>

                <% int questionNumber = 1; %>
                <% for (String[] question : questions) { %>
                <div class="question-card">
                    <div class="question">
                        Q<%= questionNumber %>.
                        <%= question[1] %>
                    </div>

                    <label class="option">
                        <input type="radio" name="answer_<%= question[0] %>" value="A">
                        A. <%= question[2] %>
                    </label>

                    <label class="option">
                        <input type="radio" name="answer_<%= question[0] %>" value="B">
                        B. <%= question[3] %>
                    </label>

                    <label class="option">
                        <input type="radio" name="answer_<%= question[0] %>" value="C">
                        C. <%= question[4] %>
                    </label>

                    <label class="option">
                        <input type="radio" name="answer_<%= question[0] %>" value="D">
                        D. <%= question[5] %>
                    </label>
                </div>

                <% questionNumber++; %>
                <% } %>

                <button type="submit" class="submit-btn">
                    Submit Exam
                </button>
            </form>
            <% } %>
        </div>
    </body>
</html>