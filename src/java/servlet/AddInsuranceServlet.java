package servlet;

import dao.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class AddInsuranceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String patientIdStr = req.getParameter("patientId");
        String provider = req.getParameter("provider");
        String policy = req.getParameter("policy");
        String coverageStr = req.getParameter("coverage");

        if (patientIdStr == null || provider == null || policy == null || coverageStr == null ||
            patientIdStr.isEmpty() || provider.isEmpty() || policy.isEmpty() || coverageStr.isEmpty()) {
            // Redirect with error or send error response
            res.sendRedirect("addInsurance.jsp?error=missing_fields");
            return;
        }

        int patientId;
        double coverage;

        try {
            patientId = Integer.parseInt(patientIdStr);
        } catch (NumberFormatException e) {
            res.sendRedirect("addInsurance.jsp?error=invalid_patientId");
            return;
        }

        try {
            coverage = Double.parseDouble(coverageStr);
        } catch (NumberFormatException e) {
            res.sendRedirect("addInsurance.jsp?error=invalid_coverage");
            return;
        }

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO Insurance (patient_id, provider_name, policy_number, coverage_amount) VALUES (?, ?, ?, ?)");
            ps.setInt(1, patientId);
            ps.setString(2, provider);
            ps.setString(3, policy);
            ps.setDouble(4, coverage);
            ps.executeUpdate();
            res.sendRedirect("viewInsurance.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("addInsurance.jsp?error=db_error");
        }
    }
}
