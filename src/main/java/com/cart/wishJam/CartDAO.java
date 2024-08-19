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
	
	/** 장바구니 내역조회 */
	public List<CartDTO> cartList(String user_id) {
		List<CartDTO> ctlist = new ArrayList<CartDTO>();
		
		try {
			conn = com.db.wishJam.DbConn.getConn();
			
			String sql = " select ct_idx, m_id, s_title, sg_name, sg_img, ct_count, ct_price, ct_dispr, (ct_price-ct_dispr) as ct_sale, sg_count, sg_limit, s_start, s_end+1 as s_end "
					+ " from cart ca join s_goods sg on ca.sg_idx = sg.sg_idx "
					+ " join member me on ca.m_idx = me.m_idx "
					+ " join sell se on sg.s_idx = se.s_idx "
					+ " where m_id = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, user_id);
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
				int sg_count = rs.getInt("sg_count");
				int sg_limit = rs.getInt("sg_limit");
				Date s_start = rs.getDate("s_start");
				Date s_end = rs.getDate("s_end");
				
				ctlist.add(new CartDTO(ct_idx, m_id, s_title, sg_name, sg_img, ct_count, ct_price, ct_dispr, ct_sale, sg_count, sg_limit, s_start, s_end));
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
	
	/** 장바구니 내역삭제 */
	public int cartDel(int ct_idx) {
		try {
			conn = com.db.wishJam.DbConn.getConn();
			
			String sql = " DELETE FROM cart "
					+ " WHERE ct_idx = ? ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, ct_idx);
			
			int count = ps.executeUpdate();
			
			return count;
		} catch (Exception e) {
			e.printStackTrace();
	        return -1;
		} finally {
	           try {
	               if(ps!=null) ps.close();
	               if(conn!=null) conn.close();
	            } catch (Exception e2) {
	               
	            }
	    }
	}
	
	/** 상품개수 증가 */
	public int goodsplus(int ct_idxplus) {
		try {
			conn = com.db.wishJam.DbConn.getConn();
			
			String sql = " UPDATE cart "
					+ " SET ct_count = ct_count+1 "
					+ " WHERE ct_idx = ? ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, ct_idxplus);
			
			int count = ps.executeUpdate();
			
			return count;
		} catch (Exception e) {
			e.printStackTrace();
	        return -1;
		} finally {
	           try {
	               if(ps!=null) ps.close();
	               if(conn!=null) conn.close();
	            } catch (Exception e2) {
	               
	            }
	    }
	}
	
	/** 상품개수 감소 */
	public int goodsminus(int ct_idxminus) {
		try {
			conn = com.db.wishJam.DbConn.getConn();
			
			String sql = " UPDATE cart "
					+ " SET ct_count = ct_count-1 "
					+ " WHERE ct_idx = ? ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, ct_idxminus);
			
			int count = ps.executeUpdate();
			
			return count;
		} catch (Exception e) {
			e.printStackTrace();
	        return -1;
		} finally {
	           try {
	               if(ps!=null) ps.close();
	               if(conn!=null) conn.close();
	            } catch (Exception e2) {
	               
	            }
	    }
	}
}
