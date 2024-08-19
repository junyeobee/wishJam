package com.wishJam.review;

import java.sql.*;
import java.sql.Date;
import java.util.*;

public class ReviewDAO {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;

	public ArrayList<ReviewDTO> viewReview() {
		try {
			conn = com.db.wishJam.DbConn.getConn();
			String sql = "select r_idx, review.m_idx, review.m_nick, review.g_name, r_img, r_star, r_content, r_date, m_img"
					+ " from review, mypage where review.m_idx = mypage.m_idx";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();

			while (rs.next()) {
				int r_idx = rs.getInt("r_idx");
				int m_idx = rs.getInt("m_idx");
				String m_nick = rs.getString("m_nick");
				String g_name = rs.getString("g_name");
				String r_img = rs.getString("r_img");
				int r_star = rs.getInt("r_star");
				String r_content = rs.getString("r_content");
				Date r_date = rs.getDate("r_date");
				String m_img = rs.getString("m_img");

				ReviewDTO dto = new ReviewDTO(r_idx, m_idx, m_nick, g_name, r_img, r_star, r_content, r_date, m_img);

				list.add(dto);
			}
				return list;

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
}
