package kr.qtorder.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.qtorder.model.FesAddListVO;
import kr.qtorder.model.FoodTruckVO;
import kr.qtorder.model.FtImgVO;

public class FoodTruckDAO {
	
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public List<FoodTruckVO> selectFoodTruck() {
		System.out.println("test2");
		SqlSession session = factory.openSession(true);
		List<FoodTruckVO> f_list = session.selectList("selectFoodTruck");
		System.out.println("f_list : "+f_list);
		System.out.println("test3");
		session.close();
		
		return f_list;
	}
	
	public List<FesAddListVO> selectAddList() {
		
		SqlSession session = factory.openSession(true);
		List<FesAddListVO> addList = session.selectList("selectAddList");
		session.close();
		
		return addList;
	}
	
	public FoodTruckVO loadInfo(FoodTruckVO vo) {
	      SqlSession session = factory.openSession(true);
	      System.out.println("test loadinfo : "+vo.getFt_idx());
	      
	      FoodTruckVO loadInfo = session.selectOne("loadInfo", vo);
	      System.out.println("test loadinfo end");
	      session.close();
	      
	      return loadInfo;
	   }
	   
	  public FtImgVO loadImg(FtImgVO vo) {
	      SqlSession session = factory.openSession(true);
	      System.out.println("test loadimg");
	      FtImgVO loadImg = session.selectOne("loadImg", vo);
	      
	      session.close();
	      
	      return loadImg;
	   }
	  
	  public int bus_numcheck(String bno) {
		  SqlSession session = factory.openSession(true);
		  
		  int yn = session.selectOne("bno_check", bno);
		  
		  session.close();
		  return yn;
	  }
		

}