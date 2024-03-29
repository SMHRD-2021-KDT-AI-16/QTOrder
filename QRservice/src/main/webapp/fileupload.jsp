<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.* , java.util.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>

<%
	String path = request.getRealPath("assets\\img\\hotdog\\main");
	out.println("절대 경로 : " + path + "<br/>");
	int size = 1024 * 1024 * 10;
	String fileName = "";
	String originalFileName = "";
	try {
		MultipartRequest multi = new MultipartRequest(request, path, size, "EUC-KR", new DefaultFileRenamePolicy());
		Enumeration files = multi.getFileNames();
		String str = (String)files.nextElement();
		fileName = multi.getFilesystemName(str);
		originalFileName = multi.getOriginalFileName(str);		
	} catch(Exception e) {
		e.printStackTrace();
	}
	response.sendRedirect("myTest.jsp");
%>

