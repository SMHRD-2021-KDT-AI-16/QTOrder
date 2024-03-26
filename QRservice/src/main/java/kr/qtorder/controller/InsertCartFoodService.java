package kr.qtorder.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.qtorder.db.CartDAO123;
import kr.qtorder.model.CartproductVO123;
import kr.qtorder.model.CustomerVO;

public class InsertCartFoodService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();

		CustomerVO customer = (CustomerVO) session.getAttribute("customerInfo");
		String cust_phone = customer.getCust_phone();
		int ft_idx = Integer.parseInt(request.getParameter("ft_idx"));
		System.out.println("2 : "+ft_idx);
		int menu_idx = Integer.parseInt(request.getParameter("menu_idx"));
		System.out.println("3 : "+menu_idx);
		int menu_cnt = Integer.parseInt(request.getParameter("menu_cnt"));
		System.out.println("4 : "+menu_cnt);
		int mo_idx = Integer.parseInt(request.getParameter("mo_idx"));
		System.out.println("5 : "+mo_idx);
		int od_idx = Integer.parseInt(request.getParameter("od_idx"));
		System.out.println("6 : "+od_idx);
		
		CartDAO123 cdao = new CartDAO123();
		
		// 먼저 cart에 정보가 있는지 확인
		int yn = cdao.cartCheck(cust_phone);
		// 있으면 1 없으면 0
		
		if(yn == 0) {
			// 없으면 cart에 넣는다
			cdao.insertCart(cust_phone);
		}
		

			int cart_num = cdao.get_cart_num(cust_phone);
			System.out.println("1 : "+cart_num);
			CartproductVO123 cpvo = new CartproductVO123(cart_num, ft_idx, menu_idx, menu_cnt, mo_idx, od_idx);
			System.out.println("cpvo : "+cpvo.getCart_num());
			cdao.insertCartproduct(cpvo);
			
		return "cus_choice_menu.do?num="+ft_idx;
	}

}
