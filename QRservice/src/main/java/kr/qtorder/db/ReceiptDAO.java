package kr.qtorder.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.qtorder.model.ReceiptVO;

public class ReceiptDAO {
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public List<ReceiptVO> getreceipt(String cust_phone) {
		SqlSession session = factory.openSession();
		
		List<ReceiptVO> list = session.selectList("getReceipt", cust_phone);
		
		session.close();
		
		return list;
	}
	
	public List<ReceiptVO> getreceiptdetail(ReceiptVO rvo) {
		SqlSession session = factory.openSession();
		
		List<ReceiptVO> list = session.selectList("getReceiptDetail", rvo);
		
		session.close();
		return list;
	}
}
