import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConnectionProvider {
    private static final String USERNAME = "postgres";
    private static final String PASSWORD = "admin";
    private static final String CON_URL = "jdbc:postgresql://localhost:5432/EmployeeDB";
    private static final String DRIVER = "org.postgresql.Driver";

    private Connection con;

    public ConnectionProvider() {}

    public Connection getCon() throws ClassNotFoundException {
        try {
            Class.forName(DRIVER); // Load PostgreSQL driver
            this.con = DriverManager.getConnection(CON_URL, USERNAME, PASSWORD);
            System.out.println("Connected to database successfully.");
        } catch (SQLException ex) {
            System.out.println("Could not connect: " + ex.getMessage());
            this.con = null; // Ensure `con` is null in case of failure
        }
        return con;
    }

    // Login method to authenticate user from the tblemployee table
    public boolean login(String empEmail, String empPassword) throws ClassNotFoundException {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    boolean isAuthenticated = false;

    try {
        Class.forName("org.postgresql.Driver");
        conn = getCon();
        String query = "SELECT * FROM public.tblemployee WHERE empEmail = ? AND empPassword = ?";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, empEmail);
        pstmt.setString(2, empPassword);

        rs = pstmt.executeQuery();

        if (rs.next()) {
            isAuthenticated = true;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    return isAuthenticated;
}

}
