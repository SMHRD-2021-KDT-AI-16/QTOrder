package kr.qtorder.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.qtorder.db.FesMemberDAO;
import kr.qtorder.model.FesMemberVO;

public class FesMemberJoinService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String admin_id = request.getParameter("admin_id");
		String admin_pw = request.getParameter("admin_pw");
		
		FesMemberVO vo = new FesMemberVO();
		vo.setAdmin_id(admin_id);
		vo.setAdmin_pw(admin_pw);
		
		FesMemberDAO dao = new FesMemberDAO();
		
		int row = dao.join(vo);
		if(row >0 ) {
			request.setAttribute("admin_id", admin_id);
			System.out.println("Join Success");
			return "fesAdminLogin.jsp";
		} else {
			System.out.println("Join Fail");
			return "GofesAdminJoin.do";
		}
		
	}

}
