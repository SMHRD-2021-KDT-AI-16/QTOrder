package kr.qtorder.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/FileUpload")
public class FileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;       
	   
    public FileUpload() {
        super();
    }
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	String path = getServletContext().getRealPath("assets/img/hotdog");
		int maxFileSize = 1024 * 1024 * 10;

        // 파일 인코딩 설정
        String encType = "UTF-8";

        // 파일 업로드를 위한 MultipartRequest 객체 생성
        MultipartRequest multi = new MultipartRequest(request, path, maxFileSize, encType, new DefaultFileRenamePolicy());

        // 파일이 정상적으로 업로드됐는지 확인을 위한 응답 메시지 설정
        response.sendRedirect("myTest4.jsp");
        
	}
	

}
