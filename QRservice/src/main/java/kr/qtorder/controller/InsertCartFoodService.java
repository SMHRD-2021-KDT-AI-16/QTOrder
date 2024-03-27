package kr.qtorder.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.qtorder.db.CartDAO123;
import kr.qtorder.model.CartproductVO123;
import kr.qtorder.model.CustomerVO;

public class InsertCartFoodService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		CustomerVO customer = (CustomerVO) request.getServletContext().getAttribute("customerInfo");
		String cust_phone = customer.getCust_phone();
		
		int ft_idx = Integer.parseInt(request.getParameter("ft_idx"));
		int menu_idx = Integer.parseInt(request.getParameter("menu_idx"));
		int menu_cnt = Integer.parseInt(request.getParameter("menu_cnt"));
		int mo_idx = Integer.parseInt(request.getParameter("mo_idx"));
		int od_idx = Integer.parseInt(request.getParameter("od_idx"));
		
		
		CartDAO123 cdao = new CartDAO123();
		
		// 먼저 cart에 정보가 있는지 확인
		int yn = cdao.cartCheck(cust_phone);
		// 있으면 1 없으면 0
		
		if(yn == 0) {
			// 없으면 cart에 넣는다
			cdao.insertCart(cust_phone);
		}
		
		int cart_num = cdao.get_cart_num(cust_phone);
		
		CartproductVO123 cpvo = new CartproductVO123(cart_num, ft_idx, menu_idx, menu_cnt, mo_idx, od_idx);
		// 카트식별자, 메뉴 인덱스, 매장식별자가 같은게 있는지 보고
		
		int yn2 = cdao.cart_product_check(cpvo);
		if(yn2 == 1) {
			//같은게 있다면 update구문으로 cnt만 업데이트
			cdao.update_cartproduct(cpvo);
		}else {
			// 같은게 없다면 넣기
			cdao.insertCartproduct(cpvo);			
		}
			
		return "cus_choice_menu.do?num="+ft_idx;
	}

}
