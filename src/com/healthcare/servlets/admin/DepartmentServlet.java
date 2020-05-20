package com.healthcare.servlets.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthcare.dbutil.DbUtil;
import com.healthcare.modals.Department;

@WebServlet("/admin/DepartmentServlet")
public class DepartmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Name = request.getParameter("name");
		String Action = request.getParameter("action");

		DbUtil dbUtil = new DbUtil();
		String Message = "AddFailed";
		try {
			if (Action.equals("add")) {
				Department department = new Department(0, Name);
				if (dbUtil.InsertDept(department)) {
					Message = "AddSuccess";
				}
			} else if (Action.equals("update")) {
				int ID = Integer.parseInt(request.getParameter("id"));
				Department department = new Department(ID, Name);
				if (dbUtil.UpdateDept(department)) {
					Message = "UpdateSuccess";
				} else {
					Message = "UpdateFailed";
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("departments.jsp?message=" + Message);
	}
}