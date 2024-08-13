package com.cart.wishJam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CartDAO {
	
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public List<CartDTO> cartList() {
		List<CartDTO> ctlist = new ArrayList<CartDTO>();
		
		try {
			conn = com.db.wishJam.DbConn.getConn();
			
			String sql = " select ct_idx, m_id, s_title, sg_name, sg_img, ct_count, ct_price, ct_dispr, (ct_price-ct_dispr) as ct_sale, s_start, s_end "
					+ " from cart ca join s_goods sg on ca.sg_idx = sg.sg_idx "
					+ " join member me on ca.m_idx = me.m_idx "
					+ " join sell se on sg.s_idx = se.s_idx ";
			ps = conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				int ct_idx = rs.getInt("ct_idx");
				String m_id = rs.getString("m_id");
				String s_title = rs.getString("s_title");
				String sg_name = rs.getString("sg_name");
				String sg_img = rs.getString("sg_img");
				int ct_count = rs.getInt("ct_count");
				int ct_price = rs.getInt("ct_price");
				int ct_dispr = rs.getInt("ct_dispr");
				int ct_sale = rs.getInt("ct_sale");
				Date s_start = rs.getDate("s_start");
				Date s_end = rs.getDate("s_end");
				
				ctlist.add(new CartDTO(ct_idx, m_id, s_title, sg_name, sg_img, ct_count, ct_price, ct_dispr, ct_sale, s_start, s_end));
			}
			
			return ctlist;
		} catch (Exception e) {
			 e.printStackTrace();
	         return null;
		} finally {
	           try {
	               if(rs!=null) rs.close();
	               if(ps!=null) ps.close();
	               if(conn!=null) conn.close();
	            } catch (Exception e2) {
	               
	            }
	    }
		
	}
}
