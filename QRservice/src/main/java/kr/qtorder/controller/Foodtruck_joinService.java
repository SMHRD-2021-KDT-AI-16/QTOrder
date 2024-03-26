package kr.qtorder.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.qtorder.db.JoinDAO222;
import kr.qtorder.model.BusinessVO;

public class Foodtruck_joinService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Test");
		String ft_bno = request.getParameter("b_num");
		String ft_pw = request.getParameter("pass");
		String ft_name = request.getParameter("bf_name");
		String ft_owner = request.getParameter("b_name");
		String ft_tel = request.getParameter("b_phone");
		
		System.out.println("Test : "+ft_bno);
		System.out.println("Test : "+ft_pw);
		System.out.println("Test : "+ft_name);
		System.out.println("Test : "+ft_owner);
		System.out.println("Test : "+ft_tel);
		
		BusinessVO bvo = new BusinessVO();
		
		bvo.setFt_bno(ft_bno);
		bvo.setFt_pw(ft_pw);
		bvo.setFt_owner(ft_owner);
		bvo.setFt_name(ft_name);
		bvo.setFt_tel(ft_tel);
		
		System.out.println("test2");
		JoinDAO222 jdao = new JoinDAO222();
		System.out.println("test3");
		int row = jdao.businessInsert(bvo);
		
		if(row ==1) {
			response.getWriter().write("Success");	
		}
		
		
		return null;
	}

}
