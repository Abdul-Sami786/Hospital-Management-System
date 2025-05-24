package servlet;

import dao.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class AddMedicineServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            String name = req.getParameter("itemName");
            int quantity = Integer.parseInt(req.getParameter("quantity"));
            double price = Double.parseDouble(req.getParameter("price"));
            String expiry = req.getParameter("expiryDate");

            try (Connection con = DBConnection.getConnection()) {
                PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO Pharmacy_Inventory (item_name, quantity, price, expiry_date) VALUES (?, ?, ?, ?)");
                ps.setString(1, name);
                ps.setInt(2, quantity);
                ps.setDouble(3, price);
                ps.setString(4, expiry);
                ps.executeUpdate();
                res.sendRedirect("viewMedicines.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
