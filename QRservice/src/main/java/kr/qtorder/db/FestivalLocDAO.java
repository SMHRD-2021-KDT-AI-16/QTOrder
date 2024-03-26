package kr.qtorder.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.qtorder.model.FestivalLocVO;

public class FestivalLocDAO {
private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public List<FestivalLocVO> selectFesLoc() {
		
		SqlSession session = factory.openSession(true);
		List<FestivalLocVO> booth_list = session.selectList("selectFestivalLoc");
		session.close();
		
		return booth_list;
	}
}
