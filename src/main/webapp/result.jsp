<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="com.onlineexam.dao.ExamDAO" %>
<%@ page import="com.onlineexam.dao.EvaluationDAO" %>

<%
    Integer score = (Integer) session.getAttribute("score");
    Integer examId = (Integer) session.getAttribute("examId");

    Map<Integer, String> answers =(Map<Integer, String>) session.getAttribute("answers");

    if (score == null || examId == null || answers == null) {
        response.sendRedirect("studentdashboard.jsp");
        return;
    }

    ExamDAO examDAO = new ExamDAO();
    String[] exam = examDAO.getExamById(examId);

    EvaluationDAO evaluationDAO = new EvaluationDAO();
    int totalMarks = evaluationDAO.getTotalMarks(examId);
    List<String[]> details = evaluationDAO.getAnswerDetails(examId, answers);  

    double percentage = 0;
    if (totalMarks > 0) {
        percentage =((double) score / totalMarks) * 100;
    }

    String grade;
    if (percentage >= 90) {
        grade = "A+";
    } else if (percentage >= 80) {
        grade = "A";
    } else if (percentage >= 70) {
        grade = "B";
    } else if (percentage >= 60) {
        grade = "C";
    } else if (percentage >= 50) {
        grade = "D";
    } else {
        grade = "F";
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Exam Result</title>
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

            .result-card {
                background: white;
                padding: 35px;
                border-radius: 18px;
                text-align: center;
                box-shadow: 0 8px 25px rgba(0,0,0,0.08);
                margin-bottom: 30px;
            }

            .score {
                font-size: 45px;
                font-weight: bold;
                margin: 20px 0;
            }

            .details {
                font-size: 18px;
                line-height: 1.8;
            }

            .grade {
                font-size: 28px;
                font-weight: bold;
            }

            .review-title {
                margin-bottom: 20px;
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
                margin-bottom: 15px;
            }

            .answer {
                margin: 8px 0;
            }

            .correct {
                border-left: 6px solid #28a745;
            }

            .wrong {
                border-left: 6px solid #dc3545;
            }

            .status {
                font-weight: bold;
                margin-top: 15px;
            }

            .correct-text {
                color: #28a745;
            }

            .wrong-text {
                color: #dc3545;
            }

            .dashboard-btn {
                display: inline-block;
                margin-top: 20px;
                padding: 13px 25px;
                background: #6378e8;
                color: white;
                text-decoration: none;
                border-radius: 8px;
            }

            .dashboard-btn:hover {
                background: #4f63d4;
            }

        </style>

    </head>

    <body>
        <header>
            <h1>Exam Result</h1>
            <% if (exam != null) { %>
                <p><%= exam[1] %></p>
            <% } %>
        </header>

        <div class="container">

            <div class="result-card">
                <h2>Exam Completed!</h2>
                <p>Your answers have been evaluated automatically.</p>
            
                <div class="score">
                    <%= score %> / <%= totalMarks %>
                </div>

                <div class="details">
                    <p>
                        <strong>Percentage:</strong>
                        <%= String.format("%.2f", percentage) %>%
                    </p>

                    <p>
                        <strong>Grade:</strong>
                        <span class="grade">
                            <%= grade %>
                        </span>
                    </p>
                </div>
            </div>

            <h2 class="review-title">Answer Review</h2>
        
            <%
                int questionNumber = 1;
                for (String[] detail : details) {

                    String questionId = detail[0];
                    String questionText = detail[1];

                    String selectedAnswer = detail[2];
                    String selectedText = detail[3];

                    String correctAnswer = detail[4];
                    String correctText = detail[5];

                    String status = detail[6];

                    boolean isCorrect ="Correct".equals(status);
            %>

            <div class="question-card
                <%= isCorrect ? "correct" : "wrong" %>">

                <div class="question">
                    Q<%= questionNumber %>. <%= questionText %>
                </div>

                <div class="answer">
                    <strong>Your Answer:</strong>
                    <% if (selectedAnswer != null) { %>
                    <%= selectedAnswer %>. <%= selectedText %>
                    <% } else { %>
                        Not Answered
                    <% } %>
                </div>

                <% if (isCorrect) { %>
                    <div class="status correct-text">
                        ✓ Correct Answer
                    </div>

                <% } else { %>
                    <div class="answer">
                        <strong>Correct Answer:</strong>
                        <span class="correct-text">
                            <%= correctAnswer %>. <%= correctText %>
                        </span>
                    </div>

                    <div class="status wrong-text">
                        ✗ Wrong Answer
                    </div>
        
                    <% } %>
                </div>
            
                <%
                    questionNumber++;
            
                }
                %>
        
                <div style="text-align:center;">
                    <a href="studentdashboard.jsp" class="dashboard-btn">
                        Back to Dashboard
                    </a>
                </div>
            </div>
    </body>
</html>