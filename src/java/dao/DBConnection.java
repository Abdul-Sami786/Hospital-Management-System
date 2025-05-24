package dao;

import java.sql.*;

public class DBConnection {
    private static String jdbcURL = "jdbc:mysql://localhost:3306/HospitalDB";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
