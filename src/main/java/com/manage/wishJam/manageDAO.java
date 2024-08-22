package com.manage.wishJam;

import java.sql.*;
import com.member.wishJam.MemberDTO;

public class manageDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	public manageDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public int getPwd(String pwd,int m_idx) {
		try {
			con = com.db.wishJam.DbConn.getConn();
			String sql = "select m_pwd from member where m_idx = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, m_idx);
			rs = ps.executeQuery();
			int result = 0;
			if(rs.next()) result = rs.getString(1).equals(pwd)?1:0;
			return result;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(con!=null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	public int changeImg(int m_idx,String m_img) {
		try {
			con = com.db.wishJam.DbConn.getConn();
			String sql = "update mypage set m_img = ? where m_idx = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, m_img);
			ps.setInt(2, m_idx);
			int result = ps.executeUpdate();
			return result;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(con!=null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}
