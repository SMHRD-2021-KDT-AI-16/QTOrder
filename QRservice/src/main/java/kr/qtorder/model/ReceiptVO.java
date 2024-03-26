package kr.qtorder.model;

import java.util.Date;

public class ReceiptVO {
	private int order_idx;
	private String cust_phone;
	private Date ordered_at;
	private String cust_name;
	private String ft_name;
	private String menu_name;
	private int menu_price;
	private int menu_cnt;
	private String mo_name;
	private String mo_notice;
	
	
	public int getOrder_idx() {
		return order_idx;
	}
	public String getCust_phone() {
		return cust_phone;
	}
	public Date getOrdered_at() {
		return ordered_at;
	}
	public String getCust_name() {
		return cust_name;
	}
	public String getFt_name() {
		return ft_name;
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
	public void setOrder_idx(int order_idx) {
		this.order_idx = order_idx;
	}
	public void setCust_phone(String cust_phone) {
		this.cust_phone = cust_phone;
	}
	
	
}
