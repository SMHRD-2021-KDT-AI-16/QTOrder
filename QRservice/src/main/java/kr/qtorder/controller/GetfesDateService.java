package kr.qtorder.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import kr.qtorder.db.FestivalDAO;
import kr.qtorder.model.FestivalVO;

public class GetfesDateService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int fes_idx = Integer.parseInt(request.getParameter("ft_idx"));
		System.out.println("fes_idx "+ fes_idx);
		FestivalDAO fdao = new FestivalDAO();
		
		
		 FestivalVO fvo = fdao.getFesDate(fes_idx);
		 
		 JSONObject jsonObject = new JSONObject(); jsonObject.put("startDate",
		 fvo.getFes_start()); jsonObject.put("endDate", fvo.getFes_end());
		 
		 // 응답 헤더 설정 response.setContentType("application/json");
		 response.setCharacterEncoding("UTF-8");
		 
		 // 응답으로 JSON 데이터 보내기
		 PrintWriter out = response.getWriter();
		 out.print(jsonObject.toString());
		 out.flush();
		 
		
		return null;
	}

}
