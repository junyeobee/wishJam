package com.manage.wishJam;
import java.sql.*;

public class BannerDTO {
	private int b_idx;
	private String b_name;
	private String b_src;
	private Date b_sdate;
	private Date b_edate;
	private String b_link;
	
	public BannerDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public BannerDTO(int b_idx, String b_name, String b_src, Date b_sdate, Date b_edate, String b_link) {
		this.b_idx = b_idx;
		this.b_name = b_name;
		this.b_src = b_src;
		this.b_sdate = b_sdate;
		this.b_edate = b_edate;
		this.b_link = b_link;
	}

	public int getB_idx() {
		return b_idx;
	}

	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public String getB_src() {
		return b_src;
	}

	public void setB_src(String b_src) {
		this.b_src = b_src;
	}

	public Date getB_sdate() {
		return b_sdate;
	}

	public void setB_sdate(Date b_sdate) {
		this.b_sdate = b_sdate;
	}

	public Date getB_edate() {
		return b_edate;
	}

	public void setB_edate(Date b_edate) {
		this.b_edate = b_edate;
	}

	public String getB_link() {
		return b_link;
	}

	public void setB_link(String b_link) {
		this.b_link = b_link;
	}
	
}
