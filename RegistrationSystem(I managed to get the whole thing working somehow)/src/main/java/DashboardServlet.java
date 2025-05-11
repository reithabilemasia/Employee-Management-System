import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get session and validate user
        HttpSession session = request.getSession(false);
        
        String userEmail = (String) session.getAttribute("userEmail");

        // Use ConnectionProvider to fetch user data
        ConnectionProvider connectionProvider = new ConnectionProvider();
        try (Connection conn = connectionProvider.getCon()) {
            if (conn == null) {
                response.getWriter().println("Database connection failed.");
                return;
            }

            // Fetch user details
            String sql = "SELECT fullName, empDepartment, role FROM public.tblemployee WHERE empEmail = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, userEmail);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        request.setAttribute("fullName", rs.getString("fullName"));
                        request.setAttribute("department", rs.getString("empDepartment"));
                        request.setAttribute("role", rs.getString("role"));
                    }
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
            return;
        }

        // Forward to dashboard.jsp with user details
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
}
