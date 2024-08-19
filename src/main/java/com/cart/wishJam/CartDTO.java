package com.cart.wishJam;

import java.util.Date;

public class CartDTO {

	// cart
	private int ct_idx;   
	private int m_idx;
	private int sg_idx;
	private int ct_count;
	private int ct_price;
	private int ct_dispr;
	private int ct_sale;
	
	// member
	private String m_id;	 // 회원아이디
	
	// s_goods
	private String sg_name;   // 상품명
	private int sg_price;	  // 상품가격
	private int sg_count;	  // 상품수량
	private int sg_limit;     // 상품 1인제한수량
	private String sg_img;		  // 상품 이미지
	
	// sell
	private int s_idx;			// 게시물 번호
	private String s_title;		// 게시물 제목
	private Date s_start;		// 판매시작일자
	private Date s_end;			// 판매종료일자
	private int s_discnt;		// 할인율
	
	
	public CartDTO() {
		
	}
	
	public CartDTO(int ct_idx, String m_id, String s_title, String sg_name, String sg_img, int ct_count,
			int ct_price, int ct_dispr, int ct_sale, int sg_count, int sg_limit, Date s_start, Date s_end) {
		super();
		this.ct_idx = ct_idx;
		this.ct_count = ct_count;
		this.ct_price = ct_price;
		this.ct_dispr = ct_dispr;
		this.ct_sale = ct_sale;
		this.m_id = m_id;
		this.sg_name = sg_name;
		this.sg_img = sg_img;
		this.s_title = s_title;
		this.sg_count = sg_count;
		this.sg_limit = sg_limit;
		this.s_start = s_start;
		this.s_end = s_end;
	}

	public CartDTO(int ct_idx, int m_idx, int sg_idx, int ct_count, int ct_price, int ct_dispr, int ct_sale,
			String m_id, String sg_name, int sg_price, int sg_count, int sg_limit, String sg_img, int s_idx,
			String s_title, Date s_start, Date s_end, int s_discnt) {
		super();
		this.ct_idx = ct_idx;
		this.m_idx = m_idx;
		this.sg_idx = sg_idx;
		this.ct_count = ct_count;
		this.ct_price = ct_price;
		this.ct_dispr = ct_dispr;
		this.ct_sale = ct_sale;
		this.m_id = m_id;
		this.sg_name = sg_name;
		this.sg_price = sg_price;
		this.sg_count = sg_count;
		this.sg_limit = sg_limit;
		this.sg_img = sg_img;
		this.s_idx = s_idx;
		this.s_title = s_title;
		this.s_start = s_start;
		this.s_end = s_end;
		this.s_discnt = s_discnt;
	}

	public int getCt_idx() {
		return ct_idx;
	}

	public void setCt_idx(int ct_idx) {
		this.ct_idx = ct_idx;
	}

	public int getM_idx() {
		return m_idx;
	}

	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}

	public int getSg_idx() {
		return sg_idx;
	}

	public void setSg_idx(int sg_idx) {
		this.sg_idx = sg_idx;
	}

	public int getCt_count() {
		return ct_count;
	}

	public void setCt_count(int ct_count) {
		this.ct_count = ct_count;
	}

	public int getCt_price() {
		return ct_price;
	}

	public void setCt_price(int ct_price) {
		this.ct_price = ct_price;
	}

	public int getCt_dispr() {
		return ct_dispr;
	}

	public void setCt_dispr(int ct_dispr) {
		this.ct_dispr = ct_dispr;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
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

	public String getSg_img() {
		return sg_img;
	}

	public void setSg_img(String sg_img) {
		this.sg_img = sg_img;
	}

	public int getS_idx() {
		return s_idx;
	}

	public void setS_idx(int s_idx) {
		this.s_idx = s_idx;
	}

	public String getS_title() {
		return s_title;
	}

	public void setS_title(String s_title) {
		this.s_title = s_title;
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

	public int getCt_sale() {
		return ct_sale;
	}

	public void setCt_sale(int ct_sale) {
		this.ct_sale = ct_sale;
	}
	
}
