package kr.qtorder.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.qtorder.db.TestDAO;

@WebServlet("/SelectMenuOptions")
public class SelectMenuOptions extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectMenuOptions() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		TestDAO dao = new TestDAO();		
		int menu_idx = Integer.parseInt(request.getParameter("menu_idx"));
		List<HashMap<String, Object>> orderlist = dao.selectMenuOptions(menu_idx);
		
		Gson gson = new Gson();         // Student 객체 -> Json 문자열        
		String jsonStr = gson.toJson(orderlist);         // Json 문자열 출력        
		
		//System.out.println(order_idx); 
		
		response.setContentType("application/json; charset=utf-8");		
		response.getWriter().print(jsonStr);
	}

}
