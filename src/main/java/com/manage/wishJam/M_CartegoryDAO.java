package com.manage.wishJam;

import java.sql.*;
import java.util.*;
import com.wishJam.category.CategoryDTO;

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
	public int getTotalcnt(int d) {
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
	
	public ArrayList<CategoryDTO> getBigCategory(){
		try {
			con = com.db.wishJam.DbConn.getConn();
			String sql = "select c_idx, c_big, c_small, c_name, c_hash, c_img from category where c_small is null";
			ArrayList<CategoryDTO> arr = new ArrayList<CategoryDTO>();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				do {
					CategoryDTO dto = new CategoryDTO(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6));
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
	public ArrayList<CategoryDTO> getSmallCategory(int c_big){
		try {
			con = com.db.wishJam.DbConn.getConn();
			String sql = "select c_idx, c_big, c_small, c_name, c_hash, c_img from category where c_small is not null and c_big = ?";
			ArrayList<CategoryDTO> arr = new ArrayList<CategoryDTO>();
			ps = con.prepareStatement(sql);
			ps.setInt(1, c_big);
			rs = ps.executeQuery();
			if(rs.next()) {
				do {
					CategoryDTO dto = new CategoryDTO(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6));
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
}
