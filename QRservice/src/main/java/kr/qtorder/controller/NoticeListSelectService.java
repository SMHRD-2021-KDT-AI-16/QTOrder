package kr.qtorder.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.qtorder.db.NoticeDAO;
import kr.qtorder.model.NoticeVO;

public class NoticeListSelectService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		NoticeDAO dao = new NoticeDAO();
		HttpSession session = request.getSession();
		
		List<NoticeVO> noticeList = new ArrayList<NoticeVO>();
		
		noticeList = dao.noticeSelect();
		session.setAttribute("selectNotice", noticeList);
		
		return "GonoticeList.do";
	}

}
