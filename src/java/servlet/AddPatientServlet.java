package servlet;

import dao.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class AddPatientServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException {

        String name = req.getParameter("name");
        String dob = req.getParameter("dob");
        String gender = req.getParameter("gender");
        String contact = req.getParameter("contact");
        String address = req.getParameter("address");

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO Patients (name, dob, gender, contact_number, address) VALUES (?, ?, ?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, dob);
            ps.setString(3, gender);
            ps.setString(4, contact);
            ps.setString(5, address);
            ps.executeUpdate();
            res.sendRedirect("viewPatients.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
