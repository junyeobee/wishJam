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
	public int deleteGrade(int idx) {
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
    public int getGIdx() {
    	try {
    		int a = 0;
    		con = com.db.wishJam.DbConn.getConn();
    		String sql = "select last_number from all_sequences where sequence_name = 'G_SEQ'";
    		ps = con.prepareStatement(sql);
    		rs = ps.executeQuery();
    		if(rs.next()) {
    			a = rs.getInt(1);
    		}
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
    public GradeDTO editGradeForm(int idx) {
    	try {
    		con = com.db.wishJam.DbConn.getConn();
    		String sql = "select * from grade where g_idx = ?";
    		ps = con.prepareStatement(sql);
    		ps.setInt(1, idx);
    		rs = ps.executeQuery();
    		GradeDTO dto = new GradeDTO();
    		if(rs!=null) {
    			rs.next();
    			String g_name = rs.getString(2);
    			String g_src = rs.getString(3);
    			int g_point = rs.getInt(4);
    			dto = new GradeDTO(idx,g_name,g_src,g_point);
    		}
    		return dto;
    	}catch(Exception e) {
    		e.printStackTrace();
    		return null;
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
    public int editGrade(int idx, String name, String src, int point) {
    	try {
    		con = com.db.wishJam.DbConn.getConn();
    		String sql = "update grade set g_name = ?, g_src = ? , g_point = ? where g_idx = ?";
    		ps = con.prepareStatement(sql);
    		ps.setString(1, name);
    		ps.setString(2, src);
    		ps.setInt(3, point);
    		ps.setInt(4, idx);
    		int a = 0;
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
    
    public int insertGrade(int g_idx, String g_name, String g_src,int g_point){
        try {
			con = com.db.wishJam.DbConn.getConn();
			String sql = "insert into grade(g_idx, g_name, g_src, g_point) values (?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, g_idx);
			ps.setString(2, g_name);
			ps.setString(3, g_src);
			ps.setInt(4,g_point);
			int a = ps.executeUpdate();
            sql = "select g_seq.nextval from dual";
            ps = con.prepareStatement(sql);
            ps.executeQuery();
            return a;
        } catch(Exception e){
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
}
