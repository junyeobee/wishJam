package com.mypage.wishJam;
import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import com.allgoods.wishJam.AllgoodsDTO;
import com.member.wishJam.MemberDTO;

public class MypageDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	//회원정보 받아서 출력
	public MypageDTO memberGet(int idx) {
		MypageDTO mypage=null;
		
		try {
			con = com.db.wishJam.DbConn.getConn();
			
			String sql="SELECT member.m_id,member.m_nick, member.m_tel, member.m_email, member.m_addr, grade.g_name, mypage.profile FROM member JOIN mypage ON member.m_idx = mypage.m_idx JOIN grade ON grade.g_idx = member.g_idx WHERE member.m_idx = ?";
			ps=con.prepareStatement(sql);
			ps.setInt(1,idx);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {				
				mypage= new MypageDTO();
				mypage.setM_id(rs.getString("m_id"));
				mypage.setM_nick(rs.getString("m_nick"));
				mypage.setM_tel(rs.getString("m_tel"));
				mypage.setM_email(rs.getString("m_email"));
				mypage.setM_addr(rs.getString("m_addr"));
				mypage.setM_grade(rs.getString("g_name"));
				mypage.setProfile(rs.getString("profile"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mypage;
	}
	


	//회원 정보 수정
	public int memberUpdate(MypageDTO dto, int idx) {
		
		try {
			
			con=com.db.wishJam.DbConn.getConn();
			

			String sql1 = "UPDATE member m SET m.m_nick = ?, m.m_pwd = ?, m.m_tel = ?, m.m_email = ?, m.m_addr = ? WHERE m.m_idx = ?";
			String sql2 = "UPDATE mypage mp SET mp.profile = ? WHERE mp.m_idx = ?";
			
			
			  ps = con.prepareStatement(sql1);
			    
			    ps.setString(1, dto.getM_nick());
			    ps.setString(2, dto.getM_pwd());
			    ps.setString(3, dto.getM_tel());
			    ps.setString(4, dto.getM_email());
			    ps.setString(5, dto.getM_addr());
			    ps.setInt(6, idx);
			    
			    int count1 = ps.executeUpdate();
	
		    ps = con.prepareStatement(sql2);
		    
		    ps.setString(1, dto.getProfile());
		    ps.setInt(2, idx);
		    
		    int count2 = ps.executeUpdate();
		    return count1+ count2;
		    
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(con!=null)con.close();
				if(ps!=null)ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}  
		}
	}
	
	
	
	
	public List<MypageDTO> buyList(int m_idx){
		
	List<MypageDTO> bl = new ArrayList();
	
	try {
		con = com.db.wishJam.DbConn.getConn();
		
		String sql = "select sell.*,s_goods.* from sell join s_goods on sell.s_idx = s_goods.s_idx where sell.s_idx between 1 and 4 and sell.m_idx=?";
		ps=con.prepareStatement(sql);
		ps.setInt(1, m_idx); 
		rs=ps.executeQuery();
		
		while(rs.next()) {
			String m_nick= rs.getString("m_nick");
			String s_title = rs.getString("s_title");
			int sg_price = rs.getInt("sg_price");
			String s_img = rs.getString("s_img");
			bl.add(new MypageDTO(m_nick,s_title,sg_price,s_img ));
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	return bl;		
	}
}
