package kr.qtorder.db;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

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
}
