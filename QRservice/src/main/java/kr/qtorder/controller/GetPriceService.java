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

public class GetPriceService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("price test");
		HttpSession session = request.getSession();
		CustomerVO customer = (CustomerVO) session.getAttribute("customerInfo");
		String cust_phone = customer.getCust_phone();
		MenuDetail123DAO mddao = new MenuDetail123DAO();
		List<FoodCartVO123> list = mddao.getCart(cust_phone);
		int price = 0;
		if(list != null) {
			for(FoodCartVO123 x:list) {
				price += x.getMenu_price()*x.getMenu_cnt();
			}
		}
		System.out.println("price : "+price);
		response.getWriter().write(String.valueOf(price));
		return null;
	}

}
