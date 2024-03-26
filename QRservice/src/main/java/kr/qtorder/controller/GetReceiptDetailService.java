package kr.qtorder.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.qtorder.db.ReceiptDAO;
import kr.qtorder.model.CustomerVO;
import kr.qtorder.model.ReceiptVO;

public class GetReceiptDetailService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int value = Integer.parseInt(request.getParameter("value"));
		
		HttpSession session = request.getSession();

		CustomerVO customer = (CustomerVO) request.getServletContext().getAttribute("customerInfo");
		String cust_phone = customer.getCust_phone();
		
		ReceiptVO rvo = new ReceiptVO();
		
		rvo.setCust_phone(cust_phone);
		rvo.setOrder_idx(value);
		
		ReceiptDAO rdao = new ReceiptDAO();
		
		List<ReceiptVO> list = rdao.getreceiptdetail(rvo);
		if(list != null) {
			System.out.println("test : "+list);
			request.setAttribute("receiptDetailList", list);
			
		}else {
			System.out.println("없음");
		}
		
		return "receiptDetail.jsp";
	}

}
