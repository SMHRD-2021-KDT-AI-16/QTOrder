package kr.qtorder.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.qtorder.db.FoodTruckDAO;
import kr.qtorder.db.MenuSelectDAO;
import kr.qtorder.model.BestMenuVO;
import kr.qtorder.model.FoodTruckVO;
import kr.qtorder.model.FtImgVO;
import kr.qtorder.model.SetGroupVO;
import kr.qtorder.model.SetMenuVO;

public class MenuSelectService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		HttpSession session = request.getSession();

		FoodTruckDAO dao = new FoodTruckDAO();
		FoodTruckVO info = new FoodTruckVO();
		
		info.setFt_idx(num);
		info = dao.loadInfo(info);
		session.setAttribute("loadInfo", info);
		System.out.println("test loadinfo service");
		
		FoodTruckDAO idao = new FoodTruckDAO();
		FtImgVO imgvo = new FtImgVO();
		imgvo.setFt_idx(num);
		imgvo = idao.loadImg(imgvo);
		session.setAttribute("loadImg", imgvo);
		System.out.println("test loadimg service");
		
		
		MenuSelectDAO bdao = new MenuSelectDAO();
		List<BestMenuVO> bestList = new ArrayList<BestMenuVO>(); 
		bestList = bdao.bestMenu(num);
		session.setAttribute("bestMenu", bestList);
		
		
		MenuSelectDAO sdao = new MenuSelectDAO();
		List<SetMenuVO> setList = new ArrayList<SetMenuVO>();
		setList = sdao.selectSetMenu(num);
		session.setAttribute("setMenu", setList);
		
		
		MenuSelectDAO gdao = new MenuSelectDAO();
		List<SetGroupVO> setGroup = new ArrayList<SetGroupVO>();
		setGroup = gdao.setGroup(num);
		session.setAttribute("setGroup", setGroup);
		
		
		MenuSelectDAO adao = new MenuSelectDAO();
		List<BestMenuVO> allMenu = new ArrayList<BestMenuVO>();
		allMenu = adao.allMenu(num);
		session.setAttribute("allMenu", allMenu);
		

		return "Gocus_choice_menu.do";
	}

}
