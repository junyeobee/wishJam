package com.allgoods.wishJam;

public class JjimDTO {
private int m_idx;
private int s_idx;
private int s_jjim;




public JjimDTO() {
	super();
}


public JjimDTO(int m_idx, int s_idx, String s_title, int s_jjim) {

	this.m_idx = m_idx;
	this.s_idx = s_idx;
	this.s_jjim = s_jjim;
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

public int getS_jjim() {
	return s_jjim;
}
public void setS_jjim(int s_jjim) {
	this.s_jjim = s_jjim;
}



	
}
