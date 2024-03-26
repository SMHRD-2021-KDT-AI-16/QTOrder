package kr.qtorder.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.qtorder.db.TestDAO;
import kr.qtorder.model.MenuVO;

@WebServlet("/DeleteMenu")
public class DeleteMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteMenu() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int menu_idx = Integer.parseInt(request.getParameter("menuId"));
		System.out.println(menu_idx);
		TestDAO dao = new TestDAO();
		
		int result = dao.deleteMenu(menu_idx);
		
		if(result > 0) {
			List<MenuVO>  listMenuVO = dao.selectMenuAll();
			Gson gson = new Gson();        // Student 객체 -> Json 문자열        
			String jsonStr = gson.toJson(listMenuVO);   
			
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().print(jsonStr);
		}
	}

}
