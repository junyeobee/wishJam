package com.manage.wishJam;

public class GradeDTO {
	private int g_idx;
	private String g_name;
	private String g_src;
	private int g_point;
	
	public GradeDTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	public GradeDTO(int g_idx, String g_name, String g_src, int g_point) {
		super();
		this.g_idx = g_idx;
		this.g_name = g_name;
		this.g_src = g_src;
		this.g_point = g_point;
	}


	public int getG_idx() {
		return g_idx;
	}
	public void setG_idx(int g_idx) {
		this.g_idx = g_idx;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public String getG_src() {
		return g_src;
	}
	public void setG_src(String g_src) {
		this.g_src = g_src;
	}
	public int getG_point() {
		return g_point;
	}
	public void setG_point(int g_point) {
		this.g_point = g_point;
	}
	
}
