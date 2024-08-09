package com.manage.wishJam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class MemberAddQuery {

    // JDBC URL, 사용자 이름, 비밀번호를 설정합니다.
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe"; // 데이터베이스 URL
    private static final String USER = "scott"; // 사용자 이름
    private static final String PASSWORD = "1234"; // 비밀번호

    public static void main(String[] args) {
        Connection conn = null;
        Statement stmt = null;

        try {
            // JDBC 드라이버를 로드합니다.
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // 데이터베이스에 연결합니다.
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            stmt = conn.createStatement();

            // 테이블 생성
//            String createTableSQL = "CREATE TABLE member ("
//                    + "m_idx NUMBER(4) PRIMARY KEY, "
//                    + "m_nick VARCHAR2(50), "
//                    + "g_name VARCHAR2(50), "
//                    + "m_id VARCHAR2(50), "
//                    + "m_pwd VARCHAR2(50), "
//                    + "m_name VARCHAR2(50), "
//                    + "m_tel VARCHAR2(20), "
//                    + "m_addr VARCHAR2(50), "
//                    + "m_email VARCHAR2(50), "
//                    + "m_point NUMBER(6))";
//            stmt.executeUpdate(createTableSQL);
//            System.out.println("Table created successfully!");

            // 더미 데이터 삽입
            String[] insertStatements = {
                "INSERT INTO member (m_idx, m_nick, g_name, m_id, m_pwd, m_name, m_tel, m_addr, m_email, m_point) VALUES (member_idx.nextval, 'songjunhyup', '예시1', 'songjunhyup01', 'password1', '송준협', '010-1234-5678', '서울시 강남구', 'songjunhyup@example.com', 1000)",
                "INSERT INTO member (m_idx, m_nick, g_name, m_id, m_pwd, m_name, m_tel, m_addr, m_email, m_point) VALUES (member_idx.nextval, 'jungdayoung', '예시2', 'jungdayoung02', 'password2', '정다영', '010-2345-6789', '서울시 송파구', 'jungdayoung@example.com', 2000)",
                "INSERT INTO member (m_idx, m_nick, g_name, m_id, m_pwd, m_name, m_tel, m_addr, m_email, m_point) VALUES (member_idx.nextval, 'songhayoung', '예시3', 'songhayoung03', 'password3', '송하영', '010-3456-7890', '서울시 강서구', 'songhayoung@example.com', 1500)",
                "INSERT INTO member (m_idx, m_nick, g_name, m_id, m_pwd, m_name, m_tel, m_addr, m_email, m_point) VALUES (member_idx.nextval, 'parkhyungjoo', '예시1', 'parkhyungjoo04', 'password4', '박형주', '010-4567-8901', '서울시 강북구', 'parkhyungjoo@example.com', 2500)",
                "INSERT INTO member (m_idx, m_nick, g_name, m_id, m_pwd, m_name, m_tel, m_addr, m_email, m_point) VALUES (member_idx.nextval, 'eunjonghyuk', '예시2', 'eunjonghyuk05', 'password5', '은종혁', '010-5678-9012', '서울시 용산구', 'eunjonghyuk@example.com', 1800)",
                "INSERT INTO member (m_idx, m_nick, g_name, m_id, m_pwd, m_name, m_tel, m_addr, m_email, m_point) VALUES (member_idx.nextval, 'javamagician', '예시3', 'javamagician06', 'password6', '자바의연금술사', '010-6789-0123', '서울시 마포구', 'javamagician@example.com', 3000)",
                "INSERT INTO member (m_idx, m_nick, g_name, m_id, m_pwd, m_name, m_tel, m_addr, m_email, m_point) VALUES (member_idx.nextval, 'jennie', '예시1', 'jennie07', 'password7', '제니', '010-7890-1234', '서울시 중구', 'jennie@example.com', 2200)",
                "INSERT INTO member (m_idx, m_nick, g_name, m_id, m_pwd, m_name, m_tel, m_addr, m_email, m_point) VALUES (member_idx.nextval, 'yuri_yunna', '예시2', 'yuri_yunna08', 'password8', '유리윤나', '010-8901-2345', '서울시 동대문구', 'yuri_yunna@example.com', 1600)",
                "INSERT INTO member (m_idx, m_nick, g_name, m_id, m_pwd, m_name, m_tel, m_addr, m_email, m_point) VALUES (member_idx.nextval, 'kimminju', '예시3', 'kimminju09', 'password9', '김민주', '010-9012-3456', '서울시 노원구', 'kimminju@example.com', 1300)",
                "INSERT INTO member (m_idx, m_nick, g_name, m_id, m_pwd, m_name, m_tel, m_addr, m_email, m_point) VALUES (member_idx.nextval, 'goyuri', '예시1', 'goyuri10', 'password10', '고유리', '010-0123-4567', '서울시 서초구', 'goyuri@example.com', 1700)",
                "INSERT INTO member (m_idx, m_nick, g_name, m_id, m_pwd, m_name, m_tel, m_addr, m_email, m_point) VALUES (member_idx.nextval, 'leejihyeon', '예시2', 'leejihyeon11', 'password11', '이지현', '010-1234-5678', '서울시 강동구', 'leejihyeon@example.com', 1400)",
                "INSERT INTO member (m_idx, m_nick, g_name, m_id, m_pwd, m_name, m_tel, m_addr, m_email, m_point) VALUES (member_idx.nextval, 'joo_bao', '예시3', 'joo_bao12', 'password12', '주바오', '010-2345-6789', '서울시 금천구', 'joo_bao@example.com', 2100)",
                "INSERT INTO member (m_idx, m_nick, g_name, m_id, m_pwd, m_name, m_tel, m_addr, m_email, m_point) VALUES (member_idx.nextval, 'limsuah', '예시1', 'limsuah13', 'password13', '임수아', '010-3456-7890', '서울시 동작구', 'limsuah@example.com', 1900)",
                "INSERT INTO member (m_idx, m_nick, g_name, m_id, m_pwd, m_name, m_tel, m_addr, m_email, m_point) VALUES (member_idx.nextval, 'jinyeerim', '예시2', 'jinyeerim14', 'password14', '진예림', '010-4567-8901', '서울시 중랑구', 'jinyeerim@example.com', 1700)"
            };

            for (String sql : insertStatements) {
                stmt.executeUpdate(sql);
            }
            System.out.println("Dummy data inserted successfully!");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 리소스를 정리합니다.
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
