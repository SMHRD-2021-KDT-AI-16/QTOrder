package kr.qtorder.db;

import java.util.List;

import javax.servlet.RequestDispatcher;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.qtorder.model.BestMenuVO;
import kr.qtorder.model.MenuSelectVO;
import kr.qtorder.model.SetGroupVO;
import kr.qtorder.model.SetMenuVO;

public class MenuSelectDAO {
		
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public List<BestMenuVO> bestMenu(int num) {
		
		SqlSession session = factory.openSession(true);
		List<BestMenuVO> bestMenu = session.selectList("bestMenu", num);
		session.close();
		
		return bestMenu;
	}
	
	public List<SetMenuVO> selectSetMenu(int num) {
		SqlSession session = factory.openSession(true);
		List<SetMenuVO> setMenu = session.selectList("setMenu", num);
		session.close();
		
		return setMenu;
	}

	public List<MenuSelectVO> selectMenu(int num) {
		SqlSession session = factory.openSession(true);
		List<MenuSelectVO> menu = session.selectList("menuList", num);
		session.close();
		
		return menu;
	}
	
	public List<SetGroupVO> setGroup(int num) {
		SqlSession session = factory.openSession(true);
		List<SetGroupVO> setGroup = session.selectList("setGroup", num);
		session.close();
		
		return setGroup;
	}
	
	public List<BestMenuVO> allMenu(int num) {
		SqlSession session = factory.openSession(true);
		List<BestMenuVO> allMenu = session.selectList("allMenu", num);
		session.close();
		
		return allMenu;
	}
	
	
}
