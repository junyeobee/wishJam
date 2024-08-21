package com.member.wishJam;

import java.sql.*;

public class MemberDTO {

   private int m_idx;
   private String m_nick;
   private int g_idx;
   private String m_id;
   private String m_pwd;
   private String m_name;
   private String m_gender;
   private String m_tel;
   private String m_brd;
   private String m_addr;
   private String m_email;
   private int m_point;
   
   public MemberDTO() {
      
   }
   
   public MemberDTO(int m_idx, String m_nick, int g_idx, String m_id, String m_pwd, String m_name, String m_gender,
         String m_tel, String m_brd, String m_addr, String m_email, int m_point) {
      super();
      this.m_idx = m_idx;
      this.m_nick = m_nick;
      this.g_idx = g_idx;
      this.m_id = m_id;
      this.m_pwd = m_pwd;
      this.m_name = m_name;
      this.m_gender = m_gender;
      this.m_tel = m_tel;
      this.m_brd = m_brd;
      this.m_addr = m_addr;
      this.m_email = m_email;
      this.m_point = m_point;
   }

   public int getM_idx() {
      return m_idx;
   }

   public void setM_idx(int m_idx) {
      this.m_idx = m_idx;
   }

   public String getM_nick() {
      return m_nick;
   }

   public void setM_nick(String m_nick) {
      this.m_nick = m_nick;
   }

   public int getG_idx() {
      return g_idx;
   }

   public void setG_idx(int g_idx) {
      this.g_idx = g_idx;
   }

   public String getM_id() {
      return m_id;
   }

   public void setM_id(String m_id) {
      this.m_id = m_id;
   }

   public String getM_pwd() {
      return m_pwd;
   }

   public void setM_pwd(String m_pwd) {
      this.m_pwd = m_pwd;
   }

   public String getM_name() {
      return m_name;
   }

   public void setM_name(String m_name) {
      this.m_name = m_name;
   }

   public String getM_gender() {
      return m_gender;
   }

   public void setM_gender(String m_gender) {
      this.m_gender = m_gender;
   }

   public String getM_tel() {
      return m_tel;
   }

   public void setM_tel(String m_tel) {
      this.m_tel = m_tel;
   }

   public String getM_brd() {
      return m_brd;
   }

   public void setM_brd(String m_brd) {
      this.m_brd = m_brd;
   }

   public String getM_addr() {
      return m_addr;
   }

   public void setM_addr(String m_addr) {
      this.m_addr = m_addr;
   }

   public String getM_email() {
      return m_email;
   }

   public void setM_email(String m_email) {
      this.m_email = m_email;
   }

   public int getM_point() {
      return m_point;
   }

   public void setM_point(int m_point) {
      this.m_point = m_point;
   }
   
}