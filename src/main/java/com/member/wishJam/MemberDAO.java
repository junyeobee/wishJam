package com.member.wishJam;

import java.sql.Connection;
import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public static final int NOT_ID = 1;
	public static final int NOT_PWD = 2;
	public static final int LOGIN_OK = 3;
	public static final int ERROR = -1;
	
	/** 회원가입 메서드 */
	public int memberJoin(MemberDTO dto) {
		try {
			conn = com.db.wishJam.DbConn.getConn();
			
			String sql = " INSERT INTO member "
					+ " VALUES(seq_memno.nextval, ?, '아이언', ?, ?, ?, ?, ?, 0, ?, ?, ?) ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getM_nick());
			ps.setString(2, dto.getM_id());
			ps.setString(3, dto.getM_pwd());
			ps.setString(4, dto.getM_name());
			ps.setString(5, dto.getM_addr());
			ps.setString(6, dto.getM_email());
			ps.setString(7, dto.getM_tel());
			ps.setString(8, dto.getM_gender());
			ps.setString(9, dto.getM_brd());
			
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
			
			String sql = " SELECT m_pwd "
					+ " FROM member "
					+ " WHERE m_id = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, user_id);
			rs = ps.executeQuery();
			if(rs.next()) {
				String dbpwd = rs.getString(1);
				if(dbpwd.equals(user_pwd)) {
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
	
	
	
	
}
