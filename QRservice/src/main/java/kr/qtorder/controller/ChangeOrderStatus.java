package kr.qtorder.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;

import kr.qtorder.db.TestDAO;

@WebServlet("/ChangeOrderStatus")
public class ChangeOrderStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChangeOrderStatus() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		int targetOrderIdx = Integer.parseInt(request.getParameter("targetOrderIdx"));
		String selectedOrderStatus = request.getParameter("selectedOrderStatus");
		
		TestDAO dao = new TestDAO();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("order_idx", targetOrderIdx);
		map.put("order_state", selectedOrderStatus);
		
		int result = dao.changeOrderStatus(map);		
		
		
//        response.setContentType("application/x-json; charset=utf-8");
//        response.getWriter().print(jarray.toJSONString());
//		
//        for(int i = 0; i < listMenuVO.size(); i++) {
//			System.out.println(listMenuVO.get(i).getMenu_name());
//		}
	}

}
