package kr.qtorder.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.qtorder.db.TestDAO;
import kr.qtorder.model.MenuVO;

@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public TestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		MenuVO menuvo = new MenuVO();
		
		TestDAO dao = new TestDAO();
		
		menuvo = dao.selectMenu();
		
		if(menuvo != null) {
			session.setAttribute("session_img", menuvo.getMenu_img());
		}		
		
		//System.out.println(menuvo.getMenu_img());
		response.sendRedirect("myTest.jsp");
	}

}
