<%@page import="kr.qtorder.model.BestMenuVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,
                   kr.qtorder.model.FoodTruckVO,
                   kr.qtorder.model.BestMenuVO,
                   kr.qtorder.model.SetMenuVO,
                   kr.qtorder.model.SetGroupVO,
                   kr.qtorder.model.FtImgVO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Join Organization - SB Admin Pro</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/yg.css" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
        
        <style>
        
        .main-bg-color {
	      background-color: #FA823C;
	    }
	    
        .card-body {
        	flex: 1 1 auto;
        	padding: 1.0rem !important;
        }
        
        .card-body2 {
        	flex: 1 1 auto;
        	padding: 1.0rem !important;
        	border-color: #FA823C;
        	background-color: rgba(255, 223, 164, 0.5);
        	border-radius: 15px;
        	margin-left: 10px;
        	margin-right: 10px;
        }
        
        .group-body {
        	flex: 1 1 auto;
        	padding-top: 1.0rem !important;
        	padding-left: 1.0rem !important;
        }
        
        a {
		    color: inherit; /* 링크 색상을 부모 요소의 색상으로 상속 */
		    text-decoration: none; /* 밑줄 제거 */
		}
		
		a:visited,
		a:focus,
		a:hover,
		a:active  {
			color: inherit;
		    outline: none; /* 클릭 또는 포커스 시 외곽선 제거 */
		    text-decoration: none; /* 밑줄 제거 */
		}
		
		.name-set{
			color:black;
			font-size: 15px;
			font-weight: 500;
		}
		
		.price-set{
			color:black;
			font-size: 15px;
			font-weight: 500;
		}
		
		.info-set{
			color: black !important;
			font-weight: bold;
		}
        
        .info-set2{
			color: black !important;
		}
		
		.flex-container {
		    display: flex; /* Flexbox 레이아웃 사용 */
		    justify-content: space-between; /* 요소 사이의 공간을 균등하게 배분하여 좌우 정렬 */
		    align-items: center; /* 수직 정렬을 가운데로 설정 */
		}
		.flex-item {
		    flex: 1; /* Flex item을 동일한 크기로 설정 */
		}
		.mb-3 img {
		    width: 100%; /* 부모 요소에 맞게 이미지 너비를 100%로 설정 */
		    height: auto; /* 이미지 높이 자동 조절 */
		}
		
        </style>
    </head>
    
    <body class="main-bg-color">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container-xl px-4">
                        <div class="row justify-content-center">
                        
                            <div class="col-xl-5 col-lg-6 col-md-8 col-sm-11">
                                <div class="card border-0 shadow-lg mt-5">
                                <%
							    	FoodTruckVO fvo = new FoodTruckVO();
							    	fvo = (FoodTruckVO)session.getAttribute("loadInfo");
							    	FtImgVO ivo = new FtImgVO();
							    	ivo = (FtImgVO)session.getAttribute("loadImg");
							    %>
                                
                                	<!-- 가게 이미지 -->
                                    <div class="card-body p-5 text-center">
                                        <div class="icons-org-join align-items-center mx-auto">
                                        <% if(ivo != null) {%>
                                            <img alt="가게 사진" src="<%=ivo.getFt_img_realname()%>" style="max-width: 100%; max-height: 100%">
                                            <img alt="가게 사진" src="assets/img/hotdog.jpg" style="max-width: 100%; max-height: 100%;">
                                        <%} %>
                                        </div>
                                    </div>
                                    
                                    <!-- 가게 이름 -->
                                    <div class="card-body p-5 text-center">
                                        <div class="h2 info-set mb-0"><%=fvo.getFt_name()%></div>
                                    </div>
                                    
                                    <!-- 가게 안내 -->
                                    <div class="card-body2 text-center">
                                        <div class="h6 info-set2 mb-0"><%=fvo.getFt_info() %></div>
                                    </div>
                                    
                                    <!-- 대표 메뉴 -->
                                    <div class="card-body h5 mb-0 text-left info-set">대표 메뉴</div>
                                    <c:forEach var="b" items="${bestMenu}">
                                    <a href="getmenudetail.do?ft_idx=${b.ft_idx}&menu_idx=${b.menu_idx}">
                                    <div class="card-body">
                                        <form class="flex-container">
                                        	<div class="flex-item">
	                                            <div class="mb-3 name-set">${b.menu_name}</div>
	                                            <div class="mb-3 price-set">${b.menu_price}원</div>
                                            </div>
                                            <div class="flex-item">
	                                            <div class="mb-3"><img alt="대표메뉴 사진" src="assets/img/hotdog.jpg"><%-- <img alt="대표메뉴 사진" src="${b.menu_img}"> --%></div>
                                            </div>
                                        </form>
                                    </div>
                                    </a>
                                    <hr class="m-0" />
                                    </c:forEach>
                                    
                                    <%
                                    HttpSession session3 = request.getSession();
                                    List<SetMenuVO> setMenu = (List<SetMenuVO>)session3.getAttribute("setMenu");
                                    List<SetGroupVO> setGroup = (List<SetGroupVO>)session3.getAttribute("setGroup");
                                    List<BestMenuVO> allMenu = (List<BestMenuVO>)session3.getAttribute("allMenu");
                                    %>
                                    
                                    
                                    <!-- 세트메뉴 -->
                                    <div class="card-body h5 mb-0 text-left info-set">세트 메뉴</div>
                                    <% for(SetGroupVO group : setGroup) { %>
                                    	<div class="group-body h5"><%= group.getGroup_name() %></div>
			                        	<div class="card-body">
                                    	<% for(SetMenuVO menu : setMenu) { %>
                                    	<a href="getmenudetail.do?ft_idx=<%= menu.getFt_idx()%>&group_idx=<%= menu.getGroup_idx()%>">
                                    		<% if(group.getGroup_idx()==menu.getGroup_idx()) { %>
			                                        <form>
			                                            <div class="mb-3 name-set"><%=menu.getMenu_name() %></div>
			                                        </form>
			                            	<% } %> <!-- if -->
			                        	<% } %> <!-- 안쪽 for -->
	                                    <% 
	                                    int totalPrice=0;
	                                    for(SetMenuVO menu : setMenu){
	                                    	if(group.getGroup_idx()==menu.getGroup_idx()) {
	                                    	totalPrice += menu.getMenu_price();
	                                    	}
	                                    }
	                                    %>
	                                    <div class="mb-3 price-set"><%=totalPrice%>원</div>
			                            </a>
			                            </div>
	                                    <hr class="m-0" />
		                            <% } %> <!-- 바깥쪽 for -->
		                            
		                            
		                            <!-- 모든메뉴 -->
		                            <div class="card-body h5 mb-0 text-left info-set">메뉴</div>
                                    <% for(BestMenuVO all : allMenu) { %>
                                    	<a href="getmenudetail.do?ft_idx=<%= all.getFt_idx()%>&menu_idx=<%= all.getMenu_idx()%>">
			                        	<div class="card-body">
	                                        <form class="flex-container">
	                                        	<div class="flex-item">
		                                            <div class="mb-3 name-set"><%=all.getMenu_name()%></div>
		                                            <div class="mb-3 price-set"><%=all.getMenu_price()%>원</div>
	                                        	</div>
	                                        	<div class="flex-item">
		                                            <div class="mb-3"><img alt="메뉴 사진" src="assets/img/hotdog.jpg"><%-- <img alt="메뉴 사진" src="<%=all.getMenu_img()%>"> --%></div>
	                                        	</div>
	                                        </form>
	                                    </div>
	                                    </a>
	                                    <hr class="m-0" />
	                                <%} %>
		                                
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            
            <div id="layoutAuthentication_footer">
                <footer class="footer-admin mt-auto footer-dark">
                    <div class="container-xl px-4">
                        <div class="row">
                            <div class="col-md-6 small">Copyright &copy; Your Website 2021</div>
                            <div class="col-md-6 text-md-end small">
                                <a href="#!">Privacy Policy</a>
                                &middot;
                                <a href="#!">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <a id="orderbtn" class="basketbtn btn btn-qtbtn-reverse" href="getbasket.do">원 주문하기</a>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script type="text/javascript">
        $(document).ready(function() {
    		$.ajax({
    			url : 'http://localhost:8081/QRservice/getprice.do',
    	
    			success : function(result) {
    				console.log("test : "+result);
    				console.log("test2 : ",$("#orderbtn"));
    				$("#orderbtn").text(result.toString() + "원 주문하기");
    				
    			},
    			error : function() {
    				console.log("error");
    			}
    		});
      	});
		
	</script>
    </body>
</html>
