package com.pay.wishJam;

public class PayDTO {
	
	// member
	private String m_name;	 // 회원이름
	private String m_tel;	 // 회원번호
	private String m_email;	 // 회원이메일
	private String m_addr;	 // 회원주소
	
	// cart
	private String ct_idx;
	private int sg_idx;
	private int ct_count;
	
	// s_goods
	private int sg_price;	  // 상품가격
	private int sg_discnt;	  // 상품할인여부
	private String sg_name;   // 상품명
	private String sg_img;		// 상품 이미지
	
	// sell
	private double s_discnt;		// 할인율

	public PayDTO() {
		
	}

	public PayDTO(String ct_idx, int sg_idx, String m_name, String m_tel, String m_email, String m_addr, int ct_count, int sg_price,
			int sg_discnt, String sg_name, String sg_img, double s_discnt) {
		super();
		this.ct_idx = ct_idx;
		this.sg_idx = sg_idx;
		this.m_name = m_name;
		this.m_tel = m_tel;
		this.m_email = m_email;
		this.m_addr = m_addr;
		this.ct_count = ct_count;
		this.sg_price = sg_price;
		this.sg_discnt = sg_discnt;
		this.sg_name = sg_name;
		this.sg_img = sg_img;
		this.s_discnt = s_discnt;
	}
	
	public int getSg_idx() {
		return sg_idx;
	}

	public void setSg_idx(int sg_idx) {
		this.sg_idx = sg_idx;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_tel() {
		return m_tel;
	}

	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_addr() {
		return m_addr;
	}

	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}

	public String getCt_idx() {
		return ct_idx;
	}

	public void setCt_idx(String ct_idx) {
		this.ct_idx = ct_idx;
	}

	public int getCt_count() {
		return ct_count;
	}

	public void setCt_count(int ct_count) {
		this.ct_count = ct_count;
	}

	public int getSg_price() {
		return sg_price;
	}

	public void setSg_price(int sg_price) {
		this.sg_price = sg_price;
	}

	public int getSg_discnt() {
		return sg_discnt;
	}

	public void setSg_discnt(int sg_discnt) {
		this.sg_discnt = sg_discnt;
	}

	public String getSg_name() {
		return sg_name;
	}

	public void setSg_name(String sg_name) {
		this.sg_name = sg_name;
	}

	public String getSg_img() {
		return sg_img;
	}

	public void setSg_img(String sg_img) {
		this.sg_img = sg_img;
	}

	public double getS_discnt() {
		return s_discnt;
	}

	public void setS_discnt(double s_discnt) {
		this.s_discnt = s_discnt;
	}
	
}
