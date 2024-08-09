package com.wishJam.s_goods;

public class S_goodsDTO {
	private int sg_idx;
	private int s_idx;
	private String sg_name;
	private int sg_price;
	private int sg_count;
	private int sg_limit;
	private int sg_discnt;
	
	public S_goodsDTO() {}

	public int getSg_idx() {
		return sg_idx;
	}

	public void setSg_idx(int sg_idx) {
		this.sg_idx = sg_idx;
	}

	public int getS_idx() {
		return s_idx;
	}

	public void setS_idx(int s_idx) {
		this.s_idx = s_idx;
	}

	public String getSg_name() {
		return sg_name;
	}

	public void setSg_name(String sg_name) {
		this.sg_name = sg_name;
	}

	public int getSg_price() {
		return sg_price;
	}

	public void setSg_price(int sg_price) {
		this.sg_price = sg_price;
	}

	public int getSg_count() {
		return sg_count;
	}

	public void setSg_count(int sg_count) {
		this.sg_count = sg_count;
	}

	public int getSg_limit() {
		return sg_limit;
	}

	public void setSg_limit(int sg_limit) {
		this.sg_limit = sg_limit;
	}

	public int getSg_discnt() {
		return sg_discnt;
	}

	public void setSg_discnt(int sg_discnt) {
		this.sg_discnt = sg_discnt;
	}

	public S_goodsDTO(int sg_idx, int s_idx, String sg_name, int sg_price, int sg_count, int sg_limit, int sg_discnt) {
		super();
		this.sg_idx = sg_idx;
		this.s_idx = s_idx;
		this.sg_name = sg_name;
		this.sg_price = sg_price;
		this.sg_count = sg_count;
		this.sg_limit = sg_limit;
		this.sg_discnt = sg_discnt;
	}

}