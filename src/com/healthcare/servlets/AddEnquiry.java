package com.healthcare.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthcare.Formatter;
import com.healthcare.dbutil.UserUtil;
import com.healthcare.modals.Enquiry;

@WebServlet("/AddEnquiry")
public class AddEnquiry extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String Email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");
		String dateTime = Formatter.CurrentDateTime();

		Enquiry enquiry = new Enquiry(0, name, Email, subject, message, dateTime, 0);
		UserUtil userUtil = new UserUtil();

		String Message = "AddFailed";
		try {
			if (userUtil.InsertEnq(enquiry)) {
				Message = "AddSuccess";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		response.sendRedirect("contact-us.jsp?message=" + Message + "#getintouch");
	}
}