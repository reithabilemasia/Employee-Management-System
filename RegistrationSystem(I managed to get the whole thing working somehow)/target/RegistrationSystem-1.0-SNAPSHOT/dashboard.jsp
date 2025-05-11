<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.mycompany.registrationsystem.ConnectionProvider1" %> <!-- Updated package path -->

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 80%;
        }
        h1 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            text-decoration: none;
            color: #fff;
            background-color: #007bff;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
            // Ensure user is logged in
            String userEmail = (String) session.getAttribute("userEmail");
            if (userEmail == null) {
                response.sendRedirect("login.jsp"); // Redirect if not logged in
                return;
            }
        %>
        
        <h1>Welcome to the Dashboard, <%= userEmail %>!</h1>

        <!-- Display Employee Table -->
        <table>
            <thead>
                <tr>
                    <th>Employee ID</th>
                    <th>Full Name</th>
                    <th>Department</th>
                    <th>Role</th>
                    <th>Email</th>
                    <th>Phone</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;

                    try {
                        // Get connection
                        ConnectionProvider1 connectionProvider = new ConnectionProvider1();
                        conn = connectionProvider.getCon();
                        
                        if (conn != null) {
                            String sql = "SELECT empid, fullname, empDepartment, role, empEmail, empPhone FROM public.tblemployee";
                            stmt = conn.prepareStatement(sql);
                            rs = stmt.executeQuery();

                            while (rs.next()) {
                %>
                                <tr>
                                    <td><%= rs.getString("empid") %></td>
                                    <td><%= rs.getString("fullname") %></td>
                                    <td><%= rs.getString("empDepartment") %></td>
                                    <td><%= rs.getString("role") %></td>
                                    <td><%= rs.getString("empEmail") %></td>
                                    <td><%= rs.getString("empPhone") %></td>
                                </tr>
                <%
                            }
                        } else {
                            out.println("<p>Database connection failed.</p>");
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                        out.println("<p>Error retrieving employee data: " + e.getMessage() + "</p>");
                    } finally {
                        // Close resources
                        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                        if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
                    }
                %>
            </tbody>
        </table>

        <!-- Logout Link -->
        <a href="login.jsp">Logout</a>
    </div>
</body>
</html>
