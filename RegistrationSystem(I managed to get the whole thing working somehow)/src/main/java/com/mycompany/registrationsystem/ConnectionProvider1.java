/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


package com.mycompany.registrationsystem;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author reith
 */
public class ConnectionProvider1 {
    private static final String USERNAME = "postgres";
    private static final String PASSWORD = "admin";
    private static final String CON_URL = "jdbc:postgresql://localhost:5432/EmployeeDB";
    private static final String DRIVER = "org.postgresql.Driver";

    private Connection con;

    public ConnectionProvider1() {}

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
    public boolean login(String empID, String empPassword) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean isAuthenticated = false;

        try {
             Class.forName("org.postgresql.Driver");
            conn = getCon(); // Get connection from ConnectionProvider
            String query = "SELECT * FROM public.tblemployee WHERE empid = ? AND emppassword = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, empID);
            pstmt.setString(2, empPassword);

            rs = pstmt.executeQuery();

            // Check if a matching record is found
            if (rs.next()) {
                isAuthenticated = true; // User found and credentials match
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Log any SQL errors
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
