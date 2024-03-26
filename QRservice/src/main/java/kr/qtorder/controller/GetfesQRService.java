package kr.qtorder.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.qtorder.db.FestivalDAO;
import kr.qtorder.model.Festival_infoVo;

public class GetfesQRService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String admin_id = "admin";
		FestivalDAO fdao = new FestivalDAO();
		List<Festival_infoVo> list = fdao.getFes_List(admin_id);
		
		session.setAttribute("festilist", list);
		
		return "GocreateQR.do";
	}

}
