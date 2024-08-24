package com.manage.wishJam;

import java.sql.*;
import java.util.*;
import com.manage.wishJam.M_ReportDTO;

public class M_ReportDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	public int getTotalcnt(String listType) {
		try{
			String sql;
			con = com.db.wishJam.DbConn.getConn();
		    if ("compList".equals(listType)) {
		        sql = "select count(*) from report where r_stat = 1";
		    } else if ("incompList".equals(listType)) {
		        sql = "select count(*) from report where r_stat = 0";
		    } else {
		        sql = "select count(*) from report";
		    }
		    
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
			String sql = "select r.rp_idx, r.s_idx, r.rp_reason, r.r_stat, mr1.m_nick as reported_nick,mr2.m_nick as reporter_nick from (select rownum AS rnm, a.* from (select * from report order by rp_idx asc) a) r join member mr1 on r.reported = mr1.m_idx join member mr2 on r.reporter = mr2.m_idx where r.rnm between ? and ?";
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			ArrayList<M_ReportDTO> arr = new ArrayList<M_ReportDTO>();
			if(rs.next()) {
				do {
					M_ReportDTO dto = new M_ReportDTO(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(5),rs.getString(6));
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
	
	public ArrayList<M_ReportDTO> incompReports(int cp, int ls) {
		try {
			con = com.db.wishJam.DbConn.getConn();
			int start = (cp - 1) * ls + 1;
			int end = cp * ls;
			String sql = " SELECT b.rp_idx, b.s_idx, b.rp_reason, b.r_stat, mr1.m_nick AS reported_nick, mr2.m_nick AS reporter_nick FROM (SELECT * FROM (SELECT rownum AS rnm, a.* FROM (SELECT * FROM report WHERE r_stat = 0 ORDER BY rp_idx ASC) a) WHERE rnm BETWEEN ? AND ?) b JOIN member mr1 ON b.reported = mr1.m_idx JOIN member mr2 ON b.reporter = mr2.m_idx";
			ps = con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			ArrayList<M_ReportDTO> arr = new ArrayList<M_ReportDTO>();
			if(rs.next()) {
				do {
					M_ReportDTO dto = new M_ReportDTO(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(5),rs.getString(6));
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
	
	public ArrayList<M_ReportDTO> compReports(int cp, int ls) {
		try {
			con = com.db.wishJam.DbConn.getConn();
			int start = (cp - 1) * ls + 1;
			int end = cp * ls;
			String sql = "SELECT b.rp_idx, b.s_idx, b.rp_reason, b.r_stat, mr1.m_nick AS reported_nick, mr2.m_nick AS reporter_nick FROM (SELECT * FROM (SELECT rownum AS rnm, a.* FROM (SELECT * FROM report WHERE r_stat = 1 ORDER BY rp_idx ASC) a) WHERE rnm BETWEEN ? AND ?) b JOIN member mr1 ON b.reported = mr1.m_idx JOIN member mr2 ON b.reporter = mr2.m_idx";
			ps = con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			ArrayList<M_ReportDTO> arr = new ArrayList<M_ReportDTO>();
			if(rs.next()) {
				do {
					M_ReportDTO dto = new M_ReportDTO(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(5),rs.getString(6));
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
				dto = new M_ReportDTO(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getInt(4),rs.getInt(5),rs.getInt(6));
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
					dto.setRp_reason(rs.getString("rp_reason"));
					dto.setR_stat(rs.getInt("r_stat"));
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
	public int banPost(int rp_idx) {
		try {
			int result = 0;
			con = com.db.wishJam.DbConn.getConn();
			//r_stat(관리자용, 처리 완료/마완료, 0=미완료, 1=처리완료
			String sql = "update report set r_stat = 1 where rp_idx = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, rp_idx);
			ps.executeQuery();
			
			//해당 게시글 찾아서
			sql = "select s_idx from sell where s_idx = (select s_idx from report where rp_idx = ?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, rp_idx);
			rs = ps.executeQuery();
			rs.next();
			int s_idx = rs.getInt(1);
			
			//제재처리(1, 정지)
			sql = "update sell set s_stat = 1 where s_idx = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, s_idx);
			result = ps.executeUpdate();
			
			//장바구니에서 삭제
			sql = "delete from cart where ct_idx in (select ct_idx from cart where sg_idx = (select sg_idx from s_goods where s_idx = (select sell.s_idx from sell join report on sell.s_idx = report.s_idx where s_stat = 1)))";
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
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	public int selectSeller(int rp_idx) {
		try {
			int result = 0;
			con = com.db.wishJam.DbConn.getConn();
			String sql = "select m_idx from member where m_nick = (select m_nick from sell where s_idx = (select s_idx from report where rp_idx = ?))";
			ps = con.prepareStatement(sql);
			ps.setInt(1, rp_idx);
			rs = ps.executeQuery();
			if(rs.next())
				result = rs.getInt(1);
			System.out.println(result);
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
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	public int SellerToMsg(int m_idx) {
		try {
			int result = 0;
			String sql = "insert into notice_msg values(ntc_seq.nextval,?,'메세지',sysdate,0)";
			con = com.db.wishJam.DbConn.getConn();
			ps = con.prepareStatement(sql);
			ps.setInt(1, m_idx);
			result = ps.executeUpdate();
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
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	

}
