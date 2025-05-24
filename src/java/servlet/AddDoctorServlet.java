package servlet;

import dao.DBConnection;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class AddDoctorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        String firstName = req.getParameter("first_name");
        String lastName = req.getParameter("last_name");
        String specialty = req.getParameter("specialty");
        String contact = req.getParameter("contact_no");
        String email = req.getParameter("email");
        String dept = req.getParameter("department");
        String room = req.getParameter("room_no");

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO Doctors (first_name, last_name, specialty, contact_no, email, department, room_no) VALUES (?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, specialty);
            ps.setString(4, contact);
            ps.setString(5, email);
            ps.setString(6, dept);
            ps.setString(7, room);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                res.sendRedirect("viewDoctors.jsp");
            } else {
                out.println("Insertion failed.");
            }

        } catch (Exception e) {
            out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace(out); // Print detailed error to browser
        }
    }
}
