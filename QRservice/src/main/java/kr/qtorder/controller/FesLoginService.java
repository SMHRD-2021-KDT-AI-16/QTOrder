package kr.qtorder.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.qtorder.db.FesMemberDAO;
import kr.qtorder.model.FesMemberVO;

public class FesLoginService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String admin_id = request.getParameter("admin_id");
		String admin_pw = request.getParameter("admin_pw");
		
		FesMemberVO vo = new FesMemberVO();
		vo.setAdmin_id(admin_id);
		vo.setAdmin_pw(admin_pw);
		
		FesMemberDAO dao = new FesMemberDAO();
		FesMemberVO result = dao.login(vo);
		
		if (result != null) {
			
			request.getServletContext().setAttribute("loginId", result.getAdmin_id());
			
			System.out.println("로그인 성공");
			return "list_festival.jsp";
			
		} else {
			System.out.println("로그인 실패");
			return "fesAdminLogin.jsp";
		}
		
	}

}
