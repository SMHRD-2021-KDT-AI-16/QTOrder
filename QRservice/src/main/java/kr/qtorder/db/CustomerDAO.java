package kr.qtorder.db;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.qtorder.model.CustomerVO;

public class CustomerDAO {
	
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public int insertCust(CustomerVO cvo) {
		SqlSession session = factory.openSession(true);
		System.out.println("test : "+cvo);
		int row = session.insert("insert_customer",cvo);
		
		session.close();
		return row;
	}
	
	public CustomerVO usercheck(CustomerVO cvo) {
		System.out.println("test_c_1");
		SqlSession session = factory.openSession();
		
		CustomerVO cvo2 = session.selectOne("customer_check",cvo);
		
		session.close();
		return cvo2;
	}
}
