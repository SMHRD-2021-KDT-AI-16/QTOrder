package kr.qtorder.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.mysql.cj.protocol.x.Notice;

import kr.qtorder.model.NoticeVO;

public class NoticeDAO {
	
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public List<NoticeVO> noticeSelect() {
		
		SqlSession session = factory.openSession(true);
		
		List<NoticeVO> noticeList = session.selectList("selectNotice");
		
		session.close();
		
		return noticeList;
	}
	
	public int noticeCreate(NoticeVO vo) {
		
		SqlSession session = factory.openSession(true);
		
		int row = session.insert("noticeCreate", vo);
		
		session.close();
		
		return row;
		
	}
	
	public NoticeVO noticeDetail(int num) {
		
		NoticeVO notice = null;
		
		SqlSession session = factory.openSession();
		
		notice = session.selectOne("noticeDetail", num);
			
		session.close();
		
		return notice;
	}
	
	public int noticeEdit(NoticeVO vo) {
		
		SqlSession session = factory.openSession(true);
		
		int row = session.update("noticeEdit", vo);
		
		session.close();
		
		return row;
	}
	
	public int noticeDelete(NoticeVO vo) {
		SqlSession session = factory.openSession(true);
		
		int row = session.delete("noticeDelete", vo);
		
		session.close();
		
		return row;
	}

}
