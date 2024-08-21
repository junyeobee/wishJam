package com.wishJam.Report;

public class ReportDTO {
	
	private int rp_idx;
	private int s_idx;
	private String rp_reason;
	private int r_stat;
	private int reported;
	private int reporter;
	
	public ReportDTO() {}
	
	public ReportDTO(int rp_idx, int s_idx, String rp_reason, int r_stat, int reported, int reporter) {
		super();
		this.rp_idx = rp_idx;
		this.s_idx = s_idx;
		this.rp_reason = rp_reason;
		this.r_stat = r_stat;
		this.reported = reported;
		this.reporter = reporter;
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
	
	public String getRp_reason() {
		return rp_reason;
	}

	public void setRp_reason(String rp_reason) {
		this.rp_reason = rp_reason;
	}

	public int getR_stat() {
		return r_stat;
	}

	public void setR_stat(int r_stat) {
		this.r_stat = r_stat;
	}

	public int getReported() {
		return reported;
	}

	public void setReported(int reported) {
		this.reported = reported;
	}

	public int getReporter() {
		return reporter;
	}

	public void setReporter(int reporter) {
		this.reporter = reporter;
	}
}