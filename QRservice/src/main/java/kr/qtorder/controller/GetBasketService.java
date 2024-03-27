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

public class GetBasketService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		CustomerVO customer = (CustomerVO) request.getServletContext().getAttribute("customerInfo");
		String cust_phone = customer.getCust_phone();
		
		MenuDetail123DAO mddao = new MenuDetail123DAO();
		
		List<FoodCartVO123> list = mddao.getCart(cust_phone);
		
		session.setAttribute("basketlist", list);
		
		return "Gofoodbasket.do";
	}

}
