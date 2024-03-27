package kr.qtorder.db;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.qtorder.model.CartproductVO123;

public class CartDAO123 {
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public int insertCart(String cust_phone) {
		
		SqlSession session = factory.openSession(true);
		
		int row = session.insert("insertcart", cust_phone);
		
		session.close();
		
		return row;
	}
	
	public int get_cart_num(String cust_phone) {
		SqlSession session = factory.openSession();
		
		int cart_num = session.selectOne("getCartnum", cust_phone);
		System.out.println("cnum : "+cart_num);
		session.close();
		return cart_num;
	}
	
	public int insertCartproduct(CartproductVO123 cpvo) {
		SqlSession session = factory.openSession(true);
		
		System.out.println("cart_num : "+cpvo.getCart_num());
		
		int row = session.insert("insertCartProduct",cpvo);
		session.close();
		return row;
	}
	
	public int cartCheck(String cust_phone) {
		SqlSession session = factory.openSession(true);
		int yn = session.selectOne("cartcheck", cust_phone);
		session.close();
		return yn;
		
	}
	
	public void removeCart(String cust_phone) {
		SqlSession session = factory.openSession(true);
		session.delete("delete_cart", cust_phone);
		session.close();
		
	}
	
	public void removeCart_product(int cart_num) {
		SqlSession session = factory.openSession(true);
		session.delete("delete_cartproduct", cart_num);
		session.close();
	}
	
	public void removeCartOne(int cart_product_num) {
		SqlSession session = factory.openSession(true);
		session.delete("delete_cartone", cart_product_num);
		session.close();
	}
	
	public int cart_product_check(CartproductVO123 cpvo) {
		SqlSession session = factory.openSession(true);
		int yn = session.selectOne("cart_product_check",cpvo);
		session.close();
		return yn;
	}
	
	public int update_cartproduct(CartproductVO123 cpvo) {
		SqlSession session = factory.openSession(true);
		int row = session.update("cart_update_cnt", cpvo);
		session.close();
		return row;
	}
	public int get_ft_idx(int cart_num) {
		SqlSession session = factory.openSession(true);
		int ft_idx = session.update("get_ftnum", cart_num);
		session.close();
		return ft_idx;
	}
}
