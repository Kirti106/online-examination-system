<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.onlineexam.util.DBConnection" %>

<%
    String role = (String) session.getAttribute("role");
    if (!"ADMIN".equals(role)) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>

    <head>
        <title>View Students</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background: #f4f6ff;
                margin: 0;
                padding: 30px;
            }

            .container {
                width: 90%;
                margin: auto;
                background: white;
                padding: 30px;
                border-radius: 12px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            }

            h2 {
                text-align: center;
                margin-bottom: 25px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 12px;
                border: 1px solid #ddd;
                text-align: center;
            }

            th {
                background: #6378e8;
                color: white;
            }

            tr:nth-child(even) {
                background: #f7f7f7;
            }

            .back-btn {
                display: inline-block;
                margin-top: 20px;
                padding: 10px 20px;
                background: #6378e8;
                color: white;
                text-decoration: none;
                border-radius: 7px;
            }

            .back-btn:hover {
                background: #4f63d4;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <h2>Registered Students</h2>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                </tr>

                <%
                    String sql =
                            "SELECT user_id, name, email " +
                            "FROM users " +
                            "WHERE role = 'STUDENT' " +
                            "ORDER BY user_id";
                    try (
                        Connection connection = DBConnection.getConnection();
                        PreparedStatement statement = connection.prepareStatement(sql);
                        ResultSet resultSet = statement.executeQuery()
                    ) {
                        while (resultSet.next()) {
                %>

                <tr>
                    <td>
                        <%= resultSet.getInt("user_id") %>
                    </td>

                    <td>
                        <%= resultSet.getString("name") %>
                    </td>

                    <td>
                        <%= resultSet.getString("email") %>
                    </td>
                </tr>

                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                %>

                <tr>
                    <td colspan="3">
                        Unable to load students.
                    </td>
                </tr>

                <%
                    }
                %>

            </table>
            <a href="admindashboard.jsp" class="back-btn">
                Back to Dashboard
            </a>
        </div>
    </body>
</html>