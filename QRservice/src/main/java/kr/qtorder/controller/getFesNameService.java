package kr.qtorder.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.qtorder.db.FestivalDAO;
import kr.qtorder.model.FesVO;

public class getFesNameService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		int fes_idx = Integer.parseInt(request.getParameter("fes_idx"));
		System.out.println("fes_idx : "+fes_idx);
		FestivalDAO fdao = new FestivalDAO();
		
		FesVO fvo =  fdao.getfes(fes_idx);
		session.setAttribute("fesname", fvo);
		request.getServletContext().setAttribute("fesname", fvo);
		
		Gson gson = new Gson();
	    String jsonResult = gson.toJson(fvo);
	    
	    // JSON 형식으로 변환된 결과를 Ajax 요청의 응답으로 전송합니다.
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(jsonResult);
		
		return null;
	}

}
