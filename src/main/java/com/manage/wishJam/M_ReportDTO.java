package com.manage.wishJam;

public class M_ReportDTO {
	private int rp_idx;
	private int s_idx;
	private int c_idx;
	private String rp_reason;
	private int c_stat;
	private int reported_idx;
	private int	reporter_idx;
	public M_ReportDTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	public M_ReportDTO(int rp_idx, int s_idx, int c_idx, String rp_reason, int c_stat, int reported_idx, int reporter_idx) {
		this.rp_idx = rp_idx;
		this.s_idx = s_idx;
		this.c_idx = c_idx;
		this.rp_reason = rp_reason;
		this.c_stat = c_stat;
		this.reported_idx = reported_idx;
		this.reporter_idx = reporter_idx;
	}


	public int getRp_idx() {
		return rp_idx;
	}
	public void setRp_idx(int rp_idx) {
		this.rp_idx = rp_idx;
	}
	public int getS_idx() {
		return s_idx;
	}
	public void setS_idx(int s_idx) {
		this.s_idx = s_idx;
	}
	public int getC_idx() {
		return c_idx;
	}
	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}
	public String getRp_reason() {
		return rp_reason;
	}
	public void setRp_reason(String rp_reason) {
		this.rp_reason = rp_reason;
	}
	public int getC_stat() {
		return c_stat;
	}
	public void setC_stat(int c_stat) {
		this.c_stat = c_stat;
	}
	public int getReported_idx() {
		return reported_idx;
	}
	public void setReported_idx(int reported_idx) {
		this.reported_idx = reported_idx;
	}
	public int getReporter_idx() {
		return reporter_idx;
	}
	public void setReporter_idx(int reporter_idx) {
		this.reporter_idx = reporter_idx;
	}
	
	
}
