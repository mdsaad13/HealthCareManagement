package com.healthcare.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.healthcare.dbutil.AccountUtil;
import com.healthcare.modals.User;

@WebServlet("/Register")
public class Register extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String Email = request.getParameter("email");
        String Password = request.getParameter("password");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        int age = Integer.parseInt(request.getParameter("age"));
        String address = request.getParameter("address");

        User user = new User(0, name, Email, Password, phone, age, address);
        AccountUtil accountUtil = new AccountUtil();

        String Message = "RegisterFailed";
        try {
            if (accountUtil.InsertUser(user)) {
                Message = "RegisterSuccess";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("message", Message);
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        rd.forward(request, response);
    }
}