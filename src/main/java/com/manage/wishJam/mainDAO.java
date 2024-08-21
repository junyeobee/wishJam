package com.manage.wishJam;

import java.sql.*;
import java.util.*;

public class mainDAO {
	
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public mainDAO() {
		// TODO Auto-generated constructor stub
	}
	public String getImgsrc(int m_idx) {
		try {
			con = com.db.wishJam.DbConn.getConn();
			String sql = "select m_img from mypage where m_idx = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, m_idx);
			String src = null;
			rs = ps.executeQuery();
			if(rs.next()) src = rs.getString(1);
			return src;			
		}catch(Exception e){
			e.printStackTrace();
			return null;			
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
