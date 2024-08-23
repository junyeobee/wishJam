package com.wishJam.s_goods;

import java.sql.*;
import java.util.*;

import com.wishJam.detail.DetailDTO;

public class S_goodsDAO {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;

	public int addGoods(int s_idx, String sg_name, int sg_price, int sg_count, int sg_limit, int sg_discnt, String sg_img, int sg_main) {
		try {
				conn=com.db.wishJam.DbConn.getConn();
				String sql = "insert into s_goods values(sg_seq.nextval,?,?,?,?,?,?,?,?)";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, s_idx);
				ps.setString(2, sg_name);
				ps.setInt(3, sg_price);
				ps.setInt(4, sg_count);
				ps.setInt(5, sg_limit);
				ps.setInt(6, sg_discnt);
				ps.setString(7, sg_img);
				ps.setInt(8, sg_main);
				
				int count = ps.executeUpdate();
				
				return count;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			try {
					if(ps!=null) ps.close();
					if(conn!=null) conn.close();
			} catch (Exception e2) {
			}
		}
	}

	public ArrayList<S_goodsDTO> viewGoods(int gnum) {
		try {
			ArrayList<S_goodsDTO> sglist = new ArrayList<S_goodsDTO>();

			conn = com.db.wishJam.DbConn.getConn();
			String sql = "select * from s_goods where s_idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, gnum);
			rs = ps.executeQuery();

			while (rs.next()) {
				int s_idx = rs.getInt("s_idx");
				int sg_idx = rs.getInt("sg_idx");
				String sg_name = rs.getString("sg_name");
				int sg_price = rs.getInt("sg_price");
				int sg_count = rs.getInt("sg_count");
				int sg_limit = rs.getInt("sg_limit");
				int sg_discnt = rs.getInt("sg_discnt");
				String sg_img = rs.getString("sg_img");
				int sg_main=rs.getInt("sg_main");
				
				S_goodsDTO dto = new S_goodsDTO(sg_idx, s_idx, sg_name, sg_price, sg_count, sg_limit, sg_discnt, sg_img, sg_main);
				sglist.add(dto);
			}
			return sglist;
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
