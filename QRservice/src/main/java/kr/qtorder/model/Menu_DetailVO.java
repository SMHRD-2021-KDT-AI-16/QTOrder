package kr.qtorder.model;

public class Menu_DetailVO {
	private int ft_idx;
	private int menu_idx;
	private String menu_name;
	private int menu_price;
	private String menu_img;
	private int menu_waiting_time;
	private int mo_idx;
	private String mo_name;
	private String mo_notice;
	private int od_idx;
	
	public String getMenu_name() {
		return menu_name;
	}
	public int getMenu_price() {
		return menu_price;
	}
	public String getMenu_img() {
		return menu_img;
	}
	public int getMenu_waiting_time() {
		return menu_waiting_time;
	}
	public String getMo_name() {
		return mo_name;
	}
	public String getMo_notice() {
		return mo_notice;
	}
	public int getOd_idx() {
		return od_idx;
	}
	public int getFt_idx() {
		return ft_idx;
	}
	public int getMenu_idx() {
		return menu_idx;
	}
	public int getMo_idx() {
		return mo_idx;
	}
	
	
}
