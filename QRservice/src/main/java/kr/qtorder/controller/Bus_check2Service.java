package kr.qtorder.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import kr.qtorder.db.FoodTruckDAO;

public class Bus_check2Service implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String bus_num = request.getParameter("bus_num");
		
		FoodTruckDAO ftdao = new FoodTruckDAO();
		
		int yn = ftdao.bus_numcheck(bus_num);
		
		JSONObject result = new JSONObject();
	    result.put("yn", yn);

	    // 응답으로 결과를 전송합니다.
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    PrintWriter out = response.getWriter();
	    out.print(result);
	    out.flush();
		
		return null;
	}

}
