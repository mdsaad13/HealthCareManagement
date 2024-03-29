package com.healthcare.dbutil;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.healthcare.Config;
import com.healthcare.modals.Appointment;
import com.healthcare.modals.Consulting;
import com.healthcare.modals.Department;
import com.healthcare.modals.Enquiry;
import com.healthcare.modals.HealthTip;

public class DbUtil extends Config {

	// Departments Op
	public boolean InsertDept(Department obj) throws SQLException {
		boolean result = false;
		Connect();
		try {
			PreparedStatement ps = conn.prepareStatement("INSERT INTO departments (name) values (?)");
			ps.setString(1, obj.getName());

			int rows = ps.executeUpdate();

			if (rows > 0) {
				result = true;
			}
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		DisConnect();
		return result;
	}

	public boolean UpdateDept(Department obj) throws SQLException {
		boolean result = false;
		Connect();
		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE departments SET name = ? WHERE dept_id = ?");
			ps.setString(1, obj.getName());
			ps.setInt(2, obj.getID());

			int rows = ps.executeUpdate();

			if (rows > 0) {
				result = true;
			}
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		DisConnect();
		return result;
	}

	public Department GetDeptByID(int ID) throws SQLException {
		Department obj = new Department();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM departments WHERE dept_id = ? ");
			pstmt.setInt(1, ID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				obj = new Department(rs.getInt("dept_id"), rs.getString("name"));
			}
		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}
		return obj;
	}

