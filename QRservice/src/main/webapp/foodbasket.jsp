<%@page import="kr.qtorder.model.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
     <%
	CustomerVO customerInfo = (CustomerVO)request.getServletContext().getAttribute("customerInfo");
    String cust_name = customerInfo.getCust_name();
    String cust_phone = customerInfo.getCust_phone();
	%>
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
    </head>
    <body class="nav-fixed">
   
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
		
		<div id="layoutSidenav_content">
			<main>
				<div class="container-xl px-4">
					<h4 class="mb-0 mt-5">장바구니</h4>
					<hr class="mt-2 mb-4" />
					<c:forEach var="x" items="${basketlist}" varStatus="loop">
					<div id=${x.getCart_product_num() } class="card card-icon lift lift-sm mb-4">
						<div class="row g-0">
							<div class="col">
								<div class="card-body py-4">
									<div class="d-flex align-items-center justify-content-between mt-4 mb-0">
										<h5 id="food_num_${loop.index}" class="card-title text-primary mb-2 foodname">${x.getMenu_name()}</h5>
										<a id="delete_${loop.index}" class="btn btn-qtbtn" type="button" onclick="delete_food(this.id)">X</a>
									</div>
									<div class="d-flex align-items-center justify-content-between mt-4 mb-0">
										<h6 id="" class="card-title text-primary mb-2">${x.getMo_name()} ${x.getMo_notice()}</h6>
									</div>
									<button id="food_num_minus_${loop.index}" class="btn"
										onclick="minus_food_num(this.id)">-</button>
									<p class="btn card-text mb-1">${x.getMenu_cnt()}</p>
									<button id="food_num_plus_${loop.index}" class="btn"
										onclick="add_food_num(this.id)">+</button>
									<div class="small text-muted" id="subtotal_${loop.index}"></div>
								</div>
							</div>
						</div>
					</div>
					<script>
				        var menuPrice_${loop.index} = ${x.getMenu_price()};
				        var menuCnt_${loop.index} = ${x.getMenu_cnt()};
				        var subtotal_${loop.index} = menuPrice_${loop.index} * menuCnt_${loop.index};
				        document.getElementById("subtotal_${loop.index}").innerText = subtotal_${loop.index};
				    </script>
					</c:forEach>
				</div>
				<hr class="mt-2 mb-4" />
				<div class="container-xl px-4">
					<div class="d-flex align-items-center justify-content-between mt-4 mb-0">
						<div id = "total_money" class="small">총 결제 금액 : 0원</div>
						<a class="btn btn-qtbtn" type="button" href="getcarT.do">결제(영수증)</a>
						<button class="btn btn-qtbtn" type="button" onclick="requestPay()">결제(api)</button>
					</div>
				</div>
			</main>
			<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
			
    
        <script>
        var IMP = window.IMP; // 생략가능
		IMP.init("imp50200865");

		function requestPay() {
			var totalmoneyElement = document.getElementById("total_money");
			var totalmoney = totalmoneyElement.innerText;
			totalmoney = totalmoney.replace("총 결제 금액 :", "").replace("원","").trim();
			console.log("money : ",totalmoney);
			itemnum();	
			console.log("항목 : ",itemname);
			var cust_name = '<%= cust_name %>';
			var cust_phone = '<%= cust_phone %>';
			console.log("name : ", cust_name);
			console.log("phone : ", cust_phone);
			
			
  			IMP.request_pay({
  			pg: "html5_inicis",
		    pay_method: "card",
		    merchant_uid : itemname+new Date().getTime(), //주문번호
		    name : itemname,
		    amount: totalmoney,
		    buyer_tel: cust_phone,
		  });
		}
		</script>
			<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
			<script type="text/javascript">
				window.onload = function() {
			    	total_money(); // 페이지가 로드되면 total_money 함수 실행
				};
				
				function add_food_num(btnid) {

					let btn_id = document.getElementById(btnid);
					let quantityElement = btn_id.previousElementSibling; // 이전 형제 엘리먼트를 선택
					let num = parseInt(quantityElement.innerText);

					let money = parseInt(btn_id.nextElementSibling.innerText);

					money = money / num;
					num = num + 1;

					quantityElement.innerText = num;

					money = money * num;
					btn_id.nextElementSibling.innerText = money;

					total_money();
					
					$.ajax({
    					url: '',
    					
    					success: function (result) {
    						
    					},
    					error: function(){
    				
    					}
    	  		    });
				}


				function minus_food_num(btnid) {

					let btn_id = document.getElementById(btnid);
					let money = parseInt(btn_id.parentNode.querySelector('.small.text-muted').innerText);

					let quantityElement = btn_id.nextElementSibling;

					let num = parseInt(quantityElement.innerText);
					if (num > 1) {
						money = money / num;
						num = num - 1;
						money = money * num;
						quantityElement.innerText = num;
						btn_id.parentNode.querySelector('.small.text-muted').innerText = money;
						total_money();
					}
				}

				function total_money() {

					var moneys = document.getElementsByClassName("small text-muted");
					let total_money = 0;

					for (let i = 0; i < moneys.length; i++) {
						total_money = total_money
								+ parseInt(moneys[i].innerText);
					}

					document.getElementById("total_money").innerText = "총 결제 금액 : "+ total_money + "원";

				}

				function delete_food(id) {

					let card = document.getElementById(id).closest('.card');
					let cardnum = card.id;
					console.log("cardnum ",cardnum);
					if (card) {
						card.parentNode.removeChild(card);
						$.ajax({
							url : 'http://localhost:8081/QRservice/delete_cartproduct.do?cart_product_num='+cardnum,

							success : function(result) {

							},
							error : function() {

							}
						});

					}
					total_money();
				}
				
				let itemname = "";
				function itemnum(){
					var foodname = document.getElementsByClassName("foodname");
					console.log("test : ", foodname[0].innerText);
					var len = foodname.length;
					if(len > 1){
						itemname = foodname[0].innerText + " 외 "+(len-1)+"개";
					}else{
						itemname = foodname[0].innerText;
					}
				}
				
				
				
			</script>
			<footer class="footer-admin mt-auto footer-light">
				<div class="container-xl px-4">
					<div class="row">
						<div class="col-md-6 small">Copyright &copy; QTOrder 2024</div>
						<div class="col-md-6 text-md-end small">
							<a href="#!">Privacy Policy</a> &middot; <a href="#!">Terms &amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
