package kr.qtorder.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.qtorder.db.CartDAO123;
import kr.qtorder.db.OrderDAO;
import kr.qtorder.model.CustomerVO;
import kr.qtorder.model.FoodCartVO123;
import kr.qtorder.model.OrderVO123;
import kr.qtorder.model.Order_menuVO;

public class InsertOrderService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();

		CustomerVO customer = (CustomerVO) request.getServletContext().getAttribute("customerInfo");
		String cust_phone = customer.getCust_phone();
		List<FoodCartVO123> fcvo = (List<FoodCartVO123>) session.getAttribute("basketlist");
		int ft_idx = fcvo.get(0).getFt_idx();
		
		System.out.println("test : "+cust_phone);
		System.out.println("test : "+ft_idx);
		
		OrderVO123 ovo = new OrderVO123();
		ovo.setCust_phone(cust_phone);
		ovo.setFt_idx(ft_idx);
		
		OrderDAO odao = new OrderDAO();
		Order_menuVO omvo = new Order_menuVO();
		// order테이블에 데이터를 넣고
		int row = odao.insertOrder(ovo);
		
		// 데이터가 들어갔다면
		if(row > 0) {
			// order_idx값을 가져오고
			int order_idx = odao.getOrderNum(ovo);
			System.out.println("order_idx : "+order_idx);
			
			//order detail에도 값을 넣는다
			for(int i = 0; i < fcvo.size(); i++) {
				System.out.println("??"+i);
				omvo.setOrder_idx(order_idx);
				omvo.setMenu_idx(fcvo.get(i).getMenu_idx());
				omvo.setMenu_cnt(fcvo.get(i).getMenu_cnt());
				omvo.setMo_idx(fcvo.get(i).getMo_idx());
				omvo.setOd_idx(fcvo.get(i).getOd_idx());
				
				odao.insertOrder_detail(omvo);
			}
			
		}
		
		CartDAO123 cdao = new CartDAO123();
		// 카트 번호 가져오고
		int cart_num = cdao.get_cart_num(cust_phone);
		System.out.println("cart_num : "+cart_num);
		// 카트프로덕트 지우고
		cdao.removeCart_product(cart_num);
		
		// 카트 지워야함
		cdao.removeCart(cust_phone);
		
		return "getreceipt.do";
	}

}
