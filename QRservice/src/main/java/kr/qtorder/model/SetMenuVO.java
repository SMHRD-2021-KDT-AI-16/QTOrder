package kr.qtorder.model;

public class SetMenuVO {
	
	private int group_idx;
	private int ft_idx;
	private String group_name;
	private int menu_idx;
	private String menu_name;
	private int menu_price;
	private String menu_img;
	

	public SetMenuVO() {
	}
	

	public int getGroup_idx() {
		return group_idx;
	}

	public void setGroup_idx(int group_idx) {
		this.group_idx = group_idx;
	}

	public int getFt_idx() {
		return ft_idx;
	}

	public void setFt_idx(int ft_idx) {
		this.ft_idx = ft_idx;
	}

	public String getGroup_name() {
		return group_name;
	}

	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}

	public int getMenu_idx() {
		return menu_idx;
	}

	public void setMenu_idx(int menu_idx) {
		this.menu_idx = menu_idx;
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
