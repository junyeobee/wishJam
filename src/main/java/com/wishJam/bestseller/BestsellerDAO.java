package com.wishJam.bestseller;

import java.io.*;
import java.sql.*;
import java.util.*;

import com.mypage.wishJam.MypageDTO;




public class BestsellerDAO {

	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	
	//베스트 셀러 작가별 상품 출력 (찜 순서 많은것부터)
	public List<BestsellerDTO> bestSeller(String seller) {

		try {
			con = com.db.wishJam.DbConn.getConn();

			String sql = "select sell.*, s_goods.* from sell join s_goods on sell.s_idx = s_goods.s_idx where m_nick=? and rownum<=4 order by s_jjim desc ";

			ps = con.prepareStatement(sql);

			ps.setNString(1, seller);
			
			rs = ps.executeQuery();
			
			List<BestsellerDTO> bs = new ArrayList();
			
			
			while(rs.next()) {
				
				int idx= rs.getInt("s_idx");
				String name= rs.getString("s_title");
				int price= rs.getInt("sg_main");
				String m_nick = rs.getString("m_nick");
				String thumbnail_url=rs.getString("sg_img");
				int jjim=rs.getInt("s_jjim");
				
				bs.add(new BestsellerDTO(idx,name,price,m_nick,thumbnail_url,jjim));

			}
			 return bs;
		} catch (Exception e) {
		e.printStackTrace();
		return null;
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
	
	
	
	//베스트작가들 다수 출력
	public List<BestsellerDTO> bestSellers(BestsellerDTO dto) {
		
		
		try {
			con = com.db.wishJam.DbConn.getConn();

			String sql = "select sell.*, s_goods.* from sell join s_goods on sell.s_idx = s_goods.s_idx where m_nick=? and rownum<=4 order by s_jjim desc ";

			ps = con.prepareStatement(sql);

			ps.setString(1, dto.getM_nick());
			
			rs = ps.executeQuery();
			
			List<BestsellerDTO> bs = new ArrayList();
			
			
			while(rs.next()) {
				
				int idx= rs.getInt("s_idx");
				String name= rs.getString("s_title");
				int price= rs.getInt("sg_main");
				String m_nick = rs.getString("m_nick");
				String thumbnail_url=rs.getString("sg_img");
				int jjim=rs.getInt("s_jjim");
				
	
				bs.add(new BestsellerDTO(idx,name,price, m_nick,thumbnail_url,jjim));
			}
			 return bs;
		} catch (Exception e) {
		e.printStackTrace();
		return null;
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
	
	
	
	//한명 출력
public List<BestsellerDTO> bestSellersOne(String nick) {
		
		
		try {
			con = com.db.wishJam.DbConn.getConn();

			String sql = "select sell.*, s_goods.* from sell join s_goods on sell.s_idx = s_goods.s_idx where m_nick=? order by s_jjim desc ";

			ps = con.prepareStatement(sql);

			ps.setString(1, nick);
			
			rs = ps.executeQuery();
			
			List<BestsellerDTO> bs = new ArrayList();
			
			
			while(rs.next()) {
				
				int idx= rs.getInt("s_idx");
				String name= rs.getString("s_title");
				int price= rs.getInt("sg_main");
				String m_nick = rs.getString("m_nick");
				String thumbnail_url=rs.getString("sg_img");
				int jjim=rs.getInt("s_jjim");
				
	
				bs.add(new BestsellerDTO(idx,name,price, m_nick,thumbnail_url,jjim));
			}
			 return bs;
		} catch (Exception e) {
		e.printStackTrace();
		return null;
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
	
	
	
	//gold등급 이상 작가 닉네임 출력
	
	public List<BestsellerDTO> goldSeller() {
		
		List<BestsellerDTO> bestsellerNick = new ArrayList<>();
		
		
		try {
			con=com.db.wishJam.DbConn.getConn();
			
			String sql="select m_nick from member where m_grade='Gold'";
			
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			
			
			
			while(rs.next()) {
				String m_nick = rs.getString("m_nick");
				
				BestsellerDTO bdto= new BestsellerDTO(m_nick);
			
				bestsellerNick.add(bdto);
			}
			
			return bestsellerNick;
			
			
			
			
		} catch (Exception e) {
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
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
	}	

}
