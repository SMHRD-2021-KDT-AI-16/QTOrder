package kr.qtorder.model;

public class FestivalVO {
	private int ft_idx;
	private String fes_name;
	private String fes_start;
	private String fes_end;
	private String admin_id;
	
	public FestivalVO(int ft_idx, String fes_name, String fes_start, String fes_end, String admin_id) {
		super();
		this.ft_idx = ft_idx;
		this.fes_name = fes_name;
		this.fes_start = fes_start;
		this.fes_end = fes_end;
		this.admin_id = admin_id;
	}

	public int getFt_idx() {
		return ft_idx;
	}

	public void setFt_idx(int ft_idx) {
		this.ft_idx = ft_idx;
	}

	public String getFes_name() {
		return fes_name;
	}

	public void setFes_name(String fes_name) {
		this.fes_name = fes_name;
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

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	
	
}
