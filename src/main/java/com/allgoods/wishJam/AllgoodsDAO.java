package com.allgoods.wishJam;

import java.sql.*;
import java.util.*;

public class AllgoodsDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public AllgoodsDAO() {

	}

	public List<AllgoodsDTO> allGoods() {

		List<AllgoodsDTO> products = new ArrayList<>();

		try {
			
			con = com.db.wishJam.DbConn.getConn();
			String sql = "select * from test_goods_b";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				int idx = rs.getInt("tg_idx");
				String name = rs.getString("tg_name");
				int price = rs.getInt("tg_price");
				String seller = rs.getString("tg_seller");
				String thumbnail_url = rs.getString("thumbnail_url");
				products.add(new AllgoodsDTO(idx, name, price, seller, thumbnail_url));
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