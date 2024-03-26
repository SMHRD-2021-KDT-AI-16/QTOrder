package kr.qtorder.db;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.qtorder.model.OrderVO123;
import kr.qtorder.model.Order_menuVO;

public class OrderDAO {
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public int insertOrder(OrderVO123 ovo) {
		SqlSession session = factory.openSession(true);
		
		int row = session.insert("insert_order",ovo);
		
		session.close();
		return row;
	}
	
	public int getOrderNum(OrderVO123 ovo) {
		SqlSession session = factory.openSession();
		
		int order_num = session.selectOne("getordernum", ovo);
		
		session.close();
		return order_num;
	}
	
	public void insertOrder_detail(Order_menuVO omvo) {
		SqlSession session = factory.openSession(true);
		System.out.println("empty");
		int row = session.insert("insert_order_detail", omvo);
		System.out.println("row : "+row);
		session.close();
	}
}
