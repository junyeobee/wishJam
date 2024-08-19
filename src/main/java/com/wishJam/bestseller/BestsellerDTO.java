package com.wishJam.bestseller;

public class BestsellerDTO {

    private int idx;
    private String name;
    private int price;
    private String m_nick;
    private String thumbnail_url;
    private int jjim;
    
    
    
    
	public BestsellerDTO() {
		
	}


	public BestsellerDTO(int idx, String name, int price, String  m_nick, String thumbnail_url, int jjim) {
		
		this.idx = idx;
		this.name = name;
		this.price = price;
		this. m_nick = m_nick;
		this.thumbnail_url = thumbnail_url;
		this.jjim = jjim;
	}
	
	
	public BestsellerDTO(String m_nick) {
		this.m_nick=m_nick;
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
	public String getM_nick() {
		return  m_nick;
	}
	public void setM_nick(String  m_nick) {
		this. m_nick =  m_nick;
	}
	public String getThumbnail_url() {
		return thumbnail_url;
	}
	public void setThumbnail_url(String thumbnail_url) {
		this.thumbnail_url = thumbnail_url;
	}


	
    
    
}
