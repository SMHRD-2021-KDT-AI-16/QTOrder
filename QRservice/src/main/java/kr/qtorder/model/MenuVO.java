package kr.qtorder.model;

import org.json.simple.JSONArray;

public class MenuVO {
	private int menu_idx;
	private int ft_idx;	
	private String menu_name;
	private int menu_price;
	private String menu_img;
	private String menu_status;
	private String menu_category;
	private int menu_waiting_time;
	private int menu_main;
	private JSONArray menu_group;
	private String menu_info;
	
	public String getMenu_info() {
		return menu_info;
	}
	public void setMenu_info(String menu_info) {
		this.menu_info = menu_info;
	}
	public int getMenu_idx() {
		return menu_idx;
	}
	public int getFt_idx() {
		return ft_idx;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public int getMenu_price() {
		return menu_price;
	}
	public String getMenu_img() {
		return menu_img;
	}
	public String getMenu_status() {
		return menu_status;
	}
	public String getMenu_category() {
		return menu_category;
	}
	public int getMenu_waiting_time() {
		return menu_waiting_time;
	}
	public int getMenu_main() {
		return menu_main;
	}
	public JSONArray getMenu_group() {
		return menu_group;
	}
	public void setMenu_idx(int menu_idx) {
		this.menu_idx = menu_idx;
	}
	public void setFt_idx(int ft_idx) {
		this.ft_idx = ft_idx;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}
	public void setMenu_img(String menu_img) {
		this.menu_img = menu_img;
	}
	public void setMenu_status(String menu_status) {
		this.menu_status = menu_status;
	}
	public void setMenu_category(String menu_category) {
		this.menu_category = menu_category;
	}
	public void setMenu_waiting_time(int menu_waiting_time) {
		this.menu_waiting_time = menu_waiting_time;
	}
	public void setMenu_main(int menu_main) {
		this.menu_main = menu_main;
	}
	public void setMenu_group(JSONArray menu_group) {
		this.menu_group = menu_group;
	}
	
}
