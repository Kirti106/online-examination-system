<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background: #f4f6fb;
        }

        .header {
            background: #333;
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
            flex-wrap: wrap;
        }

        .card {
            background: white;
            padding: 25px;
            width: 230px;
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
    </style>
</head>

<body>
    <div class="header">
        <h1>Admin Dashboard</h1>
    </div>

    <div class="container">
        <div class="welcome">
            <h2>Welcome, Administrator! 👋</h2>
            <p>Manage examinations, questions, students and results.</p>
        </div>
        <div class="cards">
            <div class="card">
                <h2>Exams</h2>
                <p>Create and manage examinations.</p>
                <a href="manageExams.jsp" class="btn">Manage Exams</a>
            </div>
            <div class="card">
                <h2>Questions</h2>
                <p>Add and manage exam questions.</p>
                <a href="#" class="btn">Manage Questions</a>
            </div>
            <div class="card">
                <h2>Students</h2>
                <p>View registered students.</p>
                <a href="#" class="btn">View Students</a>
            </div>
            <div class="card">
                <h2>Results</h2>
                <p>View student examination results.</p>
                <a href="admindashboard.jsp" class="results-btn">View Student Results</a>
            </div>
        </div>
    </div>
</body>
</html>