<!DOCTYPE html>
<html>
    <head>
        <title>Student Registration</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background: #f4f6ff;
                margin: 0;
                padding: 0;
            }

            .container {
                width: 400px;
                margin: 60px auto;
                background: white;
                padding: 30px;
                border-radius: 12px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            }

            h2 {
                text-align: center;
                margin-bottom: 25px;
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

            label {
                display: block;
                margin-top: 15px;
                margin-bottom: 5px;
                font-weight: bold;
            }

            input {
                width: 100%;
                padding: 10px;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 6px;
            }

            button {
                width: 100%;
                padding: 12px;
                margin-top: 25px;
                background: #6378e8;
                color: white;
                border: none;
                border-radius: 7px;
                font-size: 16px;
                cursor: pointer;
            }

            button:hover {
                background: #4f63d4;
            }

            .login-link {
                text-align: center;
                margin-top: 20px;
            }

            .login-link a {
                color: #6378e8;
                text-decoration: none;
                font-weight: bold;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <h2>Student Registration</h2>

            <%
                String error = request.getParameter("error");

                if ("exists".equals(error)) {
            %>
                <p class="error-message">
                    Email already registered. Please use another email.
                </p>
            <%
                } else if ("failed".equals(error)) {
            %>
                <p class="error-message">
                    Registration failed. Please try again.
                </p>
            <%
                }
            %>

            <form action="register" method="post">
                <label>Name</label>
                <input type="text" name="name" required>

                <label>Email</label>
                <input type="email" name="email" required>

                <label>Password</label>
                <input type="password" name="password" required>

                <button type="submit">Register</button>
            </form>

            <div class="login-link">
                Already have an account?
                <a href="index.jsp">Login here</a>
            </div>
        </div>
    </body>
</html>