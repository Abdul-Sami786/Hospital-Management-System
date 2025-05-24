package servlet;

import dao.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class AddStaffServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        // Get parameters from the form (make sure names match exactly)
        String name = req.getParameter("name");
        String position = req.getParameter("position");
        String contact = req.getParameter("contact_number");

        try (Connection con = DBConnection.getConnection()) {
            // Prepare SQL insert statement
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO Staff (name, position, contact_number) VALUES (?, ?, ?)");

            // Set parameters
            ps.setString(1, name);
            ps.setString(2, position);
            ps.setString(3, contact);

            // Execute insert
            ps.executeUpdate();

            // Redirect to staff listing page
            res.sendRedirect("viewStaff.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            // Optionally, forward to error page or show error message
            res.getWriter().println("Error adding staff member: " + e.getMessage());
        }
    }
}
