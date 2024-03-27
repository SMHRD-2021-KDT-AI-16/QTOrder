package kr.qtorder.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.qtorder.db.CartDAO123;
import kr.qtorder.model.CustomerVO;

public class Delete_cartService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		CustomerVO customerInfo = (CustomerVO) request.getServletContext().getAttribute("customerInfo");
		String cust_phone = customerInfo.getCust_phone();
		int cart_product_num = Integer.parseInt(request.getParameter("cart_product_num"));
		System.out.println("test :"+cust_phone);
		CartDAO123 cdao = new CartDAO123();
		
		cdao.removeCartOne(cart_product_num);
		cdao.removeCart(cust_phone);
		
		return null;
	}

}
