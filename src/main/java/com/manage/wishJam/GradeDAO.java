package com.manage.wishJam;

import java.sql.*;
import java.util.*;

public class GradeDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;	
	
	public GradeDAO() {
		// TODO Auto-generated constructor stub
	}
	public int getTotalcnt() {
		try {
			con = com.db.wishJam.DbConn.getConn();
			String sql = "select count(*) from grade";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			int cnt = rs.getInt(1);			
			return cnt==0?1:cnt;
		}catch(Exception e) {
			e.printStackTrace();
			return 1;
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	public ArrayList<GradeDTO> getGradelist(){
		try {
			con = com.db.wishJam.DbConn.getConn();
			String sql = "select * from grade";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<GradeDTO> arr = new ArrayList<GradeDTO>();
			if(rs.next()) {
				do {
					GradeDTO dto = new GradeDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4));
					arr.add(dto);
				}while(rs.next());
			}
			return arr;
		}catch(Exception e) {
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
	public int deleteBanner(int idx) {
		try {
    		int a = 0;
    		con = com.db.wishJam.DbConn.getConn();
    		String sql = "delete from grade where g_idx = ?";
    		ps = con.prepareStatement(sql);
    		ps.setInt(1, idx);
    		a = ps.executeUpdate();
    		return a;
    	}catch(Exception e) {
    		e.printStackTrace();
    		return -1;
    	}finally {
    		try {
    			if (ps != null) 
                	ps.close();
                if (con != null) 
                	con.close();
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}
	}
	public void imgUpload(int idx, String url) {
    	try {
    		con = com.db.wishJam.DbConn.getConn();
    		String sql = "update grade set g_src=? where g_idx = ?";
    		ps = con.prepareStatement(sql);
    		ps.setString(1, url);
    		ps.setInt(2, idx);
    		ps.executeQuery();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		try {
    			if (ps != null) 
                	ps.close();
                if (con != null) 
                	con.close();
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
    	}
    }
}
