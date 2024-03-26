package kr.qtorder.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.qtorder.db.FesAddListDAO;
import kr.qtorder.model.FesAddListVO;

public class FesAddListDeleteService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		FesAddListVO vo = new FesAddListVO();
		vo.setList_idx(num);
		
		FesAddListDAO dao = new FesAddListDAO();
		int row = dao.deleteList(vo);
		
		return "fesAdminPage.do";
	}

}
