package kr.qtorder.controller;

import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CorsFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // 필요한 경우 초기화 로직을 추가할 수 있습니다.
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        httpResponse.setHeader("Access-Control-Allow-Origin", "http://127.0.0.1:8081");
        httpResponse.setHeader("Access-Control-Allow-Methods", "GET,POST,PUT,DELETE,OPTIONS");
        httpResponse.setHeader("Access-Control-Allow-Headers", "Content-Type,Authorization");
        httpResponse.setHeader("Access-Control-Allow-Credentials", "true"); // 자격 증명을 허용하는 헤더 추가
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // 필요한 경우 리소스를 해제할 수 있습니다.
    }
}
