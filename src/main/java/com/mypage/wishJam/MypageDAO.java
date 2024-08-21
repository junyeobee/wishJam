package com.mypage.wishJam;
import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import com.allgoods.wishJam.AllgoodsDTO;

public class MypageDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	//회원정보 받아서 출력
	public MypageDTO memberGet(String id) {
		MypageDTO mypage=null;
		
		try {
			con = com.db.wishJam.DbConn.getConn();
			
			String sql="select mypage.*,member.* from mypage join member on mypage.m_idx=member.m_idx where member.m_id=?";
			ps=con.prepareStatement(sql);
			ps.setString(1,id);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {				
				 mypage= new MypageDTO();
				
				mypage.setUserid(id);
				mypage.setM_nick(rs.getString("m_nick"));
				mypage.setProfile(rs.getString("profile"));
				mypage.setM_grade(rs.getString("m_grade"));				
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
			
			String sql="update mypage set m_nick=?, m_tel=?, m_addr=?, m_email=?, profile=? where m_id=?";
			ps=con.prepareStatement(sql);
		    ps.setString(1,dto.getM_nick());
		    ps.setString(2, dto.getM_tel());
		    ps.setString(3, dto.getM_addr());
		    ps.setString(4, dto.getM_email());
		    ps.setString(5, dto.getProfile());
		    ps.setString(6, id);
		    
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
	

	
	public List<MypageDTO> buyList(String nick){
		
	List<MypageDTO> bl = new ArrayList();
	
	try {
		con = com.db.wishJam.DbConn.getConn();
		
		String sql = "select sell.*,s_goods.* from sell join s_goods on sell.s_idx = s_goods.s_idx where sell.s_idx between 1 and 4 and sell.m_nick=?";
		ps=con.prepareStatement(sql);
		ps.setString(1, nick);
		rs=ps.executeQuery();
		
		while(rs.next()) {
			String seller= rs.getString("m_nick");
			String name = rs.getString("s_title");
			int jjim = rs.getInt("s_jjim");
			int price = rs.getInt("sg_main");
			String thumbnail_url = rs.getString("s_img");
			bl.add(new MypageDTO(jjim, name, price, seller, thumbnail_url));
			
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	return bl;
		
	}
	
	
	
}
