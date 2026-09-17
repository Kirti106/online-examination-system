<%
    String role = (String) session.getAttribute("role");
    if (!"STUDENT".equals(role)) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<%@ page import="java.util.List" %>
<%@ page import="com.onlineexam.dao.StudentQuestionDAO" %>
<%@ page import="com.onlineexam.dao.ExamDAO" %>
<%@ page import="com.onlineexam.thread.ExamTimer" %>

<%
    int examId = Integer.parseInt(request.getParameter("examId"));
    ExamDAO examDAO = new ExamDAO();
    String[] exam = examDAO.getExamById(examId);
    int duration = Integer.parseInt(exam[3]);
    ExamTimer examTimer = new ExamTimer(duration);
    examTimer.start();

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

            .timer-box {
                text-align: center;
                font-size: 24px;
                font-weight: bold;
                padding: 15px;
                margin: 20px 0;
                background: #ffffff;
                color: #333333;
                border: 2px solid #6378e8;
                border-radius: 10px;
                box-shadow: 0 3px 8px rgba(0 ,0 ,0 , 0.015);
            }
            @timer {
                color: #d32f2f;
                font-size: 26px;
                font-weight: bold;
                margin-left: 8px;
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
                <div class="timer-box">
                    Time Remaining:
                    <span id="timer">00:00</span>
                </div>
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

            <form id="examForm" action="submitExam" method="post">
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

        <script>
            let timeRemaining = <%= duration %> * 60;
            const timer = document.getElementById("timer");
            const countdown = setInterval(function() {
                let minutes = Math.floor(timeRemaining / 60);
                let seconds = timeRemaining % 60;
                minutes = String(minutes).padStart(2, '0');
                seconds = String(seconds).padStart(2, '0');
                timer.textContent = minutes + ":" + seconds;
                if (timeRemaining <= 0) {
                    clearInterval(countdown);
                    alert("Time is up! Your exam will be submitted.");
                    document.getElementById("examForm").submit();
                }
                timeRemaining--;
            }, 1000);
        </script>
    </body>
</html>