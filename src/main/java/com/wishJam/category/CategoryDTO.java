package com.wishJam.category;

public class CategoryDTO {

	private int c_idx;
	private int c_big;
	private int c_small;
	private String c_name;
	private String c_hash;
	private String c_img;
	
	public CategoryDTO(int c_idx, int c_big, int c_small, String c_name, String c_hash, String c_img) {
		super();
		this.c_idx = c_idx;
		this.c_big = c_big;
		this.c_small = c_small;
		this.c_name = c_name;
		this.c_hash = c_hash;
		this.c_img = c_img;
	}
	
	public CategoryDTO(int c_idx, int c_big, int c_small, String c_name, String c_hash) {
		super();
		this.c_idx = c_idx;
		this.c_big = c_big;
		this.c_small = c_small;
		this.c_name = c_name;
		this.c_hash = c_hash;
	}

	public String getC_img() {
		return c_img;
	}

	public void setC_img(String c_img) {
		this.c_img = c_img;
	}

	public CategoryDTO(int c_big, String c_name) {
		this.c_big = c_big;
		this.c_name = c_name;
	}

	public int getC_idx() {
		return c_idx;
	}

	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}

	public int getC_big() {
		return c_big;
	}

	public void setC_big(int c_big) {
		this.c_big = c_big;
	}

	public int getC_small() {
		return c_small;
	}

	public void setC_small(int c_small) {
		this.c_small = c_small;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_hash() {
		return c_hash;
	}

	public void setC_hash(String c_hash) {
		this.c_hash = c_hash;
	}
	
}
