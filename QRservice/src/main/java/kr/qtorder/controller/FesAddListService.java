package kr.qtorder.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.qtorder.db.FesAddListDAO;
import kr.qtorder.model.FesAddListVO;


public class FesAddListService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String fes_name = request.getParameter("selectedFestivalName");
		String fes_start = request.getParameter("selectedFestivalStart");
		String fes_end = request.getParameter("selectedFestivalEnd");
		String fes_booth = request.getParameter("selectedFestivalBooth");
		String ft_bno = request.getParameter("input_bno");
		String admin_id = request.getParameter("loginId");
		
		FesAddListVO vo = new FesAddListVO();
		
		vo.setFes_name(fes_name);
		vo.setFes_start(fes_start);
		vo.setFes_end(fes_end);
		vo.setFes_loc_name(fes_booth);
		vo.setFt_bno(ft_bno);
		vo.setAdmin_id(admin_id);
		
		FesAddListDAO dao = new FesAddListDAO();
		
		int row = dao.insertList(vo);
		if(row > 0) {
			return "fesAdminPage.do";
		} else {
			System.out.println("insert fail");
			return null;
		}
		
		
	}

}
