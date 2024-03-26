package kr.qtorder.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import kr.qtorder.db.FestivalDAO;
import kr.qtorder.model.AdminVO123;
import kr.qtorder.model.Festival_infoVo;

public class GetFesListService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		FestivalDAO fdao = new FestivalDAO();
		String admin_id = (String)session.getAttribute("loginId");
		
		List<Festival_infoVo> list = fdao.getFes_List(admin_id);
		
		
		JsonArray jArray = new JsonArray();
		Gson gson = new Gson();
		for (Festival_infoVo festival : list) {
			jArray.add(gson.toJsonTree(festival));
		}
		String jsonString = jArray.toString();
		
	    // Content Type 및 문자 인코딩 설정
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");

	    // JSON 데이터 전송
	    response.getWriter().write(jsonString);
		
		return null;
	}
	
}
