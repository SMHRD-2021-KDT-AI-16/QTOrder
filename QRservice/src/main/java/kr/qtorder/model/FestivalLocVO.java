package kr.qtorder.model;

public class FestivalLocVO {
	
	private int fes_idx;
	private String fes_loc_name;
	private String fes_start;
	private String fes_end;
	
	public FestivalLocVO(int fes_idx, String fes_loc_name, String fes_start, String fes_end) {
		super();
		this.fes_idx = fes_idx;
		this.fes_loc_name = fes_loc_name;
		this.fes_start = fes_start;
		this.fes_end = fes_end;
	}


	public int getFes_idx() {
		return fes_idx;
	}


	public void setFes_idx(int fes_idx) {
		this.fes_idx = fes_idx;
	}


	public String getFes_loc_name() {
		return fes_loc_name;
	}


	public void setFes_loc_name(String fes_loc_name) {
		this.fes_loc_name = fes_loc_name;
	}


	public String getFes_start() {
		return fes_start;
	}


	public void setFes_start(String fes_start) {
		this.fes_start = fes_start;
	}


	public String getFes_end() {
		return fes_end;
	}


	public void setFes_end(String fes_end) {
		this.fes_end = fes_end;
	}
	

}
