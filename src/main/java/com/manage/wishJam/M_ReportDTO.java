package com.manage.wishJam;

public class M_ReportDTO {
	private int rp_idx;
	private int s_idx;
	private String rp_reason;
	private int r_stat;
	private int reported_idx;
	private int	reporter_idx;
	private String reported_nick;
	private String reporter_nick;
	public M_ReportDTO() {
		// TODO Auto-generated constructor stub
	}

	public M_ReportDTO(int rp_idx, int s_idx, String rp_reason, int r_stat, int reported_idx, int reporter_idx) {
		this.rp_idx = rp_idx;
		this.s_idx = s_idx;
		this.rp_reason = rp_reason;
		this.r_stat = r_stat;
		this.reported_idx = reported_idx;
		this.reporter_idx = reporter_idx;
	}
	
	public M_ReportDTO(int rp_idx, int s_idx, String rp_reason, String reported_nick, String reporter_nick) {
		this.rp_idx = rp_idx;
		this.s_idx = s_idx;
		this.rp_reason = rp_reason;
		this.reported_nick = reported_nick;
		this.reporter_nick = reporter_nick;
	}

	public M_ReportDTO(int rp_idx, int s_idx, String rp_reason, int r_stat, String reported_nick,
			String reporter_nick) {
		this.rp_idx = rp_idx;
		this.s_idx = s_idx;
		this.rp_reason = rp_reason;
		this.r_stat = r_stat;
		this.reported_nick = reported_nick;
		this.reporter_nick = reporter_nick;
	}
	
	public String getReported_nick() {
		return reported_nick;
	}

	public void setReported_nick(String reported_nick) {
		this.reported_nick = reported_nick;
	}

	public String getReporter_nick() {
		return reporter_nick;
	}

	public void setReporter_nick(String reporter_nick) {
		this.reporter_nick = reporter_nick;
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
	public void setR_stat(int c_stat) {
		this.r_stat = c_stat;
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
