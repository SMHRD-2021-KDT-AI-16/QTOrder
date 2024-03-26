package kr.qtorder.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.qtorder.model.FoodCartVO123;
import kr.qtorder.model.Menu_DetailVO;

public class MenuDetail123DAO {
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public List<Menu_DetailVO> getmenudetail(int menu_idx) {
		
		SqlSession session = factory.openSession();
		
		List<Menu_DetailVO> list = session.selectList("getmenudetail", menu_idx);
		
		session.close();
		
		return list;
	}
	
	public List<FoodCartVO123> getCart(String cust_phone){
		
		SqlSession session = factory.openSession();
		
		List<FoodCartVO123> list = session.selectList("getCart", cust_phone);
		
		session.close();
		
		return list;
	}
}
