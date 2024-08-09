package com.wishJam.detail;

import java.sql.*;
import java.util.*;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class DetailDAO {

	Connection conn;
	PreparedStatement ps;
	ResultSet rs;

	public DetailDTO viewSellDetail(int sellidx) {
		try {
			conn = com.db.wishJam.DbConn.getConn();
			String sql = "select * from sell where s_idx =?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, sellidx);
			rs = ps.executeQuery();

			if (rs.next()) {
				int s_idx = rs.getInt("s_idx");
				String m_nick = rs.getString("m_nick");
				int c_idx = rs.getInt("c_idx");
				String g_name = rs.getString("g_name");
				String s_title = rs.getString("s_title");
				String s_content = rs.getString("s_content");
				String s_hash = rs.getString("s_hash");
				Date s_start = rs.getDate("s_start");
				Date s_end = rs.getDate("s_end");
				int s_discnt = rs.getInt("s_discnt");
				int s_type = rs.getInt("s_type");
				String s_trade = rs.getString("s_trade");

				DetailDTO dto = new DetailDTO(s_idx, m_nick, c_idx, g_name, s_title, s_content, s_hash, s_idx, c_idx,
						s_start, s_end, s_discnt, s_type, s_trade);

				return dto;
			} else {
				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}

	public int addSellPage(DetailDTO dto) {
		try {
			conn = com.db.wishJam.DbConn.getConn();
			String sql = "insert into sell(s_idx, m_nick, c_idx, g_name, s_title, s_content, s_hash, s_start, s_end, s_discnt, s_type, s_trade) values(?,?,?,?,?,?,?,?,?,?,?,?)";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getS_idx());
			ps.setString(2, dto.getM_nick());
			ps.setInt(3, dto.getC_idx());
			ps.setString(4, dto.getG_name());
			ps.setString(5, dto.getS_title());
			ps.setString(6, dto.getS_content());
			ps.setString(7, dto.getS_hash());
			ps.setDate(8, dto.getS_start());
			ps.setDate(9, dto.getS_end());
			ps.setInt(10, dto.getS_discnt());
			ps.setInt(11, dto.getS_type());
			ps.setString(12, dto.getS_trade());

			int count = ps.executeUpdate();

			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}
}
