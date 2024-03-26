package kr.qtorder.controller;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import kr.qtorder.db.TestDAO;
import kr.qtorder.model.MenuVO;

@WebServlet("/AddMenu")
public class AddMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddMenu() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String addMenu = request.getParameter("addMenu");
		
		TestDAO dao = new TestDAO();
		Gson gson = new Gson();
		Type type = new TypeToken<HashMap<String, Object>>(){}.getType();
        HashMap<String, Object> menuMap = gson.fromJson(addMenu, type);
        		
		if (dao.addMenu(menuMap) > 0) {
			List<MenuVO>  listMenuVO = dao.selectMenuAll();     
			String jsonStr = gson.toJson(listMenuVO);   
			
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().print(jsonStr);
		};
	}

}
