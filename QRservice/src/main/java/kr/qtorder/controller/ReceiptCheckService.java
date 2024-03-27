package kr.qtorder.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.qtorder.db.ReceiptDAO;
import kr.qtorder.model.CustomerVO;
import kr.qtorder.model.ReceiptVO;

public class ReceiptCheckService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		CustomerVO customer = (CustomerVO) request.getServletContext().getAttribute("customerInfo");
		String cust_phone = customer.getCust_phone();
		
		ReceiptDAO rdao = new ReceiptDAO();
		List<ReceiptVO> list = rdao.getreceipt(cust_phone);
		
		if(list != null) {
			System.out.println("test : "+list);
			request.getServletContext().setAttribute("receiptList", list);
		}else {
			System.out.println("없음");
		}
		
		return "receipt.jsp";
	}

}