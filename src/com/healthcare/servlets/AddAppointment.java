package com.healthcare.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.healthcare.dbutil.*;
import com.healthcare.modals.*;

/**
 * Servlet implementation class AddAppointment
 */
@WebServlet("/AddAppointment")
public class AddAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int docID = Integer.parseInt(request.getParameter("docid"));
		int userID = 0;
		String name = request.getParameter("name");
		String Email = request.getParameter("email");
		String phone = request.getParameter("phone");
		int age = Integer.parseInt(request.getParameter("age"));
		String date = request.getParameter("date");
		String time = request.getParameter("time");

		HttpSession session = request.getSession();
		if (session.getAttribute("UserID") != null) {
			userID = (Integer) session.getAttribute("UserID");
		}

		Appointment appointment = new Appointment(0, docID, userID, name, Email, phone, age, date, time, 0, 0);
		UserUtil userUtil = new UserUtil();

		String Message = "AddFailed";
		try {
			if (userUtil.InsertAppointment(appointment)) {
				Message = "AddSuccess";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("book-appointment.jsp?message=" + Message);
	}

}
