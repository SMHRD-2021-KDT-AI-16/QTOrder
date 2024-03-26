package kr.qtorder.model;

public class FoodTruckVO {
	
	private int ft_idx;
	private String ft_name;
	private String ft_addr;
	private String ft_tel;
	private String ft_owner;
	private String ft_bno;
	private String ft_pw;
	private String ft_info;
	
	public FoodTruckVO() {
		super();
	}

	public FoodTruckVO(int ft_idx, String ft_name, String ft_addr, String ft_tel, String ft_owner,
					   String ft_bno, String ft_pw, String ft_info) {
		
		this.ft_idx = ft_idx;
		this.ft_name = ft_name;
		this.ft_addr = ft_addr;
		this.ft_tel = ft_tel;
		this.ft_owner = ft_owner;
		this.ft_bno = ft_bno;
		this.ft_pw = ft_pw;
		this.ft_info = ft_info;
	}
	
	@Override
    public String toString() {
		return "FoodTruckVO{" +
	            "ft_idx=" + ft_idx +
	            ", ft_name='" + ft_name + '\'' +
	            ", ft_addr='" + ft_addr + '\'' +
	            ", ft_tel='" + ft_tel + '\'' +
	            ", ft_owner='" + ft_owner + '\'' +
	            ", ft_bno='" + ft_bno + '\'' +
	            ", ft_pw='" + ft_pw + '\'' +
	            ", ft_info='" + ft_info + '\'' +
	            '}';
    }

	public int getFt_idx() {
		return ft_idx;
	}

	public void setFt_idx(int ft_idx) {
		this.ft_idx = ft_idx;
	}

	public String getFt_name() {
		return ft_name;
	}

	public void setFt_name(String ft_name) {
		this.ft_name = ft_name;
	}

	public String getFt_addr() {
		return ft_addr;
	}

	public void setFt_addr(String ft_addr) {
		this.ft_addr = ft_addr;
	}

	public String getFt_tel() {
		return ft_tel;
	}

	public void setFt_tel(String ft_tel) {
		this.ft_tel = ft_tel;
	}

	public String getFt_owner() {
		return ft_owner;
	}

	public void setFt_owner(String ft_owner) {
		this.ft_owner = ft_owner;
	}


	public String getFt_bno() {
		return ft_bno;
	}

	public void setFt_bno(String ft_bno) {
		this.ft_bno = ft_bno;
	}

	public String getFt_pw() {
		return ft_pw;
	}

	public void setFt_pw(String ft_pw) {
		this.ft_pw = ft_pw;
	}

	public String getFt_info() {
		return ft_info;
	}

	public void setFt_info(String ft_info) {
		this.ft_info = ft_info;
	}

}
