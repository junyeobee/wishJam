package com.mypage.wishJam;
import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class MypageDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	//회원정보 받아서 출력
	public MypageDTO memberGet(String id) {
		MypageDTO mypage=null;
		
		try {
			con = com.db.wishJam.DbConn.getConn();
			
			String sql="select * from member where m_id=?";
			ps=con.prepareStatement(sql);
			ps.setString(1,id);
			
			rs=ps.executeQuery();
			
			if(rs.next()) {
				
				 mypage= new MypageDTO();
				
				mypage.setUserid(id);
				mypage.setM_nick(rs.getString("m_nick"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mypage;
	}
	


	//회원 정보 수정
	
	public int memberUpdate(MypageDTO dto, String id) {
		
		try {
			con=com.db.wishJam.DbConn.getConn();
			
			String sql="update member set m_nick=?, m_tel=?, m_addr=?, m_email=? where m_id=?";
			ps=con.prepareStatement(sql);
		    ps.setString(1,dto.getM_nick());
		    ps.setString(2, dto.getM_tel());
		    ps.setString(3, dto.getM_addr());
		    ps.setString(4, dto.getM_email());
		    ps.setString(5, id);
		    
		    int count= ps.executeUpdate();
		    
		    return count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(con!=null)con.close();
				if(ps!=null)ps.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			
			
		}
		
	}
	
	
	
	
	
	public List<MypageDTO> buyList(){
		
	List<MypageDTO> bl = new ArrayList();
	
	try {
		con = com.db.wishJam.DbConn.getConn();
		
		String sql = "select * from test_goods";
		ps=con.prepareStatement(sql);
		rs=ps.executeQuery();
		
		while(rs.next()) {
			int idx = rs.getInt("tg_idx");
			String name= rs.getString("tg_name");
			int price = rs.getInt("tg_price");
			String seller = rs.getString("tg_seller");
			String thumbnail_url=rs.getString("thumbnail_url");
			
			bl.add(new MypageDTO(idx, name, price, seller, thumbnail_url));
			
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	return bl;
		
	}
	
	
	
}
