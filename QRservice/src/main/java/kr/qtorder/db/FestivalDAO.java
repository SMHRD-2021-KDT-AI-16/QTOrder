package kr.qtorder.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.qtorder.model.FesVO;
import kr.qtorder.model.Fes_locVO;
import kr.qtorder.model.Fes_user_viewVO;
import kr.qtorder.model.FestivalVO;
import kr.qtorder.model.Festival_infoVo;

public class FestivalDAO {
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public List<FestivalVO> selectFestival() {
	      
		SqlSession session = factory.openSession();
		
	    List<FestivalVO> fes_list = session.selectList("selectFestival");
	    session.close();
	      
	    return fes_list;
	}
	
	public int insertFestival(Festival_infoVo fvo) {
		SqlSession session = factory.openSession(true);
		
		int row = session.insert("insert_festival",fvo);
		
		session.close();
		return row;
	}
	
	public String Festival_loc(String fes_name){
		SqlSession session = factory.openSession();
		//System.out.println("dao test : "+fes_name);
		String loc_idx = session.selectOne("get_fes_idx");
		//System.out.println("loc_idx : "+loc_idx);
		session.close();
		return loc_idx;
	}

	public int insertFes_loc(Fes_locVO flvo) {
		SqlSession session = factory.openSession(true);
		
		int row = session.insert("insert_fes_loc", flvo);
		session.close();
		return row;
	}
	
	public List<Festival_infoVo> getFes_List(String admin_id){
		SqlSession session = factory.openSession(true);
		
		List<Festival_infoVo> list = session.selectList("get_fes_list", admin_id);
		
		session.close();
		
		return list;
	}
	
	public FesVO getfes(int fes_idx) {
		SqlSession session = factory.openSession(true);
		System.out.println("fes_idx2 : "+fes_idx);
		FesVO fvo = session.selectOne("get_fes", fes_idx);
		//System.out.println(fvo.getFes_name());
		session.close();
		
		return fvo;
	}
	
	public FestivalVO getFesDate(int fes_idx) {
		SqlSession session = factory.openSession(true);
		FestivalVO fvo = session.selectOne("getFesDate", fes_idx);
		session.close();
		return fvo;
		
	}
	
	public List<Fes_locVO> getfes_AllLoc(int fes_idx) {
		SqlSession session = factory.openSession(true);
		List<Fes_locVO> flvo = session.selectList("select_fes_loc", fes_idx);
		session.close();
		return flvo;
	}
	
	public List<Fes_user_viewVO> get_user_loc_view(int fes_idx){
		SqlSession session = factory.openSession(true);
		List<Fes_user_viewVO> fuvo = session.selectList("user_view", fes_idx);
		session.close();
		return fuvo;
	}
}
