package com.healthcare.servlets.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthcare.dbutil.DbUtil;

/**
 * Servlet implementation class ApointmentStatusServlet
 */
@WebServlet("/admin/ApointmentStatusServlet")
public class ApointmentStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int ID = Integer.parseInt(request.getParameter("id"));
		int Status = Integer.parseInt(request.getParameter("status"));
		String Redirect = request.getParameter("redirect");

		String Message = "StatusUpdateFailed";
		DbUtil dbUtil = new DbUtil();
		try {
			if (dbUtil.UpdateAppointmentStatus(ID, Status))
				Message = "StatusUpdateSuccess";

		} catch (SQLException e) {
			Message = "StatusUpdateFailed&e=" + e;
		}
		response.sendRedirect("../" + Redirect + "/appointments.jsp?message=" + Message);
	}

}
