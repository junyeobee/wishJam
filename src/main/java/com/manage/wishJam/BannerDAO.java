package com.manage.wishJam;
import java.sql.*;
import java.util.*;
import java.util.Date;

public class BannerDAO {
	Connection con;
    PreparedStatement ps;
    ResultSet rs;
    public BannerDAO() {
		// TODO Auto-generated constructor stub
	}
    
    //배너 리스트 뽑는 메소드
    public ArrayList<BannerDTO>listBanner(){
    	try {
    		con = com.db.wishJam.DbConn.getConn();
    		String sql = "select * from banner order by b_idx asc";
    		ps = con.prepareStatement(sql);
    		rs = ps.executeQuery();
    		ArrayList<BannerDTO> arr = new ArrayList<BannerDTO>();
    		
    		if (rs.next()) {
    			do {
        			BannerDTO dto = new BannerDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getDate(4),rs.getDate(5),rs.getString(6));
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
    
    //배너 추가 메소드
    public int insertBanner(int b_idx, String b_name, String b_src,java.sql.Date b_sdate, java.sql.Date b_edate){
        try {
        	System.out.println(b_edate);
            con = com.db.wishJam.DbConn.getConn();
            String sql = "insert into banner(b_idx, b_name, b_src, b_sdate, b_edate) values (?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setInt(1, b_idx);
            ps.setString(2, b_name);
            ps.setString(3, b_src);
            ps.setDate(4, b_sdate);
            ps.setDate(5, b_edate);
            int a = ps.executeUpdate();
            
            sql = "select b_seq.nextval from dual";
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
    //배너이미지 경로 뽑는 시퀀스(이번달에 해당하는)
    public ArrayList<String> getBannerList(){
    	try {
    		con = com.db.wishJam.DbConn.getConn();
    		String sql = "select b_src from banner where b_edate > sysdate and b_edate < (select trunc(add_months(sysdate, 1), 'mm') from dual)";
    		ps = con.prepareStatement(sql);
    		rs = ps.executeQuery();
    		ArrayList<String> arr = new ArrayList<String>();
    		if(rs.next()) {
    			do {
    				arr.add(rs.getString(1));
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
    
    public int getBIdx() {
    	try {
    		int a = 0;
    		con = com.db.wishJam.DbConn.getConn();
    		String sql = "select last_number from all_sequences where sequence_name = 'B_SEQ'";
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
    //배너삭제메소드
    public int deleteBanner(int idx) {
    	try {
    		int a = 0;
    		con = com.db.wishJam.DbConn.getConn();
    		String sql = "delete from banner where b_idx = ?";
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
}
