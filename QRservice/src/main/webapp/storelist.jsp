<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="kr.qtorder.controller.CustUserService" %>
<%@ page import="kr.qtorder.model.CustomerVO" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>QTOrder</title>
<link href="css/styles.css" rel="stylesheet" />
<link href="css/yg.css" rel="stylesheet" />
<link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
<script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
 <style>
    .bg-color {
      background-color: #FA823C;
      border-color: #FA823C;
    }

    .text-col {
      color: black !important;
    }

        	#empty{
        		width: 100%;
        		height: 5%;
        	}
        </style>


</head>
<body style="background-color: #FA823C">
<div id="qtlayer-up" class="qtlayer-up" style="display: flex; justify-content: center; align-items: center;">
    <div style="text-align: center;">
    <div style="display: inline-block;">
        <a class="btn" href="storelist.do"><i data-feather="shopping-bag" style="font-size: 24px;"></i>상점</a>
    </div>
    <div class="separator"></div>
    <div style="display: inline-block;">
        <a class="btn" href="user_viewMap.do"><i data-feather="map-pin" style="font-size: 24px;"></i>지도</a>
    </div>
    <div class="separator"></div>
    <div style="display: inline-block;" class="dropdown">
    <button id="dropdownMenuButton" class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" type="button"><i data-feather="file-text" style="font-size: 24px;"></i>주문</button>
    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    	<a class="dropdown-item" href=".do">주문현황</a>
        <a class="dropdown-item" href="getreceipt.do">영수증</a>
        </div>
    </div>
	</div>
</div>

<div id="empty"></div>
<%
HttpSession session3 = request.getSession();

// 세션에 저장된 customerInfo 속성값 가져오기
CustomerVO cvo2 = (CustomerVO) session3.getAttribute("customerInfo");

// 이미 인증된 사용자인지 확인하여 중복 실행 방지
if (cvo2 == null) {
	//CustUserService userService = new CustUserService();
    String clientId = "LbSKpthI2uLCgKvmUEpp"; //애플리케이션 클라이언트 아이디값;
    String clientSecret = "AUeJIaTAqP"; //애플리케이션 클라이언트 시크릿값;
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://localhost:8081/QRservice/storelist.jsp", "UTF-8");
    String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + clientId;
    apiURL += "&client_secret=" + clientSecret;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;
    String access_token = "";
    String refresh_token = "";
    System.out.println("apiURL="+apiURL);
    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
      System.out.print("responseCode="+responseCode);
      if(responseCode==200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      String inputLine;
      StringBuffer res = new StringBuffer();
      while ((inputLine = br.readLine()) != null) {
        res.append(inputLine);
      }
      br.close();
      if(responseCode==200) {
        //out.println(res.toString());
        
        request.setAttribute("responseData", res.toString());
        RequestDispatcher dispatcher = request.getRequestDispatcher("custuser.do");
        dispatcher.forward(request, response);
      }
    } catch (Exception e) {
      System.out.println(e);
    }
}
    
  %>
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main class="bg-color">
                    <div class="container-xl px-4">
                        <div class="row justify-content-center">
                            
                            <div class="col-xl-5 col-lg-6 col-md-8 col-sm-11">
                            <c:forEach var="x" items="${selectFoodTruck}">
                                <div class="card mt-5">
                                    <div class="card-body p-5 text-center">
                                        <div class="icons-org-create align-items-center mx-auto">
                                            
                                        </div>
                                        <div class="h3 text-primary mb-0 text-col">${x.ft_name}</div>
                                    </div>
                                    <hr class="m-0" />
                                    <div class="card-body p-5">
                                            <div class="mb-3">${x.ft_info}</div>
                                            <div class="d-grid"><a class="btn btn-primary bg-color" href="cus_choice_menu.do?num=${x.ft_idx}">메뉴보기</a></div>
                                    </div>
                                </div>
                            </c:forEach>
                            </div>
                        </div>
                    </div>
                    
                </main>
            </div>
        </div>
	
	<a id="orderbtn" class="basketbtn btn-qtbtn-reverse btn" href="getbasket.do">원 주문하기</a>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  	<script type="text/javascript">
  	$(document).ready(function() {
		$.ajax({
			url : 'http://localhost:8081/QRservice/getprice.do',
	
			success : function(result) {
				console.log("test : "+result);
				$("#orderbtn").text(result.toString() + "원 주문하기");
			},
			error : function() {
				console.log("error");
			}
		});
  	});
		
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
</body>
</html>