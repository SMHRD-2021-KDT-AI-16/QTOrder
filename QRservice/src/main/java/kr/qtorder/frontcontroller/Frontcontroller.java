package kr.qtorder.frontcontroller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.qtorder.controller.AddFestivalService;
import kr.qtorder.controller.Bus_check2Service;
import kr.qtorder.controller.ChangeOrderStatus2Service;
import kr.qtorder.controller.ChangeOrderStatusService;
import kr.qtorder.controller.Command;
import kr.qtorder.controller.CustUserService;
import kr.qtorder.controller.FesAddListDeleteService;
import kr.qtorder.controller.FesAddListService;
import kr.qtorder.controller.FesAdminidCheckService;
import kr.qtorder.controller.FesLoginService;
import kr.qtorder.controller.FesMemberJoinService;
import kr.qtorder.controller.FestivalInfoService;
import kr.qtorder.controller.Foodtruck_joinService;
import kr.qtorder.controller.Foodtruck_loginService;
import kr.qtorder.controller.GetBasketService;
import kr.qtorder.controller.GetFesListService;
import kr.qtorder.controller.GetMenuDetailService;
import kr.qtorder.controller.GetPriceService;
import kr.qtorder.controller.GetReceiptDetailService;
import kr.qtorder.controller.GetfesDateService;
import kr.qtorder.controller.GetfesQRService;
import kr.qtorder.controller.GetfestiLocService;
import kr.qtorder.controller.GetuserfesLocService;
import kr.qtorder.controller.InsertCartFoodService;
import kr.qtorder.controller.InsertOrderService;
import kr.qtorder.controller.MenuSelectService;
import kr.qtorder.controller.NoticeCreateService;
import kr.qtorder.controller.NoticeDeleteService;
import kr.qtorder.controller.NoticeEditService;
import kr.qtorder.controller.NoticeListSelectService;
import kr.qtorder.controller.ReceiptCheckService;
import kr.qtorder.controller.SMSService;
import kr.qtorder.controller.StoreSelectService;
import kr.qtorder.controller.getFesNameService;


@WebServlet("*.do")
public class Frontcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HashMap<String, Command> map = new HashMap<>();
    
	@Override
	public void init() throws ServletException {
		
		super.init();
		
		map.put("storelist.do", new StoreSelectService());
		map.put("fesAdminPage.do", new FestivalInfoService());
		map.put("fesAdminJoin.do", new FesMemberJoinService());
		map.put("IdCheck.do", new FesAdminidCheckService());
		map.put("fesAdminLogin.do", new FesLoginService());
		map.put("noticeList.do", new NoticeListSelectService());
		map.put("noticeCreate.do", new NoticeCreateService());
		map.put("noticeEdit.do", new NoticeEditService());
		map.put("noticeDelete.do", new NoticeDeleteService());
		map.put("addList.do", new FesAddListService());
		map.put("deleteList.do", new FesAddListDeleteService());
		map.put("fd_join.do", new Foodtruck_joinService());
		map.put("fd_login.do", new Foodtruck_loginService());
		map.put("fes.do", new AddFestivalService());
		map.put("getFes_List.do", new GetFesListService());
		map.put("custuser.do", new CustUserService());
		map.put("cus_choice_menu.do", new MenuSelectService());
		map.put("user_viewMap.do", new GetuserfesLocService());
		map.put("bus_check2.do", new Bus_check2Service());
		map.put("getfesti_loc.do", new GetfestiLocService());
		map.put("getfesdate.do", new GetfesDateService());
		map.put("postmsg.do", new SMSService());
		map.put("getfes_name.do", new getFesNameService());
		map.put("insertOrder.do", new InsertOrderService());
		map.put("moveQR.do", new GetfesQRService());
		map.put("getbasket.do", new GetBasketService());
		map.put("getprice.do", new GetPriceService());
		map.put("getmenudetail.do", new GetMenuDetailService());
		
		//영수증 관련
		map.put("getreceipt.do", new ReceiptCheckService());
		map.put("getreceiptdetail.do", new GetReceiptDetailService());
		
		// 카트(장바구니 관련)
		map.put("insertCart.do", new InsertCartFoodService());
		
		// 주문 관련
		map.put("changeOrderStatus.do", new ChangeOrderStatusService());
		map.put("changeOrderStatus2.do", new ChangeOrderStatus2Service());
	}
	
    @Override
    	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String uri = req.getRequestURI();
		String cp = req.getContextPath();
		String path = uri.substring(cp.length() + 1);
		
		
		Command com;
		String finalPath;
		req.setCharacterEncoding("utf-8");
		if (path.contains("Go")) {

			finalPath = path.replaceAll("Go", "").replaceAll(".do", ".jsp");
		} else {

			com = map.get(path);

			System.out.println("com : "+com);
			finalPath = com.execute(req, resp);
		}
		
		
		if (finalPath != null) {
			if(finalPath.contains("redirect:/")) {
				resp.sendRedirect(finalPath.replaceAll("redirect:/", ""));
				System.out.println("finalPath1 : "+finalPath);
				
			}else {
				System.out.println("finalPath2 : "+finalPath);
				RequestDispatcher rd = req.getRequestDispatcher(finalPath);
				rd.forward(req, resp);
			} 
		
		}
	}	
}
