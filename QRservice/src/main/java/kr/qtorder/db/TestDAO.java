package kr.qtorder.db;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.google.gson.JsonObject;

import kr.qtorder.model.MenuVO;

public class TestDAO {
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public int test() {
		SqlSession sqlSession = factory.openSession(true);
		System.out.println("test2");
		int row = sqlSession.insert("join");
		System.out.println("test3");
		sqlSession.close();
		return row;
	}
	
	public int addMenuGroup(String group_name) {
		SqlSession sqlSession = factory.openSession(true);
		int row = sqlSession.insert("addMenuGroup", group_name);
		sqlSession.close();
		return row;
	}
	
	public MenuVO selectMenu() {
		SqlSession sqlsession = factory.openSession(true);
		MenuVO result = sqlsession.selectOne("selectMenu");
		sqlsession.close();
		return result;		
	}
	
	public List<MenuVO> selectMenuAll() {
		SqlSession sqlsession = factory.openSession(true);
		List<MenuVO> result = sqlsession.selectList("selectMenuAll");
		sqlsession.close();
		return result;		
	}
	
	public int addMainMenu(String menu_name) {
		SqlSession sqlsession = factory.openSession(true);
		int result = sqlsession.update("addMainMenu", menu_name);
		sqlsession.close();
		return result;		
	}
	
	public int addMenu(HashMap<String, Object> map) {
		SqlSession sqlsession = factory.openSession(true);
		int result = sqlsession.update("addMenu", map);
		sqlsession.close();
		return result;		
	}
	
	public int deleteMainMenu(String menu_name) {
		SqlSession sqlsession = factory.openSession(true);
		int result = sqlsession.update("deleteMainMenu", menu_name);
		sqlsession.close();
		return result;		
	}
	
	public List<HashMap<String, Object>> selectOrderList() {
		SqlSession sqlsession = factory.openSession(true);		
		//List<HashMap<String, Object>> list = (List) sqlsession.selectList("selectOrderList");
		List<HashMap<String, Object>> list = sqlsession.selectList("selectOrderList");
		sqlsession.close();
		return list;	
	}
	
	public List<HashMap<String, Object>> getMenuGroup() {
		SqlSession sqlsession = factory.openSession(true);		
		//List<HashMap<String, Object>> list = (List) sqlsession.selectList("getMenuGroup");
		List<HashMap<String, Object>> list = sqlsession.selectList("getMenuGroup");
		sqlsession.close();
		return list;	
	}
	
	public List<HashMap<String, Object>> selectMenuGroup() {
		SqlSession sqlsession = factory.openSession(true);		
		//List<HashMap<String, Object>> list = (List) sqlsession.selectList("selectMenuGroup");
		List<HashMap<String, Object>> list = sqlsession.selectList("selectMenuGroup");
		sqlsession.close();
		return list;	
	}

	public int saveMenuGroup(Map<String, Object> map) {
		SqlSession sqlsession = factory.openSession(true);		
		int result = sqlsession.insert("saveMenuGroup", map);
		sqlsession.close();
		return result;
	}
	public int resetMenuGroup() {
		SqlSession sqlSession = factory.openSession(true);
		int row = sqlSession.delete("resetMenuGroup");
		sqlSession.close();
		return row;
	}
	
	public int deleteMenu(int menu_idx) {
		SqlSession sqlSession = factory.openSession(true);
		int row = sqlSession.delete("deleteMenu", menu_idx);
		sqlSession.close();
		return row;
	}
	
	public List<HashMap<String, Object>> selectOrderMenuDetail(int order_idx) {
		SqlSession sqlsession = factory.openSession(true);		
		//List<HashMap<String, Object>> list = (List) sqlsession.selectList("selectMenuGroup");
		List<HashMap<String, Object>> list = sqlsession.selectList("selectOrderMenuDetail", order_idx);
		sqlsession.close();
		return list;	
	}
	
	public List<HashMap<String, Object>> selectMenuOptions(int menu_idx) {
		SqlSession sqlsession = factory.openSession(true);		
		List<HashMap<String, Object>> list = sqlsession.selectList("selectMenuOptions", menu_idx);
		sqlsession.close();
		return list;	
	}
	
	public int updateMenu(HashMap<String, Object> obj) {
		SqlSession sqlsession = factory.openSession(true);		
		int result = sqlsession.update("updateMenu", obj);
		sqlsession.close();
		return result;	
	}	
}
