package com.pay.wishJam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.cart.wishJam.CartDTO;

public class PayDAO {
	
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	/** 구매전 내역조회 */
	public List<PayDTO> payList(String ct_idx) {
		List<PayDTO> plist = new ArrayList<PayDTO>();
		
		try {
			conn = com.db.wishJam.DbConn.getConn();
			
			String sql = " select sg_img, sg_name, ct_count, sg_price, s_discnt, sg_discnt, m_name, m_tel, m_email, m_addr "
					+ " from cart ca join s_goods sg on ca.sg_idx = sg.sg_idx "
					+ " join member me on ca.m_idx = me.m_idx "
					+ " join sell se on sg.s_idx = se.s_idx "
					+ " where ct_idx = ?  ";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, ct_idx);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				String sg_img = rs.getString("sg_img");
				String sg_name = rs.getString("sg_name");
				int ct_count = rs.getInt("ct_count");
				int sg_price = rs.getInt("sg_price");
				double s_discnt = rs.getDouble("s_discnt")/100;
				int sg_discnt = rs.getInt("sg_discnt");
				String m_name = rs.getString("m_name");
				String m_tel = rs.getString("m_tel");
				String m_email = rs.getString("m_email");
				String m_addr = rs.getString("m_addr");

				plist.add(new PayDTO(m_name,m_tel,m_email,m_addr,ct_count,sg_price,sg_discnt,sg_name,sg_img,s_discnt));
			}
			
			return plist;
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
