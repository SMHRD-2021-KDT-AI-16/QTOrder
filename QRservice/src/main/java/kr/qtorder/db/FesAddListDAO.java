package kr.qtorder.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.qtorder.model.FesAddListVO;


public class FesAddListDAO {
	
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public int insertList(FesAddListVO vo) {
		
		SqlSession session = factory.openSession(true);
		
		int row = session.insert("insertList", vo);
		
		session.close();
		
		return row;
	}
	
	public List<FesAddListVO> selectAddList() {
		
		SqlSession session = factory.openSession(true);
		List<FesAddListVO> addList = session.selectList("selectAddList");
		session.close();
		
		return addList;
	}
	
	public int deleteList(FesAddListVO vo) {
		SqlSession session = factory.openSession(true);
		
		int row = session.delete("deleteList", vo);
		
		session.close();
		
		return row;
	}

}
