package com.healthcare.servlets.doctor;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthcare.dbutil.DbUtil;
import com.healthcare.modals.Consulting;

@WebServlet("/doctor/ConsultingResponse")
public class ConsultingResponse extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String Message = "ResponseFailed";
        String Response = request.getParameter("response");
        int ID = Integer.parseInt(request.getParameter("id"));
        Consulting consulting = new Consulting(ID, 1, Response);

        DbUtil dbUtil = new DbUtil();
        try {
            if (dbUtil.UpdateConsulting(consulting))
                Message = "ResponseSucess";
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        response.sendRedirect("consulting.jsp?message=" + Message);
    }
}