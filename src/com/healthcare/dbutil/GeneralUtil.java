package com.healthcare.dbutil;

import java.sql.*;

import com.healthcare.Config;

public class GeneralUtil extends Config {
    /**
     * Counts the number of rows of table
     * 
     * @param TableName
     * @return Count
     * @throws SQLException
     */
    public int CountTable(String TableName) throws SQLException {
        int count = 0;
        Connect();
        Statement stmt = conn.createStatement();
        ResultSet r = stmt.executeQuery("SELECT COUNT(*) AS rowcount FROM " + TableName);
        while (r.next()) {
            count = r.getInt(1);
        }
        r.close();
        DisConnect();
        return count;
    }

    /**
     * Counts the number of rows of table by taking arguments or where clause
     * 
     * @param TableName
     * @param Arguments (Eg: id = 1)
     * @return Count
     * @throws SQLException
     */
    public int CountByArgs(String TableName, String Args) throws SQLException {
        int count = 0;
        Connect();
        Statement s = conn.createStatement();
        ResultSet r = s.executeQuery("SELECT COUNT(*) AS rowcount FROM " + TableName + " WHERE " + Args);
        while (r.next())
            count = r.getInt(1);
        r.close();
        DisConnect();
        return count;
    }
}