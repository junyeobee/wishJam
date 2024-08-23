package com.allgoods.wishJam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class JjimDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public JjimDAO() {

	}

	// 찜하기 메서드
	public boolean addJjim(JjimDTO jjim) {

		try {

			con = com.db.wishJam.DbConn.getConn();

			String sql = "insert into jjim (m_idx, s_idx) values (?, ?)";

			ps = con.prepareStatement(sql);
			ps.setInt(1, jjim.getM_idx());
			ps.setInt(2, jjim.getS_idx());

			return ps.executeUpdate() > 0;

		} catch (Exception e) {
			e.printStackTrace();

		}

		return false;

	}

	// 찜 갯수 증가
	public boolean incrementJjim(int s_idx) {

		try {
			con = com.db.wishJam.DbConn.getConn();

			String sql = "Update sell set s_jjim=s_jjim+1 where s_idx=?";

			ps = con.prepareStatement(sql);
			ps.setInt(1, s_idx);

			return ps.executeUpdate() > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public List<Integer> getJjimProductIds(int memberId) {

		List<Integer> jjimProductIds = new ArrayList<>();

		try {
			con = com.db.wishJam.DbConn.getConn();
			String sql = "select s_idx from jjim where m_idx=?";

			ps = con.prepareStatement(sql);
			ps.setInt(1, memberId);
			rs = ps.executeQuery();

			while (rs.next()) {
				jjimProductIds.add(rs.getInt("s_idx"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return jjimProductIds;

	}

	public boolean isthisJjim(int s_idx, int m_idx) {
		try {
				con=com.db.wishJam.DbConn.getConn();
				String sql = "select count(s_idx) from Jjim where m_idx=? and s_idx=?";
				ps=con.prepareStatement(sql);
				ps.setInt(1, m_idx);
				ps.setInt(2, s_idx);
				rs=ps.executeQuery();

				int result = 0;
				if(rs.next()) {
					result=rs.getInt(1);
				} else {
					return false;
				}
				
				return result==1?true:false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
			} catch (Exception e2) {
			}
		}
	}
}
