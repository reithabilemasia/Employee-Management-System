import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");

        String empEmail = request.getParameter("empEmail"); // Changed from empID to empEmail
        String empPassword = request.getParameter("empPassword");

        ConnectionProvider connectionProvider = new ConnectionProvider();
        boolean isAuthenticated = false;

        try {
            isAuthenticated = connectionProvider.login(empEmail, empPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (isAuthenticated) {
            // Create session and store user email
            HttpSession session = request.getSession();
            session.setAttribute("userEmail", empEmail);

            // Redirect to dashboard.jsp
            response.sendRedirect("dashboard.jsp");
        } else {
            // Redirect back to login.jsp with an error message
            response.sendRedirect("login.jsp?error=invalid");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Login Servlet";
    }
}
