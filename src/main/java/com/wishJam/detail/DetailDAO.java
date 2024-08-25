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
			String sql = "select sell.*, m_nick, m_img from sell, member, mypage where sell.m_idx=member.m_idx and mypage.m_idx=sell.m_idx and s_idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, sellidx);
			rs = ps.executeQuery();

			if (rs.next()) {
				int s_idx = rs.getInt("s_idx");
				int m_idx = rs.getInt("m_idx");
				int c_idx = rs.getInt("c_idx");
				String s_title = rs.getString("s_title");
				String s_content = rs.getString("s_content");
				String s_hash = rs.getString("s_hash");
				int s_view = rs.getInt("s_view");
				int s_jjim = rs.getInt("s_jjim");
				Date s_start = rs.getDate("s_start");
				Date s_end = rs.getDate("s_end");
				int s_discnt = rs.getInt("s_discnt");
				int s_type = rs.getInt("s_type");
				String s_tradeT = rs.getString("s_tradeT");
				String s_img = rs.getString("s_img");
				int s_stat = rs.getInt("s_stat");
				String m_nick = rs.getString("m_nick");
				String m_img = rs.getString("m_img");

				DetailDTO dto = new DetailDTO(s_idx, m_idx, c_idx, s_title, s_content, s_hash, s_view, s_jjim, s_start,
						s_end, s_discnt, s_type, s_tradeT, s_img, s_stat, m_nick, m_img);

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

	public int getLastidx() {
		try {
			conn = com.db.wishJam.DbConn.getConn();
			String sql = "select max(s_idx) from sell order by s_idx asc";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			int last_idx = 0;

			if (rs.next()) {
				last_idx = rs.getInt("max(s_idx)");
			}

			return last_idx + 1;
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

	public int addSellPage(DetailDTO dto) {
		try {
			conn = com.db.wishJam.DbConn.getConn();
			String sql = "insert into sell(s_idx, m_idx, c_idx, s_title, s_content, s_hash, s_start, s_end, s_discnt, s_type, s_tradeT,s_img, s_stat)"
					+ " values(?,?,?,?,?,?,?,?,?,?,?,?,0)";

			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getS_idx());
			ps.setInt(2, dto.getM_idx());
			ps.setInt(3, dto.getC_idx());
			ps.setString(4, dto.getS_title());
			ps.setString(5, dto.getS_content());
			ps.setString(6, dto.getS_hash());
			ps.setDate(7, dto.getS_start());
			ps.setDate(8, dto.getS_end());
			ps.setInt(9, dto.getS_discnt());
			ps.setInt(10, dto.getS_type());
			ps.setString(11, dto.getS_tradeT());
			ps.setString(12, dto.getS_img());

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

	public int addCart(int m_idx, int sg_idx, int ct_count) {
		try {
			conn = com.db.wishJam.DbConn.getConn();
			String sql = "insert into cart values(ct_seq.nextval, ?,?,?,1)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, m_idx);
			ps.setInt(2, sg_idx);
			ps.setInt(3, ct_count);

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

	public int addBuyit(int num, int m_idx, int sg_idx, int ct_count) {
		try {
			conn = com.db.wishJam.DbConn.getConn();
			String sql = "insert into cart values(?, ?,?,?,1)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			ps.setInt(2, m_idx);
			ps.setInt(3, sg_idx);
			ps.setInt(4, ct_count);

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

	public int getLastnum() {
		try {
			conn = com.db.wishJam.DbConn.getConn();
			String sql = "select max(ct_idx) from cart";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			int lastnum = 0;

			if (rs.next()) {
				lastnum = rs.getInt(1);
			}
			return lastnum + 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
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

	public ArrayList<String> getCategoryName(int s_idx) {
		try {
				ArrayList<String> cates = new ArrayList<String>(); 
				
				conn=com.db.wishJam.DbConn.getConn();
				String sql = "select bc.c_name as c1, category.c_name as c2 from category, (select c_big,c_name from category, sell"
						+ " where sell.c_idx=category.c_idx and s_idx=4)bc where bc.c_big=category.c_big and c_small is null";
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				
				if(rs.next()) {
					String c1 = rs.getString("c1");
					String c2 = rs.getString("c2");
					
					cates.add(c1);
					cates.add(c2);
				}
				
				return cates;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
			}
		}
	}
}
