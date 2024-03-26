package kr.qtorder.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.qtorder.db.FestivalDAO;
import kr.qtorder.model.AdminVO123;
import kr.qtorder.model.Fes_locVO;
import kr.qtorder.model.Festival_infoVo;

public class AddFestivalService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//HttpSession session = request.getSession();

		AdminVO123 admin = (AdminVO123) request.getServletContext().getAttribute("admin");
		String admin_id = admin.getAdmin_id();
		//String admin_id = "admin";
		String fes_name = request.getParameter("fes_name");
		String fes_start = request.getParameter("fes_start");
		String fes_end = request.getParameter("fes_end");

		
		System.out.println("fes_name: " + fes_name);
		System.out.println("fes_start: " + fes_start);
		System.out.println("fes_end: " + fes_end);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		FestivalDAO fdao = new FestivalDAO();
		Date fesStart;
		Date fesEnd;
		
		try {
			fesStart = dateFormat.parse(fes_start);
			fesEnd = dateFormat.parse(fes_end);
			
			System.out.println("fes_start2: " + fesStart);
			System.out.println("fes_end2: " + fesEnd);
			
			Festival_infoVo fiv = new Festival_infoVo();
			fiv.setAdmin_id(admin_id);
			fiv.setFes_name(fes_name);
			fiv.setFes_start(fesStart);
			fiv.setFes_end(fesEnd);
			int row = fdao.insertFestival(fiv); // 축제 정보를 등록하고
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
		
		int fes_loc_num = Integer.parseInt(request.getParameter("radioPrivacy"));
		System.out.println("num : "+fes_loc_num );
		
		if(fes_loc_num != 0) { // 만약 구역설정을 했다면
			
			// 축제식별자를 가져와야함
			int fes_idx = Integer.parseInt(fdao.Festival_loc(fes_name));
			System.out.println("test : "+fes_idx);
			// 그 축제 식별자에 부스 위치 넣기
			for(int i = 1; i <= fes_loc_num; i++) {
				
				String fes_loc_name = request.getParameter("fes_loc_name"+i);
				System.out.println("fes_loc_name : "+fes_loc_name);
				
				double fes_loc_lat = Double.parseDouble(request.getParameter("loc_lat"+i));
				System.out.println("fes_loc_lat : "+fes_loc_lat);
				
				double fes_loc_lng = Double.parseDouble(request.getParameter("loc_lng"+i));
				System.out.println("fes_loc_lng : "+fes_loc_lng);
				
				
				Fes_locVO flvo = new Fes_locVO(fes_idx, fes_loc_name, fes_loc_lat, fes_loc_lng);
				
				int f_row = fdao.insertFes_loc(flvo);
				
			}
		}
		
		return null;
	}
	
}
