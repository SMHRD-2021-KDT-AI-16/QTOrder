package kr.qtorder.model;

public class BestMenuVO {
	private int menu_idx;
	private int ft_idx;
	private String menu_name;
	private int menu_price;
	private String menu_img;
	private String menu_category;
	
	
	public BestMenuVO() {
	}
	
	
	public String getMenu_category() {
		return menu_category;
	}
	public void setMenu_category(String menu_category) {
		this.menu_category = menu_category;
	}
	public int getMenu_idx() {
		return menu_idx;
	}
	public void setMenu_idx(int menu_idx) {
		this.menu_idx = menu_idx;
	}
	public int getFt_idx() {
		return ft_idx;
	}
	public void setFt_idx(int ft_idx) {
		this.ft_idx = ft_idx;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}
	public String getMenu_img() {
		return menu_img;
	}
	public void setMenu_img(String menu_img) {
		this.menu_img = menu_img;
	}
	
	
}
