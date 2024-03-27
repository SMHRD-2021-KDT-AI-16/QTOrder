package kr.qtorder.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import kr.qtorder.db.CustomerDAO;
import kr.qtorder.model.CustomerVO;

public class CustUserService implements Command {

	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String responseData = (String) request.getAttribute("responseData");
		JSONObject jsonObject = new JSONObject(responseData);
		String access_token = jsonObject.getString("access_token");
		
		String token = access_token; // 네이버 로그인 접근 토큰;
		String header = "Bearer " + token; // Bearer 다음에 공백 추가

		String apiURL = "https://openapi.naver.com/v1/nid/me";

		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("Authorization", header);
		String responseBody = get(apiURL, requestHeaders);

		JSONObject jsonObject2 = new JSONObject(responseBody);
		
		jsonObject2 = jsonObject2.getJSONObject("response");
		
		HttpSession session = request.getSession();
		CustomerVO existingCustomer = (CustomerVO) request.getServletContext().getAttribute("customerInfo");
		
		// 현재 로그인이 안되어있다면
		if (existingCustomer == null) {
			String cust_phone = jsonObject2.getString("mobile");
			String cust_name = jsonObject2.getString("name");
			System.out.println("test1 : "+cust_phone);
			System.out.println("test2 : "+cust_name);
			CustomerVO cvo = new CustomerVO();

			cvo.setCust_name(cust_name);
			cvo.setCust_phone(cust_phone);
			System.out.println("test2");
			
			CustomerDAO cdao = new CustomerDAO();
			System.out.println("test2.5");
			CustomerVO cvo2 = cdao.usercheck(cvo);
			System.out.println("test3");
			// 회원이 아니라면 가입
			if(cvo2 == null) {
				System.out.println("test4");
				cdao.insertCust(cvo);
				request.getServletContext().setAttribute("customerInfo", cvo);
				//session.setAttribute("customerInfo", cvo);
			}
			request.getServletContext().setAttribute("customerInfo", cvo2);
			//session.setAttribute("customerInfo", cvo2);
			System.out.println("check"+cvo2.getCust_phone());
			
		}
		
		return "storelist.do";
	}
	
	private String uniToKor(String uni){
	    StringBuffer result = new StringBuffer();
	    
	    for(int i=0; i<uni.length(); i++){
	        if(uni.charAt(i) == '\\' &&  uni.charAt(i+1) == 'u'){    
	            Character c = (char)Integer.parseInt(uni.substring(i+2, i+6), 16);
	            result.append(c);
	            i+=5;
	        }else{
	            result.append(uni.charAt(i));
	        }
	    }
	    return result.toString();
	}
	

	private static String get(String apiUrl, Map<String, String> requestHeaders) {
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return readBody(con.getInputStream());
			} else { // 에러 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}

	private static HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}

	private static String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}

	

}
