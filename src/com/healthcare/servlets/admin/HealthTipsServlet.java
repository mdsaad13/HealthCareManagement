package com.healthcare.servlets.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthcare.Formatter;
import com.healthcare.dbutil.DbUtil;
import com.healthcare.modals.HealthTip;

@WebServlet("/admin/HealthTipsServlet")
public class HealthTipsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int ID = Integer.parseInt(request.getParameter("tipid"));

		String Message = "DeleteFailed";
		DbUtil dbUtil = new DbUtil();
		try {
			dbUtil.DeleteTip(ID);
			Message = "DeleteSuccess";

		} catch (SQLException e) {
			Message = "DeleteFailed&e=" + e;
		}
		response.sendRedirect("health-tips.jsp?message=" + Message);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Title = request.getParameter("Title");
		String Description = request.getParameter("Description");
		int Visibility = Integer.parseInt(request.getParameter("Visibility"));

		String Action = request.getParameter("action");

		DbUtil dbUtil = new DbUtil();
		String Message = "AddFailed";
		try {
			if (Action.equals("add")) {
				String dateTime = Formatter.CurrentDateTime();
				HealthTip healthTip = new HealthTip(0, Title, Description, dateTime, Visibility);
				if (dbUtil.InsertTip(healthTip)) {
					Message = "AddSuccess";
				}
			} else if (Action.equals("update")) {
				int ID = Integer.parseInt(request.getParameter("id"));
				HealthTip healthTip = new HealthTip(ID, Title, Description, "", Visibility);
				if (dbUtil.UpdateTip(healthTip)) {
					Message = "UpdateSuccess";
				} else {
					Message = "UpdateFailed";
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("health-tips.jsp?message=" + Message);
	}
}