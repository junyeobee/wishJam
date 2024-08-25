package com.wishJam.bestseller;

import java.io.*;
import java.sql.*;
import java.util.*;

import com.allgoods.wishJam.AllgoodsDTO;
import com.mypage.wishJam.MypageDTO;




public class BestsellerDAO {

	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	
	//베스트 셀러 작가별 상품 출력 (찜 순서 많은것부터)
	public List<BestsellerDTO> bestSeller(String seller) {

		try {
			
			con = com.db.wishJam.DbConn.getConn();

			String sql = "select member.m_nick, sell.*, s_goods.* from sell join s_goods on sell.s_idx = s_goods.s_idx join member on member.m_idx=sell.m_idx where member.m_nick=? and rownum<=4 order by s_jjim desc";

			ps = con.prepareStatement(sql);

			ps.setNString(1, seller);
			
			rs = ps.executeQuery();
			
			List<BestsellerDTO> bs = new ArrayList();
			

			while (rs.next()) {
				String m_nick= rs.getString("m_nick");
				String s_title = rs.getString("s_title");
				int s_idx=rs.getInt("s_idx");
				int m_idx=rs.getInt("m_idx");
				int s_jjim = rs.getInt("s_jjim");
				int sg_discnt= rs.getInt("sg_discnt"); 
				System.out.println(sg_discnt);
				int s_discnt= rs.getInt("s_discnt"); 
				int sg_main = rs.getInt("sg_main");
				int sg_price = rs.getInt("sg_price");
				String s_img = rs.getString("s_img");
				bs.add(new BestsellerDTO(m_nick,s_title,s_idx,m_idx,s_jjim ,sg_discnt, s_discnt, sg_main, sg_price,s_img));
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

			String sql = "select member.m_nick, sell.*, s_goods.* from sell join s_goods on sell.s_idx = s_goods.s_idx join member on member.m_idx=sell.m_idx where member.m_nick=? and  sell.s_stat = 0 and s_goods.sg_main = 1 and rownum<=4 order by s_jjim desc";

			ps = con.prepareStatement(sql);

			ps.setString(1, dto.getM_nick());
			
			rs = ps.executeQuery();
			
			List<BestsellerDTO> bs = new ArrayList();
			
			
			while (rs.next()) {
				String m_nick= rs.getString("m_nick");
				String s_title = rs.getString("s_title");
				int s_idx=rs.getInt("s_idx");
				int m_idx=rs.getInt("m_idx");
				int s_jjim = rs.getInt("s_jjim");
				int sg_discnt= rs.getInt("sg_discnt"); 
				System.out.println(sg_discnt);
				int s_discnt= rs.getInt("s_discnt"); 
				int sg_main = rs.getInt("sg_main");
				int sg_price = rs.getInt("sg_price");
				String s_img = rs.getString("s_img");
				bs.add(new BestsellerDTO(m_nick,s_title,s_idx,m_idx,s_jjim ,sg_discnt, s_discnt, sg_main, sg_price,s_img));
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
	
	
	
	//태그 눌렀을 떄 한명꺼만 출력 !!! 
public List<BestsellerDTO> bestSellersOne(String nick) {
		
		
		try {
			con = com.db.wishJam.DbConn.getConn();

			String sql = "select member.m_nick, sell.*, s_goods.* from sell join s_goods on sell.s_idx = s_goods.s_idx join member on member.m_idx=sell.m_idx where member.m_nick=?   and  sell.s_stat = 0 and s_goods.sg_main = 1  order by s_jjim   ";

			ps = con.prepareStatement(sql);

			ps.setString(1, nick);
			
			rs = ps.executeQuery();
			
			List<BestsellerDTO> bs = new ArrayList();
			
			
			while (rs.next()) {
				String m_nick= rs.getString("m_nick");
				String s_title = rs.getString("s_title");
				int s_idx=rs.getInt("s_idx");
				int m_idx=rs.getInt("m_idx");
				int s_jjim = rs.getInt("s_jjim");
				int sg_discnt= rs.getInt("sg_discnt"); 
				System.out.println(sg_discnt);
				int s_discnt= rs.getInt("s_discnt"); 
				int sg_main = rs.getInt("sg_main");
				int sg_price = rs.getInt("sg_price");
				String s_img = rs.getString("s_img");
				bs.add(new BestsellerDTO(m_nick,s_title,s_idx,m_idx,s_jjim ,sg_discnt, s_discnt, sg_main, sg_price,s_img));
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
			
			String sql="select member.m_nick from member join grade on grade.g_idx=member.g_idx where grade.g_idx=5";
			
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
