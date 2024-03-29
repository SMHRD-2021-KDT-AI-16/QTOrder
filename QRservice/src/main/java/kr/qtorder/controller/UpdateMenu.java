package kr.qtorder.controller;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import kr.qtorder.db.TestDAO;

@MultipartConfig
@WebServlet("/UpdateMenu")
public class UpdateMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;       
   
    public UpdateMenu() {
        super();
    }
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String menu = request.getParameter("formData");
		TestDAO dao = new TestDAO();
		System.out.println(menu);
		Gson gson = new Gson();
		Type type = new TypeToken<HashMap<String, String>>(){}.getType();
        HashMap<String, Object> menuMap = gson.fromJson(menu, type);

        // 출력하여 변환된 내용 확인
        //for (String key : menuMap.keySet()) {
        //    System.out.println(key + ": " + menuMap.get(key));
        //}
        dao.updateMenu(menuMap);
        
		//JsonElement element = gson.fromJson(menu, JsonElement.class);
		//JsonObject obj = element.getAsJsonObject();
		//System.out.println(menu);
		//List<MenuVO> listMenuVO = dao.selectMenuAll();			
		//session.setAttribute("listMenuVO", listMenuVO);				
		//JSONArray jarray = new JSONArray();		
        //System.out.println(obj);
        //response.setContentType("application/x-json; charset=utf-8");
       // response.getWriter().print(jarray.toJSONString());
		
	}

}
