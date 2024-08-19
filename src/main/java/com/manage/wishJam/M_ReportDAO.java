package com.manage.wishJam;

import java.sql.*;
import java.util.*;
import com.manage.wishJam.M_ReportDTO;

public class M_ReportDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	public int getTotalcnt() {
		try {
			con = com.db.wishJam.DbConn.getConn();
			String sql = "select count(*) from report";
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
	public ArrayList<M_ReportDTO> allReports(int cp, int ls) {
		try {
			con = com.db.wishJam.DbConn.getConn();
			int start = (cp - 1) * ls + 1;
			int end = cp * ls;
			String sql = "select * from "
					+ "(select rownum as rnm,a.* from  "
					+ "(select * from report order by rp_idx asc) a)b "
					+ "where rnm >=? and rnm <= ?";
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			ArrayList<M_ReportDTO> arr = new ArrayList<M_ReportDTO>();
			if(rs.next()) {
				do {
					M_ReportDTO dto = new M_ReportDTO(rs.getInt(2),rs.getInt(3),rs.getInt(4),rs.getString(5),rs.getInt(6),rs.getInt(7),rs.getInt(8));
					arr.add(dto);
				}while(rs.next());
			}
			return arr;
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
	
	public M_ReportDTO getDetail(int idx) {
		try {
			con = com.db.wishJam.DbConn.getConn();
			String sql = "select * from report where rp_idx = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, idx);
			rs = ps.executeQuery();
			M_ReportDTO dto = null;
			if (rs.next()) {
				dto = new M_ReportDTO(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getInt(5),rs.getInt(6),rs.getInt(7)
				);
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
	
	public ArrayList<M_ReportDTO> getReportsBySeller(int rid) {
		try {
			ArrayList<M_ReportDTO> list = new ArrayList<M_ReportDTO>();
			String sql = "select * from report where reported_idx = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, rid);
	        rs = ps.executeQuery();
	        if(rs.next()) {
	        	do {
	        		M_ReportDTO dto = new M_ReportDTO();
					dto.setRp_idx(rs.getInt("rp_idx"));
					dto.setS_idx(rs.getInt("s_idx"));
					dto.setC_idx(rs.getInt("c_idx"));
					dto.setRp_reason(rs.getString("rp_reason"));
					dto.setReported_idx(rs.getInt("reported_idx"));
					dto.setReporter_idx(rs.getInt("reporter_idx"));
					list.add(dto);
	        	}while(rs.next());
	        }
	        return list;
	    } catch (Exception e) {
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
	

}
