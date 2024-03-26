package kr.qtorder.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.qtorder.db.FestivalDAO;
import kr.qtorder.model.FesVO;
import kr.qtorder.model.Fes_user_viewVO;

public class GetuserfesLocService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		FesVO fvo = (FesVO) session.getAttribute("fesname");
		int fes_idx = fvo.getFes_idx();
		
		FestivalDAO fdao = new FestivalDAO();
		
		List<Fes_user_viewVO> fuvo = fdao.get_user_loc_view(fes_idx);  
		session.setAttribute("fes_user_view", fuvo);
		
		return "fesMap.jsp";
	}

}
