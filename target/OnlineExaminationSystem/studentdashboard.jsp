<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background: #f4f6fb;
        }

        .header {
            background: #667eea;
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
        }

        .card {
            background: white;
            padding: 25px;
            width: 250px;
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
    </style>
</head>

<body>
    <div class="header">
        <h1>Student Dashboard</h1>
    </div>
    <div class="container">
        <div class="welcome">
            <h2>Welcome, Student! 👋</h2>
            <p>You can view and attempt available examinations from here.</p>
        </div>

        <div class="cards">
            <div class="card">
                <h2>Exams</h2>
                <p>View available examinations.</p>
                <a href="#" class="btn">View Exams</a>
            </div>
            <div class="card">
                <h2>Results</h2>
                <p>Check your examination results.</p>
                <a href="#" class="btn">View Results</a>
            </div>
        </div>
    </div>
</body>
</html>