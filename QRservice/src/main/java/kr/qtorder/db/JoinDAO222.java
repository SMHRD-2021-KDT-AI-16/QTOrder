package kr.qtorder.db;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.qtorder.model.BusinessVO;

public class JoinDAO222 {
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public int businessInsert(BusinessVO bvo) {
		SqlSession session = factory.openSession(true);
		
		int row = session.insert("insert_business2", bvo);
		session.close();
		
		return row;
	}
	
	public BusinessVO selectLogin(BusinessVO bvo) {
		SqlSession session = factory.openSession();
		System.out.println("test2 : "+bvo.getFt_bno());
		BusinessVO bvo2  = session.selectOne("login_check", bvo);
		session.close();
		
		return bvo2;
	}
}
