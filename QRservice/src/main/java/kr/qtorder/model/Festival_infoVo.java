package kr.qtorder.model;

import java.util.Date;

public class Festival_infoVo {
	private int fes_idx;
	private String fes_name;
	private Date fes_start;
	private Date fes_end;
	private String admin_id;
	
	public int getFes_idx() {
		return fes_idx;
	}
	public void setFes_idx(int fes_idx) {
		this.fes_idx = fes_idx;
	}
	public String getFes_name() {
		return fes_name;
	}
	public void setFes_name(String fes_name) {
		this.fes_name = fes_name;
	}
	public Date getFes_start() {
		return fes_start;
	}
	public void setFes_start(Date fes_start) {
		this.fes_start = fes_start;
	}
	public Date getFes_end() {
		return fes_end;
	}
	public void setFes_end(Date fes_end) {
		this.fes_end = fes_end;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	
	
}
