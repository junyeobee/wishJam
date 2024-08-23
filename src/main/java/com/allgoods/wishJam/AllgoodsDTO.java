package com.allgoods.wishJam;

/*
 * CREATE TABLE sell (
    s_idx number PRIMARY KEY,
    m_nick varchar2(50),
    c_idx number,
    g_name varchar2(100),
    s_title varchar2(100),
    s_content varchar2(500),
    s_view number default 0,
    s_jjim number default 0,
    s_start date,
    s_end date,
    s_discnt number default 0,
    s_type number default 1,
    s_tradeT varchar2(50),
    s_img varchar2(200)
);

CREATE TABLE s_goods (
    sg_idx number(10) PRIMARY KEY,
    s_idx number(10),
    sg_name varchar2(100),
    sg_price number(10, 0), 
    sg_count number(5),
    sg_limit number(5),
    sg_img varchar2(200),
    sg_discnt number(5, 0), 
    sg_main number(10,0)
);

CREATE TABLE jjim (
    m_idx number,
    s_idx number,
    g_name varchar2(50)
);
 */

public class AllgoodsDTO {
	private int s_idx;
	private String s_title;
	private int sg_main; // 상품가격
	private String m_nick;
	private String s_img;
	private int s_jjim;
	private int s_discnt;
	private String userid;
	private int sg_price;
	private int sg_discnt;
	
	

	public int getSg_discnt() {
		return sg_discnt;
	}
	public void setSg_discnt(int sg_discnt) {
		this.sg_discnt = sg_discnt;
	}
	public int getSg_price() {
		return sg_price;
	}
	public void setSg_price(int sg_price) {
		this.sg_price = sg_price;
	}

	private int m_idx;
	public AllgoodsDTO() {

	}
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getM_idx() {
		return m_idx;
	}

	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
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

	public int getSg_main() {
		return sg_main;
	}

	public void setSg_main(int sg_main) {
		this.sg_main = sg_main;
	}

	public String getS_img() {
		return s_img;
	}

	public void setS_img(String s_img) {
		this.s_img = s_img;
	}

	public int getS_jjim() {
		return s_jjim;
	}

	public void setS_jjim(int s_jjim) {
		this.s_jjim = s_jjim;
	}

	public int getS_discnt() {
		return s_discnt;
	}

	public void setS_discnt(int s_discnt) {
		this.s_discnt = s_discnt;
	}

	public String getM_nick() {
		return m_nick;
	}

	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}

	public AllgoodsDTO(int i, int j, int s_idx, String string, int s_discnt, int sg_main, int k) {
		this.s_idx = s_idx;
		this.s_title = s_title;
		this.sg_main = sg_main;
		this.m_nick = m_nick;
		this.s_img = s_img;
		this.s_jjim = s_jjim;
		this.s_discnt = s_discnt;
	}

	public AllgoodsDTO(String m_nick,String s_title, int s_idx, int m_idx, int s_jjim, int sg_discnt,int s_discnt, int sg_main, int sg_price,  String s_img  ) {
		
		this.s_idx = s_idx;
		this.m_idx = m_idx;
		this.s_title = s_title;
		this.sg_main = sg_main;
		this.sg_price =sg_price;
		this.m_nick = m_nick;
		this.s_img = s_img;
		this.s_jjim = s_jjim;
		this.s_discnt = s_discnt;
		this.sg_discnt = sg_discnt;
		
	}
	
	


}
