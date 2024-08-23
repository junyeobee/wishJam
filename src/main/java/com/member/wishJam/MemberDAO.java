package com.member.wishJam;

import java.sql.Connection;
import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cart.wishJam.CartDTO;

public class MemberDAO {
   
   private Connection conn;
   private PreparedStatement ps;
   private ResultSet rs;
   
   public static final int NOT_ID = 1;
   public static final int NOT_PWD = 2;
   public static final int LOGIN_OK = 3;
   public static final int MANAGE = 4;
   public static final int ERROR = -1;
   
   /** 회원가입 메서드 */
   public int memberJoin(MemberDTO dto) {
      try {
         conn = com.db.wishJam.DbConn.getConn();
         
         String sql = " INSERT INTO member "
               + " VALUES(seq_memno.nextval, '위시잼'||seq_nickno.nextval, 2, ?, ?, ?, ?, ?, ?, ?, ?, 0, sysdate) ";
         
         String sql2 = " INSERT INTO member "
               + " VALUES(seq_memno.nextval, ?, 2, ?, ?, ?, ?, ?, ?, ?, ?, 0, sysdate) ";
         
         String sql3 = " INSERT INTO mypage "
         		+ " VALUES(seq_memno.currval, '/wishJam/img/member_profile/default.png', '') ";
         
         if(dto.getM_nick() == null) {
            ps = conn.prepareStatement(sql);
            ps.setString(1, dto.getM_id());
            ps.setString(2, dto.getM_pwd());
            ps.setString(3, dto.getM_name());
            ps.setString(4, dto.getM_gender());
            ps.setString(5, dto.getM_tel());
            ps.setString(6, dto.getM_brd());
            ps.setString(7, dto.getM_addr());
            ps.setString(8, dto.getM_email());
         } else {
            ps = conn.prepareStatement(sql2);
            ps.setString(1, dto.getM_nick());
            ps.setString(2, dto.getM_id());
            ps.setString(3, dto.getM_pwd());
            ps.setString(4, dto.getM_name());
            ps.setString(5, dto.getM_gender());
            ps.setString(6, dto.getM_tel());
            ps.setString(7, dto.getM_brd());
            ps.setString(8, dto.getM_addr());
            ps.setString(9, dto.getM_email());
         }
         
         PreparedStatement ps2 = conn.prepareStatement(sql3);
         
         int count = ps.executeUpdate();
         count = ps2.executeUpdate();
         
         if(ps2!=null) ps2.close();
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
   
   /** 아이디 중복검사 */
   public boolean idCheck(String m_id) {
      try {
         conn = com.db.wishJam.DbConn.getConn();
         
         String sql = " SELECT m_id "
               + " FROM member "
               + " WHERE m_id = ? ";
         ps = conn.prepareStatement(sql);
         ps.setString(1, m_id);
         rs = ps.executeQuery();
         return rs.next();
      } catch (Exception e) {
         e.printStackTrace();
         return false;
      } finally {
         try {
            if(rs!=null) rs.close();
            if(ps!=null) ps.close();
            if(conn!=null) conn.close();
         } catch (Exception e2) {
            
         }
      }
   }
   
   /** 닉네임 중복검사 */
   public boolean nickCheck(String m_nick) {
      try {
         conn = com.db.wishJam.DbConn.getConn();
         
         String sql = " SELECT m_nick "
               + " FROM member "
               + " WHERE m_nick = ? ";
         ps = conn.prepareStatement(sql);
         ps.setString(1, m_nick);
         rs = ps.executeQuery();
         return rs.next();
      } catch (Exception e) {
         e.printStackTrace();
         return false;
      } finally {
         try {
            if(rs!=null) rs.close();
            if(ps!=null) ps.close();
            if(conn!=null) conn.close();
         } catch (Exception e2) {
            
         }
      }
   }
   
   /** 이메일 중복검사 */
   public boolean emailCheck(String m_email) {
      try {
         conn = com.db.wishJam.DbConn.getConn();
         
         String sql = " SELECT m_email "
               + " FROM member "
               + " WHERE m_email = ? ";
         ps = conn.prepareStatement(sql);
         ps.setString(1, m_email);
         rs = ps.executeQuery();
         return rs.next();
      } catch (Exception e) {
         e.printStackTrace();
         return false;
      } finally {
         try {
            if(rs!=null) rs.close();
            if(ps!=null) ps.close();
            if(conn!=null) conn.close();
         } catch (Exception e2) {
            
         }
      }
   }
   
   /** 로그인 검증 */
   public int loginCheck(String user_id, String user_pwd) {
      try {
         conn = com.db.wishJam.DbConn.getConn();
         
         String sql = " SELECT m_pwd, g_idx "
               + " FROM member "
               + " WHERE m_id = ? ";
         ps = conn.prepareStatement(sql);
         ps.setString(1, user_id);
         rs = ps.executeQuery();
         if(rs.next()) {
            String dbpwd = rs.getString(1);
            int gidx = rs.getInt(2);
            
            if(dbpwd.equals(user_pwd) && gidx == 1) {
               return MANAGE;
            } else if (dbpwd.equals(user_pwd)){
               return LOGIN_OK;
            } else {
               return NOT_PWD;
            }
         } else {
            return NOT_ID;
         }
      } catch (Exception e) {
         e.printStackTrace();
         return ERROR;
      } finally {
         try {
            if(rs!=null) rs.close();
            if(ps!=null) ps.close();
            if(conn!=null) conn.close();
         } catch (Exception e2) {
            
         }
      }
   }
   
   /**사용자 정보 추출관련 메서드*/
   public Map<String, Object> getUserInfo(String user_id) {
       Map<String, Object> userInfoMap = new HashMap<>();
      
       try {
          conn = com.db.wishJam.DbConn.getConn();
          
          String sql = " SELECT m_idx, m_nick "
                + " FROM member "
                + " WHERE m_id = ? ";
          ps = conn.prepareStatement(sql);
          ps.setString(1,user_id);
          rs = ps.executeQuery();
          
          if (rs.next()) {
               int m_idx = rs.getInt(1);
               String m_nick = rs.getString(2);
               
               userInfoMap.put("m_idx", m_idx);
               userInfoMap.put("m_nick", m_nick);
           }
           return userInfoMap;
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

   /** 아이디 찾기 */
    public String idFind(String m_name, String m_tel) {
       try {
          conn = com.db.wishJam.DbConn.getConn();
          
          String sql = " SELECT m_id "
                + " FROM member "
                + " WHERE m_name = ? AND m_tel = ? ";
          ps = conn.prepareStatement(sql);
          ps.setString(1, m_name);
          ps.setString(2, m_tel);
          rs = ps.executeQuery();
          if(rs.next()) {
             String dbm_id = rs.getString(1);
             return dbm_id;
          } else {
             return null;
          }
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
   
    /** 비밀번호 찾기 */
    public String pwdFind(String m_id, String m_tel) {
        try {
           conn = com.db.wishJam.DbConn.getConn();
           
           String sql = " SELECT m_pwd "
                 + " FROM member "
                 + " WHERE m_id = ? AND m_tel = ? ";
           ps = conn.prepareStatement(sql);
           ps.setString(1, m_id);
           ps.setString(2, m_tel);
           rs = ps.executeQuery();
           if(rs.next()) {
              String dbm_pwd = rs.getString(1);
              return dbm_pwd;
           } else {
              return null;
           }
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
