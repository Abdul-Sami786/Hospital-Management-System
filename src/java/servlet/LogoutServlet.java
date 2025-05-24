package servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) 
            throws ServletException, IOException {
        HttpSession session = req.getSession(false); // don't create if doesn't exist
        if (session != null) {
            session.invalidate(); // destroy session
        }
        res.sendRedirect("login.jsp");
    }
}
