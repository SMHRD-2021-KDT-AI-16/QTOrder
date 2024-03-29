package kr.qtorder.model;

public class OrderStateNowVO {
	private int order_idx;
	private String ft_name;
	private String ordered_at;
	private String menu_name;
	private int menu_price;
	private int menu_cnt;
	private String mo_name;
	private String mo_notice;
	private String order_state;
	
	public int getOrder_idx() {
		return order_idx;
	}
	public String getFt_name() {
		return ft_name;
	}
	public String getOrdered_at() {
		return ordered_at;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public int getMenu_price() {
		return menu_price;
	}
	public int getMenu_cnt() {
		return menu_cnt;
	}
	public String getMo_name() {
		return mo_name;
	}
	public String getMo_notice() {
		return mo_notice;
	}
	public String getOrder_state() {
		return order_state;
	}
	
	
}
