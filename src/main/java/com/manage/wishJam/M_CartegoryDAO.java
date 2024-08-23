package com.manage.wishJam;

import java.sql.*;
import java.util.*;

public class M_CartegoryDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public M_CartegoryDAO() {
		// TODO Auto-generated constructor stub
	}
	public int getTotalcnt() {
		try {
			con = com.db.wishJam.DbConn.getConn();
			String sql = "select count(*) from category";
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
	
	public ArrayList<M_CategoryDTO> getBigCategory(){
		try {
			con = com.db.wishJam.DbConn.getConn();
			String sql = "select c_idx, c_big, c_small, c_name, c_hash, c_img from category where c_small is null";
			ArrayList<M_CategoryDTO> arr = new ArrayList<M_CategoryDTO>();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				do {
					M_CategoryDTO dto = new M_CategoryDTO(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6));
					arr.add(dto);
				}while(rs.next());
			}
			
			return arr;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(con != null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	public ArrayList<M_CategoryDTO> getSmallCategory(int c_big){
		try {
			con = com.db.wishJam.DbConn.getConn();
			String sql = "select c_idx, c_big, c_small, c_name, c_hash, c_img from category where c_small is not null and c_big = ?";
			ArrayList<M_CategoryDTO> arr = new ArrayList<M_CategoryDTO>();
			ps = con.prepareStatement(sql);
			ps.setInt(1, c_big);
			rs = ps.executeQuery();
			if(rs.next()) {
				do {
					M_CategoryDTO dto = new M_CategoryDTO(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6));
					arr.add(dto);
				}while(rs.next());
			}
			
			return arr;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(con != null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	 public int getCIdx() {
    	try {
    		int a = 0;
    		con = com.db.wishJam.DbConn.getConn();
    		String sql = "select last_number from all_sequences where sequence_name = 'C_SEQ'";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				a = rs.getInt(1)+1;
			}
			return a;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null) 
	            	ps.close();
	            if (con != null) 
	            	con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

	public int getNextSeq(int c_big) {
		try {
			int nextNum = 0;
			con = com.db.wishJam.DbConn.getConn();
			String sql = "select coalesce(max(c_small), 0) + 1 as next_c_small from category where c_big = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, c_big);
			rs = ps.executeQuery();
			if(rs.next()) nextNum = rs.getInt(1);
			return nextNum;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null) 
	            	ps.close();
	            if (con != null) 
	            	con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	public int addCategory(int c_idx, int c_big, int c_small, String c_name, String c_hash, String c_img) {
		try {
			int result = 0;
			con = com.db.wishJam.DbConn.getConn();
			String sql = "insert into category values(?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, c_idx);
			ps.setInt(2, c_big);
			ps.setInt(3, c_small);
			ps.setString(4, c_name);
			ps.setString(5, c_hash);
			ps.setString(6, c_img);
			result = ps.executeUpdate();
			sql = "select c_seq.nextval from dual";
			ps = con.prepareStatement(sql);
			ps.executeQuery();
			return result;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null) 
	            	ps.close();
	            if (con != null) 
	            	con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public int editCategory(int c_idx, int c_big, int c_small, String c_name, String c_hash, String c_img) {
		try {
			int result = 0;
			con = com.db.wishJam.DbConn.getConn();
			String sql = "update category set c_big = ?, c_small = ?, c_name = ?, c_hash = ?, c_img = ? where c_idx = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, c_big);
			ps.setInt(2, c_small);
			ps.setString(3, c_name);
			ps.setString(4, c_hash);
			ps.setString(5, c_img);
			ps.setInt(6, c_idx);
			result = ps.executeUpdate();
			sql = "select c_seq.nextval from dual";
			ps = con.prepareStatement(sql);
			ps.executeQuery();
			return result;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null) 
	            	ps.close();
	            if (con != null) 
	            	con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	public M_CategoryDTO editCart(int idx) {
		try {
			con = com.db.wishJam.DbConn.getConn();
			String sql = "select * from category where c_idx = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, idx);
			rs = ps.executeQuery();
			M_CategoryDTO dto = null;
			if(rs.next()) dto = new M_CategoryDTO(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6));
			return dto;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if (rs != null)
					rs.close();
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
