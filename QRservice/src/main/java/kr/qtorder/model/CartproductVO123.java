package kr.qtorder.model;

public class CartproductVO123 {
	private int cart_num;
	private int ft_idx;
	private int menu_idx;
	private int menu_cnt;
	private int mo_idx;
	private int od_idx;
	
	public CartproductVO123(int cart_num, int ft_idx, int menu_idx, int menu_cnt, int mo_idx, int od_idx) {
		super();
		this.cart_num = cart_num;
		this.ft_idx = ft_idx;
		this.menu_idx = menu_idx;
		this.menu_cnt = menu_cnt;
		this.mo_idx = mo_idx;
		this.od_idx = od_idx;
	}
	
	public int getCart_num() {
		return cart_num;
	}
	public int getFt_idx() {
		return ft_idx;
	}
	public int getMenu_idx() {
		return menu_idx;
	}
	public int getMenu_cnt() {
		return menu_cnt;
	}
	public int getMo_idx() {
		return mo_idx;
	}
	public int getOd_idx() {
		return od_idx;
	}
	
}
