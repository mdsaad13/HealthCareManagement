package com.healthcare.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthcare.dbutil.AccountUtil;
import com.healthcare.modals.User;

@WebServlet("/Settings")
public class Settings extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int UserID = (int) session.getAttribute("UserID");

        AccountUtil accountUtil = new AccountUtil();
        String Action = request.getParameter("action");
        String Message = "";

        if (Action.equals("changepassword")) {
            String Password = request.getParameter("password");
            String NewPassword = request.getParameter("new_password");
            User user = new User();
            try {
                user = accountUtil.GetUserByID(UserID);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (Password.equals(user.getPassword())) {
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
        } else if (Action.equals("update")) {
            String Name = request.getParameter("name");
            String Email = request.getParameter("email");
            String Phone = request.getParameter("phone");
            int Age = Integer.parseInt(request.getParameter("age"));
            String Address = request.getParameter("address");

            User user = new User(UserID, Name, Email, "", Phone, Age, Address);
            try {
                if (accountUtil.UpdateUser(user)) {
                    Message = "UpdateSuccess";
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect("settings.jsp?message=" + Message);
    }

}