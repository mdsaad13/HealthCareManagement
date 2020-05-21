package com.healthcare.servlets.doctor;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthcare.dbutil.AccountUtil;
import com.healthcare.modals.Doctor;

@WebServlet("/doctor/DoctorChangePassword")
public class DoctorChangePassword extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String Message = "";

        HttpSession session = request.getSession();
        int UserID = (int) session.getAttribute("DoctorID");

        String Password = request.getParameter("password");
        String NewPassword = request.getParameter("new_password");

        AccountUtil accountUtil = new AccountUtil();
        Doctor doctor = new Doctor();
        try {
            doctor = accountUtil.GetDoctorByID(UserID);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (Password.equals(doctor.getPassword())) {
            try {
                if (accountUtil.UpdatePassword(NewPassword, UserID)) {
                    Message = "PasswordChangeSuccess";
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            Message = "IncorrectPassword";
        }

        response.sendRedirect("settings.jsp?message=" + Message);
    }
}