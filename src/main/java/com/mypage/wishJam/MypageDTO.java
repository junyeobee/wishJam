package com.mypage.wishJam;
import java.io.*;
import java.sql.Date;

public class MypageDTO {

    private String homepath;
    private String url = "img/member_profile/";
    private String crpath;

    //판매상품
    private int idx;
    private String name;
    private int price;
    private String seller;
    private String thumbnail_url;
    
    
    //member
	private int m_idx;
	private String m_nick;
	private String g_name; 
	private String m_id;
	private String m_pwd;
	private String m_name;
	private String m_tel;
	private String m_addr;
	private String m_email;
	private String m_point;
	private Date joindate;
	
	private String userid;
	
	
    
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

	public String getM_nick() {
		return m_nick;
	}

	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}

	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pwd() {
		return m_pwd;
	}

	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
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

	public String getM_addr() {
		return m_addr;
	}

	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_point() {
		return m_point;
	}

	public void setM_point(String m_point) {
		this.m_point = m_point;
	}

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
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

	public void setUrl(String url) {
		this.url = url;
	}

	public MypageDTO(int idx, String name, int price, String seller, String thumbnail_url) {
	
		this.idx = idx;
		this.name = name;
		this.price = price;
		this.seller = seller;
		this.thumbnail_url = thumbnail_url;
	}

	public String getHomepath() {
        return homepath;
    }

    public void setHomepath(String homepath) {
        this.homepath = homepath;
    }

    public String getUrl() {
        return url;
    }

//    public void setUrl(String url) {
//        this.url = url;
//    }

    public String getCrpath() {
        return crpath;
    }

    public void setCrpath(String crpath) {
        this.crpath = crpath;
    }

    public MypageDTO() {

    }

}