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
			
			String sql = " select ct_idx, m_id, se.s_idx, s_title, sg_name, sg_img, ct_count, sg_price, s_discnt, sg_discnt, sg_count, sg_limit, s_start, s_end+1 as s_end, ct_ckbox "
					+ " from cart ca join s_goods sg on ca.sg_idx = sg.sg_idx "
					+ " join member me on ca.m_idx = me.m_idx "
					+ " join sell se on sg.s_idx = se.s_idx "
					+ " where m_id = ? and s_stat = 0 ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, user_id);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				int ct_idx = rs.getInt("ct_idx");
				String m_id = rs.getString("m_id");
				int s_idx = rs.getInt("s_idx");
				String s_title = rs.getString("s_title");
				String sg_name = rs.getString("sg_name");
				String sg_img = rs.getString("sg_img");
				int ct_count = rs.getInt("ct_count");
				int sg_price = rs.getInt("sg_price");
				double s_discnt = rs.getDouble("s_discnt")/100;
				int sg_discnt = rs.getInt("sg_discnt");
				int sg_count = rs.getInt("sg_count");
				int sg_limit = rs.getInt("sg_limit");
				Date s_start = rs.getDate("s_start");
				Date s_end = rs.getDate("s_end");
				int ct_ckbox = rs.getInt("ct_ckbox");
				
				ctlist.add(new CartDTO(ct_idx, ct_count, ct_ckbox, m_id, sg_name, sg_price, sg_discnt, sg_count, sg_limit, sg_img, s_idx, s_title, s_start, s_end, s_discnt));
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
	
	/** 체크박스 변경 */
	public int costchange(int ct_idxck, int ct_ckchange) {
		try {
			conn = com.db.wishJam.DbConn.getConn();
			
			String sql = " UPDATE cart "
					+ " SET ct_ckbox = ? "
					+ " WHERE ct_idx = ? ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, ct_ckchange);
			ps.setInt(2, ct_idxck);
			
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
	
	/** 결제진행시 체크박스 상태복구 */
	public int ckchange(CartDTO cdto) {
		try {
			conn = com.db.wishJam.DbConn.getConn();
			
			String sql = " UPDATE cart "
					+ " SET ct_ckbox = 1 "
					+ " WHERE sg_idx IN (SELECT sg_idx "
					+ "					 FROM s_goods "
					+ "					 WHERE s_idx IN (SELECT s_idx FROM sell "
					+ "									 WHERE sysdate BETWEEN s_start AND s_end+1) AND sg_count > 0) ";
			
			String sql2 = " UPDATE cart "
					+ " SET ct_ckbox = 0 "
					+ " WHERE sg_idx IN (SELECT sg_idx "
					+ "					 FROM s_goods "
					+ "					 WHERE s_idx IN (SELECT s_idx FROM sell "
					+ "									 WHERE sysdate NOT BETWEEN s_start AND s_end+1) OR sg_count <= 0) ";
			
			ps = conn.prepareStatement(sql);
			PreparedStatement ps2 = conn.prepareStatement(sql2);
			
			int count = ps.executeUpdate();
			int count2 = ps2.executeUpdate();
			int result = count + count2;
			
			if(ps2!=null) ps2.close();
			return result;
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
