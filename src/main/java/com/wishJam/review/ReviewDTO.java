package com.wishJam.review;

import java.sql.*;

public class ReviewDTO {
	private int r_idx;
	private int s_idx;
	private int m_idx;
	private String r_img;
	private int r_star;
	private String r_content;
	private Date r_date;
	private String m_img;
	private String m_nick;
	
	public ReviewDTO() {}
	
	public ReviewDTO(int r_idx, int s_idx, int m_idx, String r_img, int r_star, String r_content, Date r_date) {
		super();
		this.r_idx = r_idx;
		this.s_idx = s_idx;
		this.m_idx = m_idx;
		this.r_img = r_img;
		this.r_star = r_star;
		this.r_content = r_content;
		this.r_date = r_date;
	}

	public ReviewDTO(int r_idx, int m_idx, String r_img, int r_star, String r_content, Date r_date, String m_img,
			String m_nick) {
		super();
		this.r_idx = r_idx;
		this.m_idx = m_idx;
		this.r_img = r_img;
		this.r_star = r_star;
		this.r_content = r_content;
		this.r_date = r_date;
		this.m_img = m_img;
		this.m_nick = m_nick;
	}

	public String getM_nick() {
		return m_nick;
	}

	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}

	public int getR_idx() {
		return r_idx;
	}

	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}

	public int getS_idx() {
		return s_idx;
	}

	public void setS_idx(int s_idx) {
		this.s_idx = s_idx;
	}

	public int getM_idx() {
		return m_idx;
	}

	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
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
