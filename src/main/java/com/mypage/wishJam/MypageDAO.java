package com.mypage.wishJam;
import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class MypageDAO {
   Connection con;
   PreparedStatement ps;
   ResultSet rs;
   
   //회원정보 수정
//   public int memberEdit(MypageDTO dto) {
//      
//      try {
//         con = com.db.wishJam.DbConn.getConn();
//         
//      } catch (Exception e) {
//         // TODO: handle exception
//      }
//      
//   }
//   

   
   public List<MypageDTO> buyList(){
      
   List<MypageDTO> bl = new ArrayList();
   
   try {
      con = com.db.wishJam.DbConn.getConn();
      
      String sql = "select * from test_goods";
      ps=con.prepareStatement(sql);
      rs=ps.executeQuery();
      
      while(rs.next()) {
         int idx = rs.getInt("tg_idx");
         String name= rs.getString("tg_name");
         int price = rs.getInt("tg_price");
         String seller = rs.getString("tg_seller");
         String thumbnail_url=rs.getString("thumbnail_url");
         
         bl.add(new MypageDTO(idx, name, price, seller, thumbnail_url));
         
      }
      
   } catch (Exception e) {
      e.printStackTrace();
   }
   return bl;
      
   }
}
