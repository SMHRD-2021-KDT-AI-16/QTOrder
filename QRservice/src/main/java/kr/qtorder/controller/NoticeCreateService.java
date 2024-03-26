package kr.qtorder.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.qtorder.db.NoticeDAO;
import kr.qtorder.model.NoticeVO;



public class NoticeCreateService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String postTitle = request.getParameter("postTitleInput");
		String postContent = request.getParameter("postContent");
		String postFile = request.getParameter("postFile");
		int login_idx = Integer.parseInt(request.getParameter("ft_dix"));
		
		NoticeVO vo = new NoticeVO();
		vo.setNotice_title(postTitle);
		vo.setNotice_content(postContent);
		vo.setNotice_file(postFile);
		vo.setFt_idx(login_idx);;
		
		NoticeDAO dao = new NoticeDAO();
		
		int row = dao.noticeCreate(vo);
		
		if(row>0) {
			return "noticeList.do";
		} else {
			return "GonoticeCreate.do";
		}
		
		
	}

}
