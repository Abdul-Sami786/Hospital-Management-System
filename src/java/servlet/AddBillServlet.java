package servlet;

import dao.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class AddBillServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int patientId = Integer.parseInt(req.getParameter("patientId"));
        double amount = Double.parseDouble(req.getParameter("amount"));
        String date = req.getParameter("date");
        String status = req.getParameter("status");

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO Billing (patient_id, amount, date, status) VALUES (?, ?, ?, ?)");
            ps.setInt(1, patientId);
            ps.setDouble(2, amount);
            ps.setString(3, date);
            ps.setString(4, status);
            ps.executeUpdate();
            res.sendRedirect("viewBills.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
