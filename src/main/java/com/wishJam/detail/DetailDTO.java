package com.wishJam.detail;

import java.sql.Date;

public class DetailDTO {
	
	private int s_idx;
	private String m_nick;
	private int c_idx;
	private String g_name;
	private String s_title;
	private String s_content;
	private String s_hash;
	private int s_view;
	private int s_jjim;
	private Date s_start;
	private Date s_end;
	private int s_discnt;
	private int s_type;
	private String s_trade;
	
	public DetailDTO() {}

	public DetailDTO(int s_idx, String m_nick, int c_idx, String g_name, String s_title, String s_content,
			String s_hash, int s_view, int s_jjim, Date s_start, Date s_end, int s_discnt, int s_type, String s_trade) {
		super();
		this.s_idx = s_idx;
		this.m_nick = m_nick;
		this.c_idx = c_idx;
		this.g_name = g_name;
		this.s_title = s_title;
		this.s_content = s_content;
		this.s_hash = s_hash;
		this.s_view = s_view;
		this.s_jjim = s_jjim;
		this.s_start = s_start;
		this.s_end = s_end;
		this.s_discnt = s_discnt;
		this.s_type = s_type;
		this.s_trade = s_trade;
	}

	public String getS_trade() {
		return s_trade;
	}

	public void setS_trade(String s_trade) {
		this.s_trade = s_trade;
	}

	public int getS_idx() {
		return s_idx;
	}

	public void setS_idx(int s_idx) {
		this.s_idx = s_idx;
	}

	public String getM_nick() {
		return m_nick;
	}

	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}

	public int getC_idx() {
		return c_idx;
	}

	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}

	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
	}

	public String getS_title() {
		return s_title;
	}

	public void setS_title(String s_title) {
		this.s_title = s_title;
	}

	public String getS_content() {
		return s_content;
	}

	public void setS_content(String s_content) {
		this.s_content = s_content;
	}

	public String getS_hash() {
		return s_hash;
	}

	public void setS_hash(String s_hash) {
		this.s_hash = s_hash;
	}

	public int getS_view() {
		return s_view;
	}

	public void setS_view(int s_view) {
		this.s_view = s_view;
	}

	public int getS_jjim() {
		return s_jjim;
	}

	public void setS_jjim(int s_jjim) {
		this.s_jjim = s_jjim;
	}

	public Date getS_start() {
		return s_start;
	}

	public void setS_start(Date s_start) {
		this.s_start = s_start;
	}

	public Date getS_end() {
		return s_end;
	}

	public void setS_end(Date s_end) {
		this.s_end = s_end;
	}

	public int getS_discnt() {
		return s_discnt;
	}

	public void setS_discnt(int s_discnt) {
		this.s_discnt = s_discnt;
	}

	public int getS_type() {
		return s_type;
	}

	public void setS_type(int s_type) {
		this.s_type = s_type;
	}

	
}
