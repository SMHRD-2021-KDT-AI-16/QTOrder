package kr.qtorder.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.qtorder.db.TestDAO;
import kr.qtorder.model.MenuVO;

@WebServlet("/GetMenuGroup")
public class GetMenuGroup extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public GetMenuGroup() {
        super();
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		TestDAO dao = new TestDAO();
		
		List<HashMap<String, Object>> menuGroup = dao.getMenuGroup();		
		List<HashMap<String, Object>> selectMenuGroup = dao.selectMenuGroup();
		
		session.setAttribute("menuGroup", menuGroup);				
		
		JSONArray jarray = new JSONArray();
		
		for(HashMap<String, Object> map : menuGroup) {
			JSONObject json = new JSONObject();
			json.put("group_idx", map.get("group_idx"));
			json.put("ft_idx", map.get("ft_idx"));
			json.put("group_name", map.get("group_name"));
			json.put("menu_idx", map.get("menu_idx"));
			json.put("menu_name", map.get("menu_name"));
			jarray.add(json);			
		}	
		jarray.add(selectMenuGroup);
        
        response.setContentType("application/x-json; charset=utf-8");
        response.getWriter().print(jarray.toJSONString());
	}

}
