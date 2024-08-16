package com.wishJam.detail;

import java.sql.*;

public class DetailImgDAO {
	private String homePath;
	private int s_idx;
	private String m_nick;
	private String select_id;
	private int imgcnt;
	private String everypath = "img/sellgoods/";
	
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public int addImg(String imgname) {
		try {
				conn=com.db.wishJam.DbConn.getConn();
				String imgpath = "/wishJam/img/sellgoods/";
				String sql = "insert into sell(s_idx, s_img) values(?,?)";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, s_idx);
				ps.setString(2, imgpath);
				
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

	public String getM_nick() {
		return m_nick;
	}

	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}

	public String getSelect_id() {
		return select_id;
	}

	public void setSelect_id(String select_id) {
		this.select_id = select_id;
	}

	public int getImgcnt() {
		return imgcnt;
	}

	public void setImgcnt(int imgcnt) {
		this.imgcnt = imgcnt;
	}
	
}
