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
			String sql = "insert into report values(rp_seq.nextval,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, dto.getS_idx());
			ps.setString(2, dto.getRp_reason());
			ps.setInt(3, 0);
			ps.setInt(4, dto.getReported());
			ps.setInt(5, dto.getReporter());
			
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
