package com.wishJam.Report;

import java.sql.*;
import java.util.*;
import java.sql.Date;

public class ReportDAO {

	Connection conn;
	PreparedStatement ps;
	ResultSet rs;

	public int reportContent(ReportDTO dto) {
		try {
			conn = com.db.wishJam.DbConn.getConn();
			String sql = "insert into report values(?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, dto.getS_idx());
			ps.setString(2, dto.getG_name());
			ps.setString(3, dto.getRp_reason());
			
			int count = ps.executeUpdate();
			
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
			} catch (Exception e2) {
			}
		}
	}
}
