package kr.qtorder.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.qtorder.db.FesMemberDAO;

public class FesAdminidCheckService implements Command{
	
	private static final Logger logger = Logger.getLogger(FesAdminidCheckService.class.getName());

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/plain; charset=UTF-8");
		
		String admin_id = request.getParameter("admin_id");
		//System.out.println(admin_id);
		
		logger.info("Admin ID: " + admin_id);
		
		boolean checkI = new FesMemberDAO().IdCheck(admin_id);
		try(PrintWriter out = response.getWriter()) {
			out.print(checkI);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	

}
