package com.wishJam.Report;

public class ReportDTO {
	
	private int s_idx;
	private String g_name;
	private String rp_reason;
	
	public ReportDTO() {}
	
	public ReportDTO(int s_idx, String g_name, String rp_reason) {
		super();
		this.s_idx = s_idx;
		this.g_name = g_name;
		this.rp_reason = rp_reason;
	}



	public int getS_idx() {
		return s_idx;
	}

	public void setS_idx(int s_idx) {
		this.s_idx = s_idx;
	}

	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
	}

	public String getRp_reason() {
		return rp_reason;
	}

	public void setRp_reason(String rp_reason) {
		this.rp_reason = rp_reason;
	}
	
	
}
