package servlet;

import dao.DBConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/AddAppointmentServlet")
public class AddAppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String doctorIdStr = request.getParameter("doctor_id");
        String patientIdStr = request.getParameter("patient_id");
        String date = request.getParameter("appointment_date");
        String time = request.getParameter("appointment_time");
        String reason = request.getParameter("reason");

        if (doctorIdStr == null || patientIdStr == null || date == null || time == null || doctorIdStr.isEmpty() || patientIdStr.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing required fields.");
            return;
        }

        try {
            int doctorId = Integer.parseInt(doctorIdStr);
            int patientId = Integer.parseInt(patientIdStr);

            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO Appointments (doctor_id, patient_id, appointment_date, appointment_time, reason) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, doctorId);
            ps.setInt(2, patientId);
            ps.setString(3, date);
            ps.setString(4, time);
            ps.setString(5, reason);

            int rows = ps.executeUpdate();

            ps.close();
            con.close();

            if (rows > 0) {
                response.sendRedirect("dashboard.jsp");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Appointment not added.");
            }

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid doctor or patient ID.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error: " + e.getMessage());
        }
    }
}
