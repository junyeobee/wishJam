package com.wishJam.review;

import java.sql.*;

public class ReviewDTO {
	private int r_idx;
	private int m_idx;
	private String m_nick;
	private String g_name;
	private String r_img;
	private int r_star;
	private String r_content;
	private Date r_date;
	private String m_img;
	
	public ReviewDTO(int r_idx, int m_idx, String m_nick, String g_name, String r_img, int r_star, String r_content,
			Date r_date, String m_img) {
		super();
		this.r_idx = r_idx;
		this.m_idx = m_idx;
		this.m_nick = m_nick;
		this.g_name = g_name;
		this.r_img = r_img;
		this.r_star = r_star;
		this.r_content = r_content;
		this.r_date = r_date;
		this.m_img = m_img;
	}

	public int getR_idx() {
		return r_idx;
	}
	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
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
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public String getR_img() {
		return r_img;
	}
	public void setR_img(String r_img) {
		this.r_img = r_img;
	}
	public int getR_star() {
		return r_star;
	}
	public void setR_star(int r_star) {
		this.r_star = r_star;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}

	public String getM_img() {
		return m_img;
	}

	public void setM_img(String m_img) {
		this.m_img = m_img;
	}
	
}
