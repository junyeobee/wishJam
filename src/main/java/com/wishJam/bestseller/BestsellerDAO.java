package com.wishJam.bestseller;

import java.io.*;
import java.sql.*;
import java.util.*;

import com.mypage.wishJam.MypageDTO;



//베스트 셀러 작가별 상품 출력 (찜 순서 많은것부터)
public class BestsellerDAO {

	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public List<BestsellerDTO> bestSeller(String sellers) {

		try {
			con = com.db.wishJam.DbConn.getConn();

			String sql = "select * from test_goods_b where tg_seller=? order by tg_jjim desc";

			ps = con.prepareStatement(sql);

			ps.setString(1, sellers);
			
			rs = ps.executeQuery();
			
			List<BestsellerDTO> bs = new ArrayList();
			
			
			while(rs.next()) {
				
				int idx= rs.getInt("tg_idx");
				String name= rs.getString("tg_name");
				int price= rs.getInt("tg_price");
				String seller = rs.getString("tg_seller");
				String thumbnail_url=rs.getString("thumbnail_url");
				int jjim=rs.getInt("tg_jjim");
				
				bs.add(new BestsellerDTO(idx,name,price,seller,thumbnail_url,jjim));

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
	
	
	//작가 리스트 출력
	
//	public List<BestsellerDTO> sellerList(){
//		
//		List<BestsellerDTO> sellerlist=new ArrayList();
//		
//		try {
//			con=com.db.wishJam.DbConn.getConn();
//			
//			String sql="select m_nick from test_member ";
//			ps=con.prepareStatement(sql);
//			ps.setString(0, sql);
//			
//			
//		} catch (Exception e) {
//			
//		}
//		
//	}
//
}
