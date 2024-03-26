package kr.qtorder.frontcontroller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.qtorder.controller.Command;
import kr.qtorder.controller.GetTest;


@WebServlet("*.do")
public class Frontcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HashMap<String, Command> map = new HashMap<>();
    
	@Override
	public void init() throws ServletException {
		
		super.init();
		
		map.put("test.do", new GetTest());
	}
	
    @Override
    	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String uri = req.getRequestURI();
		String cp = req.getContextPath();
		String path = uri.substring(cp.length() + 1);
		
		
		req.setCharacterEncoding("utf-8");

		String finalpath = null;
		Command com = null;
		
		// 3. path값이 어떤 요청이냐에 따라서 다른 기능 수행
		if (path.contains("Go")) {
			// Go + 파일이름 + .do
			finalpath = path.replaceAll("Go", "").replaceAll(".do", ".jsp");
		} else {

			com = map.get(path);
			
			//요청에 맞는 service를 실행시키겠습니다 
			finalpath = com.execute(req, resp);
		}
    }

}
