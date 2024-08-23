package com.wishJam.review;

import java.sql.*;
import java.sql.Date;
import java.util.*;

public class ReviewDAO {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;

	public ArrayList<ReviewDTO> viewReview(int s_idx, int rp, int rSize) {
		try {
			ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();
			int start = rp*rSize-rSize;
			int end = rp*rSize;
			
			conn = com.db.wishJam.DbConn.getConn();
			String sql = "select * from (select rownum rn, rev.* from"
					+ " (select r_idx, s_idx, review.m_idx, r_img, r_star, r_content, r_date, m_img, m_nick"
					+ " from review, mypage, member"
					+ " where review.m_idx=mypage.m_idx and review.m_idx=member.m_idx and s_idx=?"
					+ " order by r_idx asc)rev)ro"
					+ " where rn>? and rn<=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, s_idx);
			ps.setInt(2, start);
			ps.setInt(3, end);
			rs = ps.executeQuery();

			while (rs.next()) {
				int r_idx = rs.getInt("r_idx");
				int m_idx = rs.getInt("m_idx");
				String r_img = rs.getString("r_img");
				int r_star = rs.getInt("r_star");
				String r_content = rs.getString("r_content");
				Date r_date = rs.getDate("r_date");
				String m_img = rs.getString("m_img");
				String m_nick=rs.getString("m_nick");

				ReviewDTO dto = new ReviewDTO(r_idx, m_idx, r_img, r_star, r_content, r_date, m_img, m_nick);
				
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

	public int countReview(int s_idx) {
		try {
				conn=com.db.wishJam.DbConn.getConn();
				String sql = "select count(r_idx) from review where s_idx=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, s_idx);
				rs=ps.executeQuery();
				
				int r_num=0;
				if(rs.next()) {
					r_num = rs.getInt("count(r_idx)");
				}
				
				return r_num;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
					if(rs!=null) rs.close();
					if(ps!=null) ps.close();
					if(conn!=null) conn.close();
			} catch (Exception e2) {
			}
		}
	}
	
	public int sumRstar(int s_idx) {
		try {
				conn=com.db.wishJam.DbConn.getConn();
				String sql = "select sum(r_star) from review where s_idx=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, s_idx);
				rs=ps.executeQuery();
				
				int r_star=0;
				if(rs.next()) {
					r_star = rs.getInt(1);
				}
				
				return r_star;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
					if(rs!=null) rs.close();
					if(ps!=null) ps.close();
					if(conn!=null) conn.close();
			} catch (Exception e2) {
			}
		}
	}
	
	public ArrayList<ReviewDTO> viewImgReview(int s_idx) {
		try {
			ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();

			
			conn = com.db.wishJam.DbConn.getConn();
			String sql = "select * from (select rownum rn, rev.* from"
					+ " (select r_idx, s_idx, review.m_idx, r_img, r_star, r_content, r_date, m_img, m_nick"
					+ " from review, mypage, member"
					+ " where review.m_idx=mypage.m_idx and review.m_idx=member.m_idx and s_idx=? and r_img is not null"
					+ " order by r_idx asc)rev)ro";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, s_idx);
			rs = ps.executeQuery();

			while (rs.next()) {
				int r_idx = rs.getInt("r_idx");
				int m_idx = rs.getInt("m_idx");
				String r_img = rs.getString("r_img");
				int r_star = rs.getInt("r_star");
				String r_content = rs.getString("r_content");
				Date r_date = rs.getDate("r_date");
				String m_img = rs.getString("m_img");
				String m_nick=rs.getString("m_nick");

				ReviewDTO dto = new ReviewDTO(r_idx, m_idx, r_img, r_star, r_content, r_date, m_img, m_nick);
				
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
	
	public int countimgReview(int s_idx) {
		try {
				conn=com.db.wishJam.DbConn.getConn();
				String sql = "select count(r_idx) from review where s_idx=? and r_img is not null";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, s_idx);
				rs=ps.executeQuery();
				
				int r_num=0;
				if(rs.next()) {
					r_num = rs.getInt(1);
				}
				
				return r_num;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
					if(rs!=null) rs.close();
					if(ps!=null) ps.close();
					if(conn!=null) conn.close();
			} catch (Exception e2) {
			}
		}
	}
	
	public int addReview(int s_idx, int m_idx, ReviewDTO dto) {
		try {
			conn=com.db.wishJam.DbConn.getConn();
			String sql = "insert into review values(rv_seq.nextval,?,?,?,?,?,sysdate)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, s_idx);
			ps.setInt(2, m_idx);
			ps.setString(3, dto.getR_img());
			ps.setInt(4, dto.getR_star());
			ps.setString(5, dto.getR_content());
			
			int count = ps.executeUpdate();
			
			return count;
	} catch (Exception e) {
		e.printStackTrace();
		return -1;
	} finally {
		try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
		} catch (Exception e2) {
		}
	}
	}
}
