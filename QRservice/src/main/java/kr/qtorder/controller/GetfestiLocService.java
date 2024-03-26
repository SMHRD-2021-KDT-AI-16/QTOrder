package kr.qtorder.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import kr.qtorder.db.FestivalDAO;
import kr.qtorder.model.Fes_locVO;

public class GetfestiLocService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int fes_idx = Integer.parseInt(request.getParameter("fes_idx"));
		
		FestivalDAO fdao = new FestivalDAO();
		
		List<Fes_locVO> flvo = fdao.getfes_AllLoc(fes_idx);
		System.out.println("flvo : "+flvo.get(0).getFes_loc_name());
		JSONArray jsonArray = new JSONArray();
	    for (Fes_locVO fesLocVO : flvo) {
	        JSONObject jsonObject = new JSONObject();
	        jsonObject.put("locationName", fesLocVO.getFes_loc_name());
	        jsonObject.put("locationLat", fesLocVO.getFes_loc_lat());
	        jsonObject.put("locationLng", fesLocVO.getFes_loc_lng());
	        jsonArray.put(jsonObject);
	    }
	    
	    // 응답 헤더 설정
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    
	    // 응답으로 JSON 데이터 보내기
	    PrintWriter out = response.getWriter();
	    out.print(jsonArray.toString());
	    out.flush();
		
		return null;
	}

}
