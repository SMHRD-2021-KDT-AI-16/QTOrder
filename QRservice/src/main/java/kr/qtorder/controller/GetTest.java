package kr.qtorder.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.qtorder.db.TestDAO;

public class GetTest implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("test1");
		TestDAO td = new TestDAO();
		
		int num = td.test();
		
		System.out.println("test : "+num);
		
		return null;
	}
	
}
