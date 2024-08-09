package com.allgoods.wishJam;

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
