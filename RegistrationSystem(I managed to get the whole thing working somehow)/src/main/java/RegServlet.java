import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegServlet")
public class RegServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve form parameters
        String fullName = request.getParameter("fullName");
        String department = request.getParameter("empDepartment");
        String role = request.getParameter("role");
        String password = request.getParameter("empPassword");
        String email = request.getParameter("empEmail");
        String phone = request.getParameter("empPhone");

        // Use ConnectionProvider to get a connection
        ConnectionProvider connectionProvider = new ConnectionProvider();
        try (Connection conn = connectionProvider.getCon()) {
            if (conn == null) {
                response.getWriter().println("Database connection failed.");
                return;
            }

            // Prepare SQL insert query
            String sql = "INSERT INTO public.tblemployee (fullName, empDepartment, role, empPassword, empEmail, empPhone) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, fullName);
                stmt.setString(2, department);
                stmt.setString(3, role);
                stmt.setString(4, password);
                stmt.setString(5, email);
                stmt.setString(6, phone);
                stmt.executeUpdate();
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
            return;
        }

        // Redirect to dashboard.jsp after successful registration
        response.sendRedirect("dashboard.jsp");
    }
}
