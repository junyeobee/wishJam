package com.wishJam.review;

import java.sql.*;

public class reviewImgDAO {

	private String homePath;
	private int s_idx;
	private int m_idx;
	private int cnt;
	private String everypath = "img/review/";
	
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public int addImg() {
		try {
				conn=com.db.wishJam.DbConn.getConn();
				String imgpath = "/wishJam/img/review/";
				String sql = "insert into review(r_idx, s_idx, m_idx, r_img) values(review_r_idx.nextval,?,?,?)";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, s_idx);
				ps.setInt(2, m_idx);
				ps.setString(3, imgpath);
				
				int count = ps.executeUpdate();
				
				return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
					if(ps!=null) ps.close();
					if(conn!=null) conn.close();
			}catch(Exception e2) {}
		}
	}

	public String getHomePath() {
		return homePath;
	}

	public void setHomePath(String homePath) {
		this.homePath = homePath;
	}

	public String getEverypath() {
		return everypath;
	}

	public void setEverypath(String everypath) {
		this.everypath = everypath;
	}

	public int getS_idx() {
		return s_idx;
	}

	public void setS_idx(int s_idx) {
		this.s_idx = s_idx;
	}

	public int getM_idx() {
		return m_idx;
	}

	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

}
