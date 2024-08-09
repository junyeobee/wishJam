package com.wishJam.s_goods;

import java.sql.*;
import java.util.*;

public class S_goodsDAO {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;

	public int addGoods(S_goodsDTO dto) {
		try {
				conn=com.db.wishJam.DbConn.getConn();
				String sql = "insert into s_goods values(s_goods_sg_idx.nextval,?,?,?,?,?,?)";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, dto.getS_idx());
				ps.setString(2, dto.getSg_name());
				ps.setInt(3, dto.getSg_price());
				ps.setInt(4, dto.getSg_count());
				ps.setInt(5, dto.getSg_limit());
				ps.setInt(6, dto.getSg_discnt());
				
				int count = ps.executeUpdate();
				
				return count;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			try {
					if(ps!=null)ps.close();
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
				
				S_goodsDTO dto = new S_goodsDTO(sg_idx, s_idx, sg_name, sg_price, sg_count, sg_limit, sg_discnt);
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
