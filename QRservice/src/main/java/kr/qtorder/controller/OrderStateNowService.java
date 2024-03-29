package kr.qtorder.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.qtorder.db.OrderDAO;
import kr.qtorder.model.CustomerVO;
import kr.qtorder.model.OrderStateNowVO;

public class OrderStateNowService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		CustomerVO userinfo = (CustomerVO) request.getServletContext().getAttribute("customerInfo");
		String cust_phone = userinfo.getCust_phone();
		
		OrderDAO odao = new OrderDAO();
		List<OrderStateNowVO> list = odao.order_num_get_state(cust_phone);
		
		if(list != null) {
			request.setAttribute("state_now", list);
			
		}else {
			System.out.println("없음");
		}
		
		return "order_state.jsp";
	}

}
