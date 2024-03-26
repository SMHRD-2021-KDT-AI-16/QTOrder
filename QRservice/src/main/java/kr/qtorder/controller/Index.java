package kr.qtorder.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/asfdadsfadfadfadfasdf")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			//resp.sendRedirect("select_pos.jsp");
		}
}
