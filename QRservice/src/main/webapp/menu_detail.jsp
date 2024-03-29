<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	    	<a class="dropdown-item" href="order_state.do">주문현황</a>
	        <a class="dropdown-item" href="getreceipt.do">영수증</a>
	        </div>
	    </div>
		</div>
	</div>

	<div id="empty"></div>
	        <div id="layoutSidenav_content">
                <main>
                    <div class="container-xl px-4 mt-4">
                        <div class="card invoice">
                            <div class="card-header p-4 p-md-5 border-bottom-0 bg-gradient-primary-to-secondary text-white-50">
                                <div class="row justify-content-between align-items-center">
                                    <div class="col-12 col-lg-auto mb-5 mb-lg-0 text-center text-lg-start">
                                        <img class="" src="${menuDetail.get(0).getMenu_img()}" alt="" />
                                    </div>
                                </div>
                            </div>
                            <form id="myForm" action="insertCart.do" method="get">
                          	<input id="ft_idx" name="ft_idx" type="hidden" value="${menuDetail.get(0).getFt_idx()}">
                            <div class="card-body p-4 p-md-5">
                                <div class="table-responsive">
                                    <table class="table table-borderless mb-0">
                                        <tbody>
                                            <tr>
                                                <td colspan="2"><h3><input id="menu_idx" name="menu_idx" type="hidden" value="${menuDetail.get(0).getMenu_idx()}">${menuDetail.get(0).getMenu_name()}</h3></td>
                                            </tr>
                                            
                                            <tr class="border-bottom">
                                                <td id="oneprice" class="text-end fw-bold">${menuDetail.get(0).getMenu_price()}원</td>
                                                <td class="text-end fw-bold">${menuDetail.get(0).getMenu_waiting_time()}분</td>
                                            </tr>
                                            
                                            <tr class="border-bottom">
                                                <td colspan="2">
                                                	메뉴설명    
                                                </td>
                                            </tr>
                                            <c:set var="prevMoName" value="1" />
											<c:forEach var="x" items="${menuDetail}">
												<c:if test="${not empty prevMoName && !prevMoName.equals(x.getMo_name())}">
													<tr>
														<td colspan="2"><input id="mo_idx" name="mo_idx" type="hidden" value="${menuDetail.get(0).getMo_idx()}">${x.getMo_name()}(필수)</td>
													</tr>
												</c:if>
												<tr>
													<td colspan="2">
													<label>
													<input type="radio" name="od_idx" value="${x.getOd_idx()}">
													<span> ${x.getMo_notice()}</span></td>
													</label>
												</tr>
	
												<c:set var="prevMoName" value="${x.getMo_name()}" />
											</c:forEach>
											<tr>
                                                <td class="text-end pb-0"><div class="text-uppercase small fw-700 text-muted">가격 :</div></td>
                                                <td class="text-end pb-0"><div id="price" class="h5 mb-0 fw-700">${menuDetail.get(0).getMenu_price()}원</div></td>
                                            </tr>
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="card-footer p-4 p-lg-5 border-top-0">
                            <div class="container-xl1 px-16">
								<div class="d-flex align-items-center justify-content-between mt-4 mb-0">
								<div>
									<button id="minus" class="btn" onclick="minusfoodnum()" type="button">-</button>
							        <span id="num">1</span>
							        <button id="plus" class="btn" onclick="addfoodnum()" type="button">+</button>
							        </div>
							        <button id="submitButton" class="btn btn-qtbtn" type="button" onclick="submitdata()">${menuDetail.get(0).getMenu_price()}원 담기</button>
								</div>
								</div>
							</div>
                            </form>
                        </div>
                    </div>
                </main>
                <script type="text/javascript">
	                
	                function getSelectedOdIdx() {
	                    // 라디오 버튼이 선택된 요소들을 가져옵니다.
	                    var selectedOdIdx = document.querySelector('input[name="od_idx"]:checked');

	                    // 선택된 라디오 버튼이 있는지 확인합니다.
	                    if (selectedOdIdx) {
	                        // 선택된 라디오 버튼의 값을 반환합니다.
	                        return selectedOdIdx.value;
	                    } else {
	                        // 선택된 라디오 버튼이 없는 경우, null을 반환합니다.
	                        return null;
	                    }
	                }
	                
	                function submitdata(){
	                	let ft_idx = document.getElementById("ft_idx").value;
	                	let menu_idx = document.getElementById("menu_idx").value;
	                	let menu_cnt = document.getElementById("num").innerText;
	                	let mo_idx = document.getElementById("mo_idx").value;
	                	let od_idx = getSelectedOdIdx();
	                	
	                	if (!od_idx) {
	                        // 경고창 띄우기
	                        alert("옵션을 선택해 주세요.");
	                        // 폼 제출 방지
	                        return false;
	                    }
	                	
	                	let form = document.getElementById("myForm");
	                	
	                	var inputMenuCnt = document.createElement("input");
	                    inputMenuCnt.setAttribute("type", "hidden");
	                    inputMenuCnt.setAttribute("name", "menu_cnt");
	                    inputMenuCnt.setAttribute("value", menu_cnt);
	                    form.appendChild(inputMenuCnt);
	                	
	                	form.submit();
	                	
	                }
                
                	function addfoodnum(){
                		num1 = document.getElementById("num");
                		price_div_one = document.getElementById("oneprice");
                		price_div = document.getElementById("price");
                		let num = parseInt(num1.innerText);
                		let price = price_div_one.innerText;
                		price = parseInt(price.replace("원",""));
                		
                		
                		if(num > 0){
                			num = num+1;
                			console.log("test : "+num)
                			num1.innerText = num;
                			price = price * num;
                			price_div.innerText=price+"원";
                			document.getElementById("submitButton").innerText = price+"원 담기";
                		}
                	}
                	
                	function minusfoodnum(){
                		num1 = document.getElementById("num");
                		price_div_one = document.getElementById("oneprice");
                		price_div = document.getElementById("price");
                		let num = parseInt(num1.innerText);
                		let price = price_div_one.innerText;
                		price = parseInt(price.replace("원",""));
                		
                		
                		if(num > 0){
                			num = num-1;
	                		if(num == 0){
	                			num = 1;
	                		}
                			console.log("test : "+num)
                			num1.innerText = num;
                			price = price * num;
                			price_div.innerText=price+"원";
                			document.getElementById("submitButton").innerText = price+"원 담기";
                		}
                	}
                
                </script>
                
            </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
