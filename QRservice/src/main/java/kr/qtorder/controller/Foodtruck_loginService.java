package kr.qtorder.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.qtorder.db.JoinDAO222;
import kr.qtorder.model.BusinessVO;

public class Foodtruck_loginService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String ft_bno = request.getParameter("b_num");
		String ft_pw = request.getParameter("pass");
		
		System.out.println("test : "+ft_bno);
		System.out.println("test : "+ft_pw);
		
		BusinessVO bvo = new BusinessVO();
		JoinDAO222 jdao = new JoinDAO222();
		
		bvo.setFt_bno(ft_bno);
		bvo.setFt_pw(ft_pw);
		
		
		BusinessVO bvo2 = jdao.selectLogin(bvo);
		System.out.println("test4 : "+bvo2.getFt_name());
		if(bvo2 != null) {
			HttpSession session = request.getSession();
	        session.setAttribute("loggedInUser", bvo2);
			response.getWriter().write("Success");
		}
		
		return null;
	}

}
