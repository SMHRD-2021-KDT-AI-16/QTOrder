package kr.qtorder.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.qtorder.db.CartDAO123;
import kr.qtorder.model.CustomerVO;

public class Ft_checkService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		CustomerVO customer = (CustomerVO) request.getServletContext().getAttribute("customerInfo");
		String cust_phone = customer.getCust_phone();
		int new_ft_idx = Integer.parseInt(request.getParameter("ft_idx"));
		System.out.println("new : "+new_ft_idx);
		System.out.println("new2 : "+cust_phone);
		
		CartDAO123 cdao = new CartDAO123();
		
		int cart_num = cdao.get_cart_num(cust_phone);
		System.out.println("cart_num"+cart_num);
		
		int ft_idx = cdao.get_ft_idx(cart_num);
		System.out.println("ft_idx"+ft_idx);
		
		int result;
		// 2개가 같다면
		if(ft_idx == new_ft_idx) {
			result = 1;
		}else {
			result = 0;
		}
		System.out.println("result : "+result);
		response.getWriter().write(String.valueOf(result));
		
		return null;
	}

}
