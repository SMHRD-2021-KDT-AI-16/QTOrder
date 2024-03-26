package kr.qtorder.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.qtorder.db.FesAddListDAO;
import kr.qtorder.model.FesAddListVO;

public class FesAddListSelectService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		FesAddListDAO dao = new FesAddListDAO();
		List<FesAddListVO> addList = new ArrayList<FesAddListVO>();
		
		addList = dao.selectAddList();
		session.setAttribute("selectAddList", addList);
		
		System.out.println("service addList = " + addList);
		
		return "GofesAdminPage.do";
	}

}
