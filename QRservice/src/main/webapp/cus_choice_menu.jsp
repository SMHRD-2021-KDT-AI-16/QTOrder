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
        <title>QTOrder</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/yg.css" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="assets/img/logo_small.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
    </head>
    
    <body class="main-bg-color">
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
    	<a class="dropdown-item" href="order_state.do">주문현황</a>
        <a class="dropdown-item" href="getreceipt.do">영수증</a>
        </div>
    </div>
	</div>
</div>

<div id="empty"></div>
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
	                                            <%-- <div class="mb-3"><img alt="대표메뉴 사진" src="${b.menu_img}"> --%>
	                                            <div class="mb-3"><img alt="대표메뉴 사진" src="assets/img/hotdog/hotdog1.jpg"></div>
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
                                    
                                    
                                    <%-- <!-- 세트메뉴 -->
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
		                            <% } %> <!-- 바깥쪽 for --> --%>
		                            
		                            
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
		                                            <%-- <div class="mb-3"><img alt="메뉴 사진" src="<%= all.getMenu_img()%>" style="width: 150px; height: 150px"><img alt="메뉴 사진" src="<%=all.getMenu_img()%>"></div> --%>
		                                            <div class="mb-3"><img alt="대표메뉴 사진" src="assets/img/hotdog/hotdog1.jpg"></div>
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
            
            <div id="empty"></div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <a id="orderbtn" class="basketbtn btn btn-qtbtn-reverse" href="getbasket.do">원 주문하기</a>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function() {
            // 모든 price-set 클래스를 가진 요소를 선택합니다.
            var priceElements = document.querySelectorAll('.price-set');

            // 각 요소에 대해 루프를 돌면서 가격을 변환합니다.
            priceElements.forEach(function(element) {
                // 요소의 텍스트를 가져옵니다.
                var priceString = element.innerText;

                // 문자열에서 '원' 문자열을 제거하고 ','를 모두 제거한 후 숫자로 변환합니다.
                var price = parseInt(priceString.replace('원', '').replace(/,/g, ''));

                // 한국 통화 형식으로 숫자를 변환합니다.
                var formattedPrice = price.toLocaleString("ko-KR");

                // 변환된 가격을 요소의 텍스트로 설정합니다.
                element.innerText = formattedPrice + '원';
            });
        });
        
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
