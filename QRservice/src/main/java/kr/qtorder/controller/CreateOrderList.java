package kr.qtorder.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;

import kr.qtorder.db.TestDAO;

@WebServlet("/CreateOrderList")
public class CreateOrderList extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public CreateOrderList() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();		
		
		TestDAO dao = new TestDAO();
		
		List<HashMap<String, Object>> orderlist = dao.selectOrderList();
		
		JSONArray jarray = new JSONArray();
		
		for(HashMap<String, Object> map : orderlist) {
			JSONObject json = new JSONObject();
			json.put("order_idx", map.get("order_idx"));
			json.put("menu_price", map.get("menu_price"));
			json.put("menu_name", map.get("menu_name"));
			json.put("ft_name", map.get("ft_name"));
			json.put("order_state", map.get("order_state"));
			json.put("menu_cnt", map.get("menu_cnt"));
			json.put("menu_img", map.get("menu_img"));
			jarray.add(json);
		}
		
		int idx = 0;
		List<HashMap<String, Object>> orderCard = new ArrayList<>();
		/*
		 * for(int i = 0; i < orderlist.size(); i++) { int order_cnt = 0; if(i == 0) {
		 * HashMap<String, Object> temp = new HashMap<String, Object>();
		 * temp.put("order_idx", orderlist.get(i).get("order_idx"));
		 * temp.put("menu_price", orderlist.get(i).get("menu_price"));
		 * temp.put("menu_name", orderlist.get(i).get("menu_name")); temp.put("ft_name",
		 * orderlist.get(i).get("ft_name")); temp.put("order_state",
		 * orderlist.get(i).get("order_state")); temp.put("menu_cnt",
		 * orderlist.get(i).get("menu_cnt")); orderCard.add(temp); } else {
		 * if(orderlist.get(i).get("order_idx") != orderlist.get(i-1).get("order_idx"))
		 * { HashMap<String, Object> temp = new HashMap<String, Object>();
		 * temp.put("order_idx", orderlist.get(i).get("order_idx"));
		 * temp.put("menu_price", orderlist.get(i).get("menu_price"));
		 * temp.put("menu_name", orderlist.get(i).get("menu_name")); temp.put("ft_name",
		 * orderlist.get(i).get("ft_name")); temp.put("order_state",
		 * orderlist.get(i).get("order_state")); temp.put("menu_cnt",
		 * orderlist.get(i).get("menu_cnt")); temp.put("order_cnt", order_cnt);
		 * orderCard.add(temp); } else { order_cnt++; }
		 * 
		 * } }
		 */
		
		HashMap<String, Object> currentOrder = null;
		int order_cnt = 0; // 현재 주문의 항목 수를 저장할 변수

		for (int i = 0; i < orderlist.size(); i++) {
		    // 현재 주문 항목
		    HashMap<String, Object> item = orderlist.get(i);

		    // 첫 번째 항목이거나 새로운 주문이 시작될 경우
		    if (i == 0 || !item.get("order_idx").equals(currentOrder.get("order_idx"))) {
		        // 이전 주문이 있다면, order_cnt를 최종 업데이트
		        if (currentOrder != null) {
		            currentOrder.put("order_cnt", order_cnt);
		        }
		        
		        // 새로운 주문 정보를 저장하고, order_cnt를 초기화
		        currentOrder = new HashMap<>();
		        for (String key : item.keySet()) {
		            currentOrder.put(key, item.get(key));
		        }
		        orderCard.add(currentOrder); // 새로운 주문 정보를 orderCard에 추가
		        order_cnt = 1; // 현재 주문의 첫 번째 항목으로 카운트 시작
		    } else {
		        // 현재 주문의 항목 수 증가
		        order_cnt++;
		    }
		}

		// 마지막 주문에 대한 order_cnt 업데이트
		if (currentOrder != null) {
		    currentOrder.put("order_cnt", order_cnt);
		}

		System.out.println(orderCard);
		// 결과 출력
		for (int i = 0; i < orderCard.size(); i++) {
		    //System.out.println("외 " + orderCard.get(i).get("order_cnt") + "건");
		}
		
		List<Integer> temp = new ArrayList<>();
    	for(int i = 0; i < orderlist.size(); i++) {
    		temp.add(Integer.parseInt((orderlist.get(i)).get("order_idx").toString()));
    	}
    	
    	Set<Integer> set = new HashSet<Integer>(temp);
    	List<Integer> newList = new ArrayList<Integer>(set);
    	
    	Gson gson = new Gson();         // Student 객체 -> Json 문자열        
		String jsonStr = gson.toJson(orderCard);         // Json 문자열 출력        
		
		System.out.println(jsonStr); 		
		
    	session.setAttribute("newList", newList);	
    	session.setAttribute("orderlist", orderlist);	
		session.setAttribute("orderCard", orderCard);
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jsonStr);
		//response.getWriter().print(jarray.toJSONString());
	}

}
