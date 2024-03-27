<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="kr.qtorder.model.ReceiptVO"%>
<%@page import="java.util.List"%>
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
        
        <style type="text/css">
        	#empty{
        		width: 100%;
        		height: 5%;
        	}
        </style>
    </head>
    <%
    	List<ReceiptVO> receiptList = (List<ReceiptVO>) request.getServletContext().getAttribute("receiptList");
    	String jsonData = new Gson().toJson(receiptList);
    %>
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
   
            <div id="layoutSidenav_content">
                <main>
                    
                    <form id="cardForm" action="getreceiptdetail.do" method="post">
    					<input type="hidden" id="cardValue" name="value" value="">
					</form>
                    
                    <div class="container-xl px-4 mt-4">
                       
                        <div id="receipt_list" class="row">
                            <!-- <div class="col-lg-4 mb-4">
                                <div class="card h-100 border-start-lg border-start-primary">
                                    <div class="card-body">
                                        <div class="small text-muted order_date">2024/01/01</div>
                                        <div class="h3 order_name">얼음컵</div>
                                        <div class="h3 order_price">1억</div>
                                    </div>
                                </div>
                            </div> -->
                            
                        </div>
                    </div>
                </main>
                <script type="text/javascript">
                	var receiptData = <%= jsonData %>;                	
                	console.log("re ",receiptData);
                	
                	for(let i = 0; i < receiptData.length; i++){
                		
                		let price = 0;
                		let name = "";
                    	let date = "";
                    	let cnt = 0;
                    	
                		if(i+1 == receiptData.length){
                			// 마지막 한개만 남았을 때
                			price = price + (receiptData[i].menu_price*receiptData[i].menu_cnt);
                			date = receiptData[i].ordered_at;
                			name = receiptData[i].menu_name;
                			value = receiptData[i].order_idx;
                			console.log("1 ",price," 2 ",date);
                		}else{
                			// 여러개일 때
                			price = price + (receiptData[i].menu_price*receiptData[i].menu_cnt);
                			console.log(i+"번째 : 금액 : "+price);
                			date = receiptData[i].ordered_at;
                			name = receiptData[i].menu_name;
                			value = receiptData[i].order_idx;
                			// 제일 처음 오는걸 변수에 넣고
	                		for(let j = i+1; j < receiptData.length; j++){
	                			// 주문인덱스의 값이 같으면
		                		if(receiptData[i].order_idx == receiptData[j].order_idx){
		                			price = price + (receiptData[j].menu_price*receiptData[j].menu_cnt);
		                			// 금액을 더한다.
		                			cnt = cnt + 1;
		                			// 갯수를 늘린다.
		                		}else{
		                			i = j-1;
		                			console.log("현재 위치 : "+i);
		                			break;
		                		}
	                		}
                			if(cnt != 0){
	                			name = name + " 외 "+cnt+"개";
			                	console.log("test : "+name);
                			}
                			
                			if(i == receiptData.length){
                				break;
                			}
                		}
	                	viewReceipt(date, name, price, value);
                	}
                	
                	
                	function viewReceipt(date, name, price, value){
                		console.log("1t ",price," 2t ",date);
                		const receipt_list = document.getElementById("receipt_list");
                		
                		const div1 = document.createElement("div");
                		div1.className="col-lg-4 mb-4";
                		
                		const div2 = document.createElement("div");
                		div2.className="card h-100 border-start-lg border-start-primary";
                		
                		
                		const div3 = document.createElement("div");
                		div3.className="card-body";
                		div3.setAttribute('data-value', value);
                		
                		const div4 = document.createElement("div");
                		div4.className="small text-muted order_date";
                		div4.innerText = date;
                		
                		const div5 = document.createElement("div");
                		div5.className = "h3 order_name";
                		div5.innerText = name;
                		
                		const div6 = document.createElement("div");
                		div6.className = "h3 order_price";
                		div6.innerText = price;
                		
                		
                		div3.appendChild(div4);
                		div3.appendChild(div5);
                		div3.appendChild(div6);
                		div2.appendChild(div3);
                		
                		div1.appendChild(div2);
                		receipt_list.appendChild(div1);
                	}
                	
                	document.querySelectorAll('.card-body').forEach(cardBody => {
                	    cardBody.addEventListener('click', function() {
                	        const value = cardBody.getAttribute('data-value');
                	        document.getElementById('cardValue').value = value;
                	        document.getElementById('cardForm').submit();
                	    });
                	});
                </script>
                <footer class="footer-admin mt-auto footer-light">
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
    </body>
</html>
