package com.healthcare.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthcare.dbutil.UserUtil;

@WebServlet("/DeleteAppointment")

public class DeleteAppointment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int ID = Integer.parseInt(request.getParameter("id"));

        String Message = "DeleteFailed";
        UserUtil dbUtil = new UserUtil();
        try {
            dbUtil.DeleteAppointment(ID);
            Message = "DeleteSuccess";

        } catch (SQLException e) {
            Message = "DeleteFailed&e=" + e;
        }
        response.sendRedirect("my-appointment.jsp?message=" + Message);
    }
}