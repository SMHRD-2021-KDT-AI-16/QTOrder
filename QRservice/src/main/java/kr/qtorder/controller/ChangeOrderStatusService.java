package kr.qtorder.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import kr.qtorder.db.OrderDAO;

public class ChangeOrderStatusService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		int order_idx = Integer.parseInt(request.getParameter("order_idx"));
		
		OrderDAO odao = new OrderDAO();
		int row = odao.chgOrderStatus(order_idx);
		
		JSONObject result = new JSONObject();
	    result.put("row", row);

	    // 응답으로 결과를 전송합니다.
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    PrintWriter out = response.getWriter();
	    out.print(result);
	    out.flush();
		
		return null;
	}

}
