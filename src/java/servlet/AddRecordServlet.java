package servlet;

import dao.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class AddRecordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int patientId = Integer.parseInt(req.getParameter("patient_id"));
        String diagnosis = req.getParameter("diagnosis");
        String treatment = req.getParameter("treatment");
        String date = req.getParameter("date");

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO Medical_Records (patient_id, diagnosis, treatment, date) VALUES (?, ?, ?, ?)");
            ps.setInt(1, patientId);
            ps.setString(2, diagnosis);
            ps.setString(3, treatment);
            ps.setString(4, date);
            ps.executeUpdate();
            res.sendRedirect("viewRecords.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
