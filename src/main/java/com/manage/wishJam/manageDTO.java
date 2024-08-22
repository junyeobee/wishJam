package com.manage.wishJam;
import java.io.*;
import java.sql.*;

public class manageDTO {
	//1. 실제 파일 및 폴더가 있는 절대 경로
	private String homePath;
	//4. 공통경로
	private String url = "img/profile/";
	private String banner = "img/banner/";
	private String grade = "img/grade/";
	private String category = "img/category/";
	private String usrpf = "img/member_profile/";
	
	public String getUsrpf() {
		return usrpf;
	}
	public String getHomePath() {
		return homePath;
	}
	public void setHomePath(String homePath) {
		this.homePath = homePath;
	}
	public String getUrl() {
		return url;
	}
	public String getBanner() {
		return banner;
	}
	public String getGrade() {
		return grade;
	}
	public String getCategory() {
		return category;
	}
	public manageDTO() {
	}
}
