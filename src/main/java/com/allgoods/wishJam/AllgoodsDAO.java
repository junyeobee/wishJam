package com.allgoods.wishJam;

import java.sql.*;
import java.util.*;
import com.allgoods.wishJam.AllgoodsDTO;
import com.manage.wishJam.M_ReportDTO;

public class AllgoodsDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public AllgoodsDAO() {

	}

	public List<AllgoodsDTO> allGoods(String sortOrder) {

		List<AllgoodsDTO> products = new ArrayList<>();
		String sql;
		
		try {
			con = com.db.wishJam.DbConn.getConn();
			
			if("latest".equals(sortOrder)) {
			sql = "select sell.*, s_goods.* from sell join s_goods on sell.s_idx = s_goods.s_idx order by s_jjim desc";
			}else {
				sql = "select sell.*, s_goods.* from sell join s_goods on sell.s_idx = s_goods.s_idx order by sell.s_start desc";
			}
				
		    ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				String m_nick= rs.getString("m_nick");
				String s_title = rs.getString("s_title");
				int s_idx=rs.getInt("s_idx");
				int s_jjim = rs.getInt("s_jjim");
				int s_discnt= rs.getInt("s_discnt");
				int sg_main = rs.getInt("sg_main");
				String s_img = rs.getString("s_img");
				products.add(new AllgoodsDTO(m_nick,s_title,s_idx,s_jjim ,s_discnt, sg_main, s_img));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con!=null)con.close();
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
			} catch (Exception e) {
				e.printStackTrace();
				 
			}
			
		}
		return products;
		
	}
	
	
	
	
	
	
	//페이징 처리
	
	public ArrayList<AllgoodsDTO> allGoods(int cp, int ls) {
		try {
			con = com.db.wishJam.DbConn.getConn();
			int start = (cp - 1) * ls + 1;
			int end = cp * ls;
			String sql = "select * from "
					+ "(select rownum as rnm,a.* from  "
					+ "(select * from report order by rp_idx asc) a)b "
					+ "where rnm >=? and rnm <= ?";
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			ArrayList<AllgoodsDTO> arr = new ArrayList<AllgoodsDTO>();
			if(rs.next()) {
				do {
					AllgoodsDTO dto = new AllgoodsDTO(rs.getInt(2),rs.getInt(3),rs.getInt(4),rs.getString(5),rs.getInt(6),rs.getInt(7),rs.getInt(8));
					arr.add(dto);
				}while(rs.next());
			}
			return arr;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
    			if (ps != null) 
                	ps.close();
                if (con != null) 
                	con.close();
    		}catch(Exception e) {
    			e.printStackTrace();
    		}
		}
	}
	
	
	public int getTotalcnt() {
		try {
			con = com.db.wishJam.DbConn.getConn();
			String sql = "select count(*) from sell";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			int cnt = rs.getInt(1);			
			return cnt==0?1:cnt;
		}catch(Exception e) {
			e.printStackTrace();
			return 1;
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