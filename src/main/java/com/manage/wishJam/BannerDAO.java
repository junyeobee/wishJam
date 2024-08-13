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
    public int insertBanner(String b_name, java.sql.Date b_sdate, java.sql.Date b_edate){
        try {
        	System.out.println(b_edate);
            con = com.db.wishJam.DbConn.getConn();
            String insertQuery = "INSERT INTO banner (b_idx, b_name, b_sdate, b_edate, b_src) VALUES (b_seq.nextval, ?, ?, ?, '/wishJam/img/banner/default.jpg')";
            ps = con.prepareStatement(insertQuery);
            ps.setString(1, b_name);
            ps.setDate(2, b_sdate);
            ps.setDate(3, b_edate);
            int a = ps.executeUpdate();
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
    
    public int getNextVal() {
    	try {
    		con = com.db.wishJam.DbConn.getConn();
    		String sql = "SELECT b_seq.NEXTVAL FROM dual";
    		ps = con.prepareStatement(sql);
    		rs = ps.executeQuery();
    		rs.next();
    		int result = rs.getInt(1);
    		return result;
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
    		String sql = "select b_seq.nextval from dual";
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
}
