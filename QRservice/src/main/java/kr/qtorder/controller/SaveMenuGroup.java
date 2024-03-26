package kr.qtorder.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import kr.qtorder.db.TestDAO;
import kr.qtorder.model.MenuVO;

@WebServlet("/SaveMenuGroup")
public class SaveMenuGroup extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public SaveMenuGroup() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
			
		TestDAO dao = new TestDAO();
		String jsonInfo = request.getParameter("allSets");
		dao.resetMenuGroup();
		
		try {
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonInfo);
			Iterator<String> keys = jsonObject.keySet().iterator();
			
			for(int i = 0; i < jsonObject.size(); i++) {
				String key = keys.next();
				//System.out.println(key);
				List<String> temp = (List<String>)jsonObject.get(key);
				for(int j = 0; j < temp.size(); j++) {
					//System.out.println(temp.get(j));
					Map<String,Object> map = new HashMap<String,Object>();
					map.put("groupName", key);
					map.put("menuIdx", temp.get(j));
					System.out.println(key + " : " + temp.get(j));
					int row = dao.saveMenuGroup(map);
					if(row > 0) System.out.println("성공");
					else System.out.println("실패");
				}
			}
		} catch(Exception e) { e.printStackTrace(); }
		
	}

}
