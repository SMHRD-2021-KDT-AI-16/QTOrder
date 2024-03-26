package kr.qtorder.model;

public class Order_menuVO {
	private int order_idx;
	private int menu_idx;
	private int menu_cnt;
	private int mo_idx;
	private int od_idx;
	
	public int getOrder_idx() {
		return order_idx;
	}
	public int getMenu_idx() {
		return menu_idx;
	}
	public int getMo_idx() {
		return mo_idx;
	}
	public int getOd_idx() {
		return od_idx;
	}
	public int getMenu_cnt() {
		return menu_cnt;
	}
	public void setOrder_idx(int order_idx) {
		this.order_idx = order_idx;
	}
	public void setMenu_idx(int menu_idx) {
		this.menu_idx = menu_idx;
	}
	public void setMo_idx(int mo_idx) {
		this.mo_idx = mo_idx;
	}
	public void setOd_idx(int od_idx) {
		this.od_idx = od_idx;
	}
	public void setMenu_cnt(int menu_cnt) {
		this.menu_cnt = menu_cnt;
	}
	
	
}
