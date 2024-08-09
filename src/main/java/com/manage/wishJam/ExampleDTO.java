package com.manage.wishJam;

public class ExampleDTO {
	private int g_idx;
	private String g_name;
	private int g_point;
	
	public ExampleDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public ExampleDTO(int g_idx, String g_name, int g_point) {
		this.g_idx = g_idx;
		this.g_name = g_name;
		this.g_point = g_point;
	}

	public ExampleDTO(String g_name, int g_point) {
		this.g_name = g_name;
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

	public int getG_point() {
		return g_point;
	}

	public void setG_point(int g_point) {
		this.g_point = g_point;
	}
	
}
