package com.allgoods.wishJam;

import java.sql.*;
import java.util.*;

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
				String seller= rs.getString("m_nick");
				String name = rs.getString("s_title");
				int idx=rs.getInt("s_idx");
				int jjim = rs.getInt("s_jjim");
				int discount= rs.getInt("s_discnt");
				int price = rs.getInt("sg_main");
				String thumbnail_url = rs.getString("s_img");
				products.add(new AllgoodsDTO(idx,jjim, name, price, seller, thumbnail_url,discount));
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
	
	
	public int JjimPlus(String id) {
		
	
		
		try {
			
			con=com.db.wishJam.DbConn.getConn();
			
			
			String sql="update sell set s_jjim  = s_jjim+1 ";
			
			ps=con.prepareStatement(sql);
			
			
			int count = ps.executeUpdate();
			
			return count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			
			
		}
		
	
		
	}
	
	//페이징 처리
	
	public ArrayList<M_ReportDTO> allReports(int cp, int ls) {
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
			ArrayList<M_ReportDTO> arr = new ArrayList<M_ReportDTO>();
			if(rs.next()) {
				do {
					M_ReportDTO dto = new M_ReportDTO(rs.getInt(2),rs.getInt(3),rs.getInt(4),rs.getString(5),rs.getInt(6),rs.getInt(7),rs.getInt(8));
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