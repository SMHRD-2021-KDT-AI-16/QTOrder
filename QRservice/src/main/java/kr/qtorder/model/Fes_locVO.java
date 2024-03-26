package kr.qtorder.model;

public class Fes_locVO {
	private int fes_idx;
	private String fes_loc_name;
	private double fes_loc_lat;
	private double fes_loc_lng;
	
	

	public Fes_locVO(int fes_idx, String fes_loc_name, double fes_loc_lat, double fes_loc_lng) {
		super();
		this.fes_idx = fes_idx;
		this.fes_loc_name = fes_loc_name;
		this.fes_loc_lat = fes_loc_lat;
		this.fes_loc_lng = fes_loc_lng;
	}

	public String getFes_loc_name() {
		return fes_loc_name;
	}

	public double getFes_loc_lat() {
		return fes_loc_lat;
	}

	public double getFes_loc_lng() {
		return fes_loc_lng;
	}

	public int getFes_idx() {
		return fes_idx;
	}
	
	
}
