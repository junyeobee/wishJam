package com.allgoods.wishJam;

import java.sql.*;
import java.util.*;

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
			sql = "select sell.m_nick,sell.s_title,sell.s_jjim,s_goods.sg_main,sell.s_img from sell join s_goods on sell.s_idx = s_goods.s_idx order by s_jjim desc";
			}else {
				sql = "select sell.m_nick,sell.s_title,sell.s_jjim,s_goods.sg_main,sell.s_img,sell.s_start from sell join s_goods on sell.s_idx = s_goods.s_idx order by sell.s_start desc";
			}
				
		    ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				String seller= rs.getString("m_nick");
				String name = rs.getString("s_title");
				int jjim = rs.getInt("s_jjim");
				int price = rs.getInt("sg_main");
				String thumbnail_url = rs.getString("s_img");
				products.add(new AllgoodsDTO(jjim, name, price, seller, thumbnail_url));
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

}