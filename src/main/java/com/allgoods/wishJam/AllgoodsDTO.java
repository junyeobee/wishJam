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
 */

public class AllgoodsDTO {
private int idx;
private String name;
private int price;
private String seller;
private String thumbnail_url;

private String user_id;




 public AllgoodsDTO() {
	// TODO Auto-generated constructor stub
}
 

public AllgoodsDTO(int idx, String name, int price, String seller, String thumbnail_url) {
	super();
	this.idx = idx;
	this.name = name;
	this.price = price;
	this.seller = seller;
	this.thumbnail_url = thumbnail_url;
}


public int getIdx() {
	return idx;
}
public void setIdx(int idx) {
	this.idx = idx;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public String getSeller() {
	return seller;
}
public void setSeller(String seller) {
	this.seller = seller;
}
public String getThumbnail_url() {
	return thumbnail_url;
}
public void setThumbnail_url(String thumbnail_url) {
	this.thumbnail_url = thumbnail_url;
}


 
}
