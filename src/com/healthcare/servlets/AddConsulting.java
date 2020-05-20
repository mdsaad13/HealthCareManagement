package com.healthcare.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.healthcare.Formatter;
import com.healthcare.dbutil.*;
import com.healthcare.modals.*;

@WebServlet("/AddConsulting")
public class AddConsulting extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String Message = "AddFailed";
        HttpSession session = request.getSession();
        if (session.getAttribute("UserID") != null) {
            Integer userID = (Integer) session.getAttribute("UserID");

            int docID = Integer.parseInt(request.getParameter("docid"));
            String subject = request.getParameter("subject");
            String dateTime = Formatter.CurrentDateTime();
            String description = request.getParameter("description");

            Consulting consulting = new Consulting(0, docID, userID, subject, description, 0, 0, dateTime, null);
            UserUtil userUtil = new UserUtil();

            try {
                if (userUtil.InsertConsulting(consulting)) {
                    Message = "AddSuccess";
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect("my-consulting.jsp?message=" + Message);
    }
}