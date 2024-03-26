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

@WebServlet("/AddMenuGroup")
public class AddMenuGroup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddMenuGroup() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		MenuVO menuvo = new MenuVO();		
		TestDAO dao = new TestDAO();
		String group_name = request.getParameter("group_name");
		int row = dao.addMenuGroup(group_name);
	}

}
