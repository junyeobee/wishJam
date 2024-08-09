package com.manage.wishJam;

import java.sql.*;
import java.util.*;

public class ExampleDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public ExampleDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public ArrayList<ExampleDTO> ex(){
		try {
			con = com.db.wishJam.DbConn.getConn();
			String sql = "select * from grade";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<ExampleDTO> arr = new ArrayList<ExampleDTO>();
			rs.next();
			if(rs!=null) {
				do {
				ExampleDTO e = new ExampleDTO(rs.getInt(1), rs.getString(2), rs.getInt(3));
				arr.add(e);
				}while(rs.next());
			}else {
				return null;
			}
			return arr;
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
	public int gradeEdit(int num) {
		try {
			con = com.db.wishJam.DbConn.getConn();
			String sql = "update grade set g_point = ? where g_name = '예시'";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			int num2 = ps.executeUpdate();
			return num2;
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
	public int updateGrade(ArrayList<ExampleDTO> grades) {
	    int result = 0;
	    try {
	        con = com.db.wishJam.DbConn.getConn();
	        String sql = "UPDATE grade SET g_point = ? WHERE g_name = ?";
	        ps = con.prepareStatement(sql);
	        for (ExampleDTO dto : grades) {
	            ps.setInt(1, dto.getG_point());
	            ps.setString(2, dto.getG_name());
	            ps.addBatch();
	        }
	        int[] results = ps.executeBatch();
	        result = Arrays.stream(results).sum();
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	        result = 1;
	    } finally {
	        try {
	            if (ps != null) 
	            	ps.close();
	            if (con != null) 
	            	con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return result;
	}
	
}
