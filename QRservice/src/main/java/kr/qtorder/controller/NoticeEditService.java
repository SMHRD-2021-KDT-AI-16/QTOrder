package kr.qtorder.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.qtorder.db.NoticeDAO;
import kr.qtorder.model.NoticeVO;

public class NoticeEditService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int notice_idx = Integer.parseInt(request.getParameter("notice_idx"));
		String title = request.getParameter("noticeTitleEdit");
		String content = request.getParameter("noticeContentEdit");
		
		NoticeVO vo = new NoticeVO();
		vo.setNotice_idx(notice_idx);
		vo.setNotice_title(title);
		vo.setNotice_content(content);
		
		NoticeDAO dao = new NoticeDAO();
		int row = dao.noticeEdit(vo);
		
		if(row>0) {
			return "noticeList.do";
		} else {
			return null;
		}
		
	}

}
