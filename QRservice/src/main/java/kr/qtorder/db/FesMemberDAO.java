package kr.qtorder.db;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.qtorder.model.FesMemberVO;

public class FesMemberDAO {
	
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public int join(FesMemberVO vo) {
		
		SqlSession session = factory.openSession(true);
		
		int row = session.insert("fes_join", vo);
		
		session.close();
		
		return row;
	}
	
	public boolean IdCheck(String admin_id) {
		boolean checkI = false;
		SqlSession sqlSession = factory.openSession(true);
		try {
			checkI = sqlSession.selectOne("idCheck", admin_id);
		} catch (Exception e) {
		} finally {
			sqlSession.close();
		}
		return checkI;
	}
	
	public FesMemberVO login(FesMemberVO vo) {
		
		SqlSession session = factory.openSession(true);
		
		System.out.println("login id = " + vo.getAdmin_id());
		System.out.println("login pw = " + vo.getAdmin_pw());
		FesMemberVO login = session.selectOne("login", vo);
		
		session.close();
		
		return login;
	}

}
