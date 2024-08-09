package com.manage.wishJam;
import java.io.*;
import java.sql.*;

public class manageDAO {
	//1. 실제 파일 및 폴더가 있는 절대 경로
	private String homePath;
	//4. 공통경로
	private String url = "img/profile/";
	private String banner = "img/banner/";
	
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public String getHomePath() {
		return homePath;
	}
	public void setHomePath(String homePath) {
		this.homePath = homePath;
	}
	public String getUrl() {
		return url;
	}
	public String getBanner() {
		return banner;
	}
	public manageDAO() {
	}
	
	public void imgUpload(int idx, String url) {
		try {
			con = com.db.wishJam.DbConn.getConn();
			String sql = "update banner set b_src = ? where b_idx = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, url);
			ps.setInt(2, idx);
			ps.executeQuery();			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null) 
					ps.close();
				if(con!=null) 
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
