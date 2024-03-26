package kr.qtorder.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.qtorder.db.FoodTruckDAO;
import kr.qtorder.model.FoodTruckVO;

public class StoreSelectService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("test");
		FoodTruckDAO dao = new FoodTruckDAO();
		HttpSession session = request.getSession();
		
		/* foodtruckList = new ArrayList<FoodTruckVO>();*/
		List<FoodTruckVO> foodtruckList = dao.selectFoodTruck();
		System.out.println("111 : "+foodtruckList);
		session.setAttribute("selectFoodTruck", foodtruckList);
		
		return "storelist.jsp";
	}
}
