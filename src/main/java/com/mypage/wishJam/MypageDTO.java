package com.mypage.wishJam;
import java.io.*;
import java.sql.Date;

public class MypageDTO {

    private String homepath;
    private String url = "img/member_profile/";
    private String crpath;

    //판매상품
    private int idx;
    private String s_title;
    private int sg_price;
    private String seller;
    private String s_img ;
    private int discount;

    //mypage
    private String profile;

	//member
    private int m_idx;
	private String m_nick;
	private int g_idx;
	private String m_id;
	private String m_pwd;
	private String m_name;
	private String m_tel;
	private String m_addr;
	private String m_email;
	
	private String m_grade;
	//private int m_point;
	
    public String getM_grade() {
		return m_grade;
	}


	public void setM_grade(String m_grade) {
		this.m_grade = m_grade;
	}


	public MypageDTO() {

    }
	

	public MypageDTO(String m_nick,String s_title, int sg_price, String s_img) {
		super();
		this.s_title = s_title;
		this.sg_price = sg_price;
		this.s_img = s_img;
		this.m_nick = m_nick;
	}


	public MypageDTO(String profile, int m_idx, String m_nick, int g_idx, String m_id, String m_pwd, String m_name,
			String m_tel, String m_addr, String m_email) {
		super();
		this.profile = profile;
		this.m_idx = m_idx;
		this.m_nick = m_nick;
		this.g_idx = g_idx;
		this.m_id = m_id;
		this.m_pwd = m_pwd;
		this.m_name = m_name;
		this.m_tel = m_tel;
		this.m_addr = m_addr;
		this.m_email = m_email;
	}
    public String getS_title() {
		return s_title;
	}


	public void setS_title(String s_title) {
		this.s_title = s_title;
	}


	public int getSg_price() {
		return sg_price;
	}


	public void setSg_price(int sg_price) {
		this.sg_price = sg_price;
	}


	public String getS_img() {
		return s_img;
	}


	public void setS_img(String s_img) {
		this.s_img = s_img;
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


	public int getG_idx() {
		return g_idx;
	}


	public void setG_idx(int g_idx) {
		this.g_idx = g_idx;
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


	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

    

    public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	public void setUrl(String url) {
		this.url = url;
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


    
    
    public String getCrpath() {
        return crpath;
    }

    public void setCrpath(String crpath) {
        this.crpath = crpath;
    }



}