	public ArrayList<Department> AllDepartment(boolean SortByNameAsc) throws SQLException {
		ArrayList<Department> list = new ArrayList<Department>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			String Query = null;
			if (SortByNameAsc) {
				Query = "SELECT * FROM departments ORDER BY name ASC";
			} else {
				Query = "SELECT * FROM departments ORDER BY dept_id DESC";
			}
			pstmt = conn.prepareStatement(Query);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Department obj = new Department(rs.getInt("dept_id"), rs.getString("name"));
				list.add(obj);
			}
		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}
		return list;
	}

	// Enquiries or contact us Op
	public ArrayList<Enquiry> AllEnquiries() throws SQLException {
		ArrayList<Enquiry> list = new ArrayList<Enquiry>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM contact_us ORDER BY id DESC");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Enquiry enquiries = new Enquiry(rs.getInt("id"), rs.getString("name"), rs.getString("email"),
						rs.getString("subject"), rs.getString("message"), rs.getString("datetime"), rs.getInt("seen"));

				list.add(enquiries);
			}
		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}
		return list;
	}

	public void UpdateEnquiriesToSeen() throws SQLException {
		Connect();
		try {
			Statement smt = conn.createStatement();
			String query = "UPDATE contact_us SET seen = 1";
			smt.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		DisConnect();
	}

	// Appointments Op

	public boolean UpdateAppointmentStatus(int ID, int Status) throws SQLException {
		boolean result = false;
		Connect();
		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE appointments SET status = ? WHERE id = ?");
			ps.setInt(1, Status);
			ps.setInt(2, ID);

			int rows = ps.executeUpdate();

			if (rows > 0) {
				result = true;
			}
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		DisConnect();
		return result;
	}

	public ArrayList<Appointment> AllAppointments() throws SQLException {
		ArrayList<Appointment> list = new ArrayList<Appointment>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM appointments ORDER BY id DESC");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Appointment obj = new Appointment(rs.getInt("id"), rs.getInt("doc_id"), rs.getInt("user_id"),
						rs.getString("name"), rs.getString("email"), rs.getString("phone"), rs.getInt("age"),
						rs.getString("date"), rs.getString("time"), rs.getInt("seen"), rs.getInt("status"));

				list.add(obj);
			}
		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}
		return list;
	}

	public void UpdateAppointmentsToSeen() throws SQLException {
		Connect();
		try {
			Statement smt = conn.createStatement();
			String query = "UPDATE appointments SET seen = 1";
			smt.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		DisConnect();
	}

	public ArrayList<Appointment> AllAppointmentsByDoc(int DocID) throws SQLException {
		ArrayList<Appointment> list = new ArrayList<Appointment>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM appointments WHERE doc_id = ? ORDER BY id DESC");
			pstmt.setInt(1, DocID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Appointment obj = new Appointment(rs.getInt("id"), rs.getInt("doc_id"), rs.getInt("user_id"),
						rs.getString("name"), rs.getString("email"), rs.getString("phone"), rs.getInt("age"),
						rs.getString("date"), rs.getString("time"), rs.getInt("seen"), rs.getInt("status"));

				list.add(obj);
			}
		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}
		return list;
	}

	public ArrayList<Appointment> AllAppointmentsByUser(int UserID) throws SQLException {
		ArrayList<Appointment> list = new ArrayList<Appointment>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM appointments WHERE user_id = ? ORDER BY id DESC");
			pstmt.setInt(1, UserID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Appointment obj = new Appointment(rs.getInt("id"), rs.getInt("doc_id"), rs.getInt("user_id"),
						rs.getString("name"), rs.getString("email"), rs.getString("phone"), rs.getInt("age"),
						rs.getString("date"), rs.getString("time"), rs.getInt("seen"), rs.getInt("status"));

				list.add(obj);
			}
		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}
		return list;
	}

	// Health tips OP
	public boolean InsertTip(HealthTip obj) throws SQLException {
		boolean result = false;
		Connect();
		try {
			PreparedStatement ps = conn.prepareStatement(
					"INSERT INTO healthtips (title, description, datetime, visibility) values (?, ?, ?, ?)");
			ps.setString(1, obj.getTitle());
			ps.setString(2, obj.getDescription());
			ps.setString(3, obj.getDateTime());
			ps.setInt(4, obj.getVisibility());

			int rows = ps.executeUpdate();

			if (rows > 0) {
				result = true;
			}
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		DisConnect();
		return result;
	}

	public boolean UpdateTip(HealthTip obj) throws SQLException {
		boolean result = false;
		Connect();
		try {
			PreparedStatement ps = conn
					.prepareStatement("UPDATE healthtips SET title = ?, description = ?, visibility = ? WHERE id = ?");
			ps.setString(1, obj.getTitle());
			ps.setString(2, obj.getDescription());
			ps.setInt(3, obj.getVisibility());
			ps.setInt(4, obj.getID());

			int rows = ps.executeUpdate();

			if (rows > 0) {
				result = true;
			}
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		DisConnect();
		return result;
	}

	public ArrayList<HealthTip> AllTips() throws SQLException {
		ArrayList<HealthTip> list = new ArrayList<HealthTip>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM healthtips ORDER BY id DESC");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HealthTip obj = new HealthTip(rs.getInt("id"), rs.getString("title"), rs.getString("description"),
						rs.getString("datetime"), rs.getInt("visibility"));

				list.add(obj);
			}
		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}
		return list;
	}

	public ArrayList<HealthTip> OnlyHomeScreenTips() throws SQLException {
		ArrayList<HealthTip> list = new ArrayList<HealthTip>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM healthtips WHERE visibility = 1 ORDER BY id DESC");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HealthTip obj = new HealthTip(rs.getInt("id"), rs.getString("title"), rs.getString("description"),
						rs.getString("datetime"), rs.getInt("visibility"));

				list.add(obj);
			}
		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}
		return list;
	}

	public void DeleteTip(int ID) throws SQLException {
		PreparedStatement pstmt = null;
		Connect();
		try {
			pstmt = conn.prepareStatement("DELETE FROM healthtips WHERE id = ?");
			pstmt.setInt(1, ID);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisConnect();
			pstmt.close();
		}
	}

	public ArrayList<Consulting> AllConsulting() throws SQLException {
		ArrayList<Consulting> list = new ArrayList<Consulting>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM consulting ORDER BY id DESC");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Consulting users = new Consulting(rs.getInt("id"), rs.getInt("doc_id"), rs.getInt("user_id"),
						rs.getString("subject"), rs.getString("description"), rs.getInt("seen"), rs.getInt("status"),
						rs.getString("datetime"), rs.getString("response"));
				list.add(users);
			}
		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}
		return list;
	}

	public ArrayList<Consulting> AllConsultingByUser(int UserID) throws SQLException {
		ArrayList<Consulting> list = new ArrayList<Consulting>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM consulting WHERE user_id = ? ORDER BY id DESC");
			pstmt.setInt(1, UserID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Consulting users = new Consulting(rs.getInt("id"), rs.getInt("doc_id"), rs.getInt("user_id"),
						rs.getString("subject"), rs.getString("description"), rs.getInt("seen"), rs.getInt("status"),
						rs.getString("datetime"), rs.getString("response"));
				list.add(users);
			}
		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}
		return list;
	}

	public ArrayList<Consulting> AllConsultingByDoctor(int DocID) throws SQLException {
		ArrayList<Consulting> list = new ArrayList<Consulting>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM consulting WHERE doc_id = ? ORDER BY id DESC");
			pstmt.setInt(1, DocID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Consulting users = new Consulting(rs.getInt("id"), rs.getInt("doc_id"), rs.getInt("user_id"),
						rs.getString("subject"), rs.getString("description"), rs.getInt("seen"), rs.getInt("status"),
						rs.getString("datetime"), rs.getString("response"));
				list.add(users);
			}
		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}
		return list;
	}

	public Consulting GetConsultingByID(int ID) throws SQLException {
		Consulting consulting = new Consulting();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM consulting WHERE id = ?");
			pstmt.setInt(1, ID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				consulting = new Consulting(rs.getInt("id"), rs.getInt("doc_id"), rs.getInt("user_id"),
						rs.getString("subject"), rs.getString("description"), rs.getInt("seen"), rs.getInt("status"),
						rs.getString("datetime"), rs.getString("response"));
			}
		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}
		return consulting;
	}

	/**
	 * Updating only status and response
	 * 
	 * @param obj
	 * @return
	 * @throws SQLException
	 */
	public boolean UpdateConsulting(Consulting obj) throws SQLException {
		boolean result = false;
		Connect();
		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE consulting SET status = ?, response = ? WHERE id = ?");
			ps.setInt(1, obj.getStatus());
			ps.setString(2, obj.getResponse());
			ps.setInt(3, obj.getID());

			int rows = ps.executeUpdate();

			if (rows > 0) {
				result = true;
			}
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		DisConnect();
		return result;
	}

}
