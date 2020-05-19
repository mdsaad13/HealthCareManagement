package com.healthcare.dbutil;

import java.sql.*;

import com.healthcare.Config;
import com.healthcare.modals.*;

public class UserUtil extends Config {

    public boolean InsertEnq(Enquiry obj) throws SQLException {
        boolean result = false;
        Connect();
        try {
            PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO contact_us (name, email, subject, message, datetime) values (?, ?, ?, ?, ?)");
            ps.setString(1, obj.getName());
            ps.setString(2, obj.getEmail());
            ps.setString(3, obj.getSubject());
            ps.setString(4, obj.getMessage());
            ps.setString(5, obj.getDateTime());

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

    public boolean InsertAppointment(Appointment obj) throws SQLException {
        boolean result = false;
        Connect();
        try {
            PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO appointments (doc_id, user_id, name, email, phone, age, date, time) values (?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setInt(1, obj.getDocID());
            ps.setInt(2, obj.getUserID());
            ps.setString(3, obj.getName());
            ps.setString(4, obj.getEmail());
            ps.setString(5, obj.getPhone());
            ps.setInt(5, obj.getAge());
            ps.setString(5, obj.getDate());
            ps.setString(5, obj.getTime());

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

    public boolean InsertConsulting(Consulting obj) throws SQLException {
        boolean result = false;
        Connect();
        try {
            PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO consulting (doc_id, user_id, subject, description, datetime) values (?, ?, ?, ?, ?)");
            ps.setInt(1, obj.getDocID());
            ps.setInt(2, obj.getUserID());
            ps.setString(3, obj.getSubject());
            ps.setString(4, obj.getDescription());
            ps.setString(5, obj.getDateTime());

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

    public void DeleteConsulting(int ID) throws SQLException {
        PreparedStatement pstmt = null;
        Connect();
        try {
            pstmt = conn.prepareStatement("DELETE FROM consulting WHERE id = ? AND status = 0");
            pstmt.setInt(1, ID);
            pstmt.executeQuery();
        } catch (Exception e) {
        } finally {
            DisConnect();
            pstmt.close();
        }
    }

}