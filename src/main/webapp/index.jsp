<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Examination System</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            width: 400px;
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }

        .login-container h1 {
            text-align: center;
            margin-bottom: 10px;
            color: #333;
        }

        .login-container p {
            text-align: center;
            color: #777;
            margin-bottom: 30px;
        }

        .error-message {
            color: #d32f2f;
            background: #ffebee;
            border: 1px solid #ef9a9a;
            padding: 10px;
            border-radius: 6px;
            text-align: center;
            margin-bottom: 15px;
            font-weight: bold;
        }

        .success-message {
            color: #2e7d32;
            background: #e8f5e9;
            border: 1px solid #81c784;
            padding: 10px;
            border-radius: 6px;
            text-align: center;
            margin-bottom: 15px;
            font-weight: bold;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 7px;
            font-weight: bold;
            color: #444;
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
        }

        .form-group input:focus {
            outline: none;
            border-color: #667eea;
        }

        .login-btn {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 8px;
            background: #667eea;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .login-btn:hover {
            background: #5568d8;
        }

        .register {
            text-align: center;
            margin-top: 20px;
            color: #666;
        }

        .register a {
            color: #667eea;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>

<body>
    <div class="login-container">
        <h1>Online Examination</h1>
        <p>Login to continue</p>

        <%
            String error = request.getParameter("error");
            String registered = request.getParameter("registered");

            if ("invalid".equals(error)) {
        %>
            <p class="error-message">
                Invalid email or password. Please try again.
            </p>
        <%
            } else if ("empty".equals(error)) {
        %>
            <p class="error-message">
                Email and password cannot be empty.
            </p>
        <%
            } else if ("success".equals(registered)) {
        %>
            <p class="success-message">
                Registration successful! You can now login.
            </p>
        <%
            }
        %>

        <form action="login" method="post">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>

            <button type="submit" class="login-btn">Login</button>
        </form>

        <div class="register"> Don't have an account?
            <a href="register.jsp">Register</a>
        </div>
    </div>
</body>
</html>