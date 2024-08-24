package com.wishJam.bestseller;

public class BestsellerDTO {

    private int s_idx;
    private String s_title;
    private int price;
    private String m_nick;
    private String thumbnail_url;
    private int jjim;
    private int m_idx;
    
    
    
	public int getJjim() {
		return jjim;
	}


	public void setJjim(int jjim) {
		this.jjim = jjim;
	}


	public int getm_idx() {
		return m_idx;
	}


	public void setm_idx(int m_idx) {
		this.m_idx = m_idx;
	}


	public BestsellerDTO() {
		
	}


	public BestsellerDTO(int s_idx, String s_title, int price, int  m_idx, String thumbnail_url, int jjim) {
		
		this.s_idx = s_idx;
		this.s_title = s_title;
		this.price = price;
		this. m_idx = m_idx;
		this.thumbnail_url = thumbnail_url;
		this.jjim = jjim;
	}
	
	
	
	
	
	public BestsellerDTO(String m_nick) {
		this.m_nick=m_nick;
	}


	public BestsellerDTO(int s_idx, String s_title, int price, String m_nick, String thumbnail_url, int jjim) {
		this.s_idx = s_idx;
		this.s_title = s_title;
		this.price = price;
		this. m_nick = m_nick;
		this.thumbnail_url = thumbnail_url;
		this.jjim = jjim;
	}


	public int gets_idx() {
		return s_idx;
	}
	public void sets_idx(int s_idx) {
		this.s_idx = s_idx;
	}
	public String gets_title() {
		return s_title;
	}
	public void sets_title(String s_title) {
		this.s_title = s_title;
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
