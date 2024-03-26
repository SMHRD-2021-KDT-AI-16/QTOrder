package kr.qtorder.controller;

import java.io.IOException;
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

@WebServlet("/UpdateFoodTruckMenu")
public class UpdateFoodTruckMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public UpdateFoodTruckMenu() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		MenuVO menuvo = new MenuVO();
		
		TestDAO dao = new TestDAO();
		
		List<MenuVO> listMenuVO = dao.selectMenuAll();		
		
		session.setAttribute("listMenuVO", listMenuVO);				
		JSONArray jarray = new JSONArray();
		//System.out.println(listMenuVO.get(0).getMenu_name());
		
		for(MenuVO vo : listMenuVO) {
			JSONObject json = new JSONObject();
			json.put("menu_idx", vo.getMenu_idx());
			json.put("ft_idx", vo.getFt_idx());
			json.put("menu_name", vo.getMenu_name());
			json.put("menu_price", vo.getMenu_price());
			json.put("menu_img", vo.getMenu_img());
			json.put("menu_status", vo.getMenu_status());
			json.put("menu_category", vo.getMenu_category());
			json.put("menu_waiting_time", vo.getMenu_waiting_time());
			json.put("menu_main", vo.getMenu_main());
			//json.put("menu_group", vo.getMenu_waiting_time());
			
			jarray.add(json);			
		}	
        
        response.setContentType("application/x-json; charset=utf-8");
        response.getWriter().print(jarray.toJSONString());
		for(int i = 0; i < listMenuVO.size(); i++) {
			System.out.println(listMenuVO.get(i).getMenu_name());
		}
		
	}

}
