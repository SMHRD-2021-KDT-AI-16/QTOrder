package kr.qtorder.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.qtorder.db.NoticeDAO;
import kr.qtorder.model.NoticeVO;

public class NoticeDeleteService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		NoticeVO vo = new NoticeVO();
		vo.setNotice_idx(num);
		
		NoticeDAO dao = new NoticeDAO();
		int row = dao.noticeDelete(vo);
		
		return "noticeList.do";
	}

}
