package com.wishJam.category;

import java.sql.*;
import java.util.*;

public class CategoryDAO {

	Connection conn;
	PreparedStatement ps;
	ResultSet rs;

	public ArrayList<CategoryDTO> list_bicC() {
		try {	
			ArrayList<CategoryDTO> blist = new ArrayList<CategoryDTO>();
			conn=com.db.wishJam.DbConn.getConn();
			String sql = "select * from category where c_small is null order by c_big asc";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			while(rs.next()){
				int c_idx = rs.getInt("c_idx");
				int c_big = rs.getInt("c_big");
				String c_name=rs.getString("c_name");
				
				CategoryDTO dto = new CategoryDTO(c_idx, c_big, 0, c_name);
				blist.add(dto);
			}
			
			return blist;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
					if(rs!=null) rs.close();
					if(ps!=null) ps.close();
					if(conn!=null) ps.close();
			} catch (Exception e2) {
			}
		}
	}
	
	public ArrayList<CategoryDTO> list_C(){
		try {	
			ArrayList<CategoryDTO> clist = new ArrayList<CategoryDTO>();
			conn=com.db.wishJam.DbConn.getConn();
			String sql = "select * from category where c_small is not null order by c_big, c_small asc";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			while(rs.next()){
				int c_idx = rs.getInt("c_idx");
				int c_big = rs.getInt("c_big");
				int c_small=rs.getInt("c_small");
				String c_name=rs.getString("c_name");
				
				CategoryDTO dto = new CategoryDTO(c_idx, c_big, c_small, c_name);
				clist.add(dto);
			}
			
			return clist;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
					if(rs!=null) rs.close();
					if(ps!=null) ps.close();
					if(conn!=null) ps.close();
			} catch (Exception e2) {
			}
		}
	}
	
	public ArrayList<Integer> B_num(){
		try {	
			ArrayList<Integer> cntlist = new ArrayList<Integer>();
			conn=com.db.wishJam.DbConn.getConn();
			String sql = "select distinct c_big from category order by c_big asc";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			while(rs.next()){
				int c_big = rs.getInt("c_big");

				cntlist.add(c_big);
			}
			
			return cntlist;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
					if(rs!=null) rs.close();
					if(ps!=null) ps.close();
					if(conn!=null) ps.close();
			} catch (Exception e2) {
			}
		}
	}
	
	public int C_num(int big){
		try {	
			int cnt =0;
			conn=com.db.wishJam.DbConn.getConn();
			String sql = "select count(c_small) from category where c_big=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, big);
			rs=ps.executeQuery();
			
			if(rs.next()) {
				cnt=rs.getInt(1);
			}
			
			return cnt;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
					if(rs!=null) rs.close();
					if(ps!=null) ps.close();
					if(conn!=null) ps.close();
			} catch (Exception e2) {
			}
		}
	}
}
