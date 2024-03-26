package kr.qtorder.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.qtorder.db.FesAddListDAO;
import kr.qtorder.db.FestivalDAO;
import kr.qtorder.db.FestivalLocDAO;
import kr.qtorder.db.FoodTruckDAO;
import kr.qtorder.model.FesAddListVO;
import kr.qtorder.model.FestivalLocVO;
import kr.qtorder.model.FestivalVO;
import kr.qtorder.model.FoodTruckVO;

public class FestivalInfoService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		// 페스티벌 축제명, 축제기간
		FestivalDAO dao = new FestivalDAO();
		List<FestivalVO> fesinfo = new ArrayList<FestivalVO>();
		
		fesinfo = dao.selectFestival();
		session.setAttribute("selectFestival", fesinfo);
		
		
		// 푸드트럭 모든 리스트
		FoodTruckDAO ftdao = new FoodTruckDAO();
		List<FoodTruckVO> foodtruckList = new ArrayList<FoodTruckVO>();
		
		foodtruckList = ftdao.selectFoodTruck();
		session.setAttribute("selectFoodTruck", foodtruckList);
		
		// 부스 위치
		FestivalLocDAO locdao = new FestivalLocDAO();
		List<FestivalLocVO> fes_loc_List = new ArrayList<FestivalLocVO>();
		
		fes_loc_List = locdao.selectFesLoc();
		session.setAttribute("selectFestivalLoc", fes_loc_List);
		
		// 등록한 업체
		FesAddListDAO listdao = new FesAddListDAO();
		List<FesAddListVO> addList = new ArrayList<FesAddListVO>();
		
		addList = listdao.selectAddList();
		session.setAttribute("selectAddList", addList);
		
		return "GofesAdminPage.do";
	}
	
	

}
