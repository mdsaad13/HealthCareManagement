package com.healthcare.servlets.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthcare.dbutil.AccountUtil;
import com.healthcare.modals.User;

@WebServlet("/admin/UsersServlet")
public class UsersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String Action = request.getParameter("action");

        String Email = request.getParameter("email");
        String Password = request.getParameter("password");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        int age = Integer.parseInt(request.getParameter("age"));
        String address = request.getParameter("address");

        AccountUtil accountUtil = new AccountUtil();
        String Message = "AddFailed";
        try {
            if (Action.equals("add")) {
                User user = new User(0, name, Email, Password, phone, age, address);
                if (accountUtil.InsertUser(user)) {
                    Message = "AddSuccess";
                }
            } else if (Action.equals("update")) {
                int ID = Integer.parseInt(request.getParameter("id"));
                User user = new User(ID, name, Email, "", phone, age, address);
                if (accountUtil.UpdateUser(user)) {
                    Message = "UpdateSuccess";
                } else {
                    Message = "UpdateFailed";
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("users.jsp?message=" + Message);
    }
}