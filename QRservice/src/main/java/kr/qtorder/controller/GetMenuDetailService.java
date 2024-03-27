package kr.qtorder.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.qtorder.db.MenuDetail123DAO;
import kr.qtorder.model.CustomerVO;
import kr.qtorder.model.FoodCartVO123;
import kr.qtorder.model.Menu_DetailVO;

public class GetMenuDetailService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		CustomerVO customer = (CustomerVO) request.getServletContext().getAttribute("customerInfo");
		String cust_phone = customer.getCust_phone();
		
		int ft_idx = Integer.parseInt(request.getParameter("ft_idx"));
		int menu_idx = Integer.parseInt(request.getParameter("menu_idx"));
		
		MenuDetail123DAO mddao = new MenuDetail123DAO();
		
		List<Menu_DetailVO> list = mddao.getmenudetail(menu_idx);
		
		
		session.setAttribute("menuDetail", list);
		
		List<FoodCartVO123> list2 = mddao.getCart(cust_phone);
		int price = 0;
		if(list2 != null) {
			for(FoodCartVO123 x : list2) {
				price += x.getMenu_cnt() * x.getMenu_price();
			}
		}
		session.setAttribute("totalprice", price);
		
		return "menu_detail.jsp";
	}
}
