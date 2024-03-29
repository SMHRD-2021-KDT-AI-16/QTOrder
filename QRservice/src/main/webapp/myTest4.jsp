<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.io.*"%>
<%@ page import="kr.qtorder.model.MenuVO"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style>
		@import url('https://fonts.googleapis.com/css?family=PT+Sans|PT+Sans+Narrow');
			html {
    			height: 100%;
			}
			
			body {
			    font-family: 'PT+Sans Narrow', sans-serif;
			    height: 100%;
			    margin: 0;
			}
			
			.container {
			    display: flex;
			    height: 100%;
			    flex-direction: column;
			}
			
			.image-upload {
			    flex: 1;
			    display: flex;
			    flex-direction: column;
			    justify-content: center;
			}
			
			.button {
			    display: flex;
			    justify-content: center;
			}
			
			label {
			    cursor: pointer;
			    font-size: 1em;
			}
			
			#chooseFile {
			    visibility: visible;
			}
			
			.fileContainer {
			    display: flex;
			    justify-content: center;
			    align-items: center;
			}
			
			.fileInput {
			    display: flex;
			    align-items: center;
			    border-bottom: solid 2px black;
			    width: 60%;
			    height: 30px;
			}
			
			#fileName {
			    margin-left: 5px;
			}
			
			.buttonContainer {
			    width: 15%;
			    display: flex;
			    justify-content: center;
			    align-items: center;
			    margin-left: 10px;
			    background-color: black;
			    color: white;
			    border-radius: 30px;
			    padding: 10px;
			    font-size: 0.8em;
			
			    cursor: pointer;
			}
			
			.image-show {
			    z-index: -1;
			    display: flex;
			    justify-content: center;
			    align-items: center;
			    position: absolute;
			    width: 100%;
			    height: 100%;
			}
			
			div.modal-dialog {
				max-width: 800px;
			}
			.img {
			    position: absolute;
			}
			
			.image-thumnail {
				width: 100%;
				height: 100%;
				object-fit: cover;
			}
			
			.menu-container {
				/* width: 100vw;  */
				position: absolute;
				/* margin: 80px auto; */
				/* max-width: 960px; */
				text-align: left;
				/* top: 50%;
				left: 50%; */
				/* transform: translate(-50%, -50%); */
			}
			
			img {
				width: 100%;
				height: 100%;
				object-fit: contain;
			}
			.flip-card {
				width: 300px;
				height: 300px;
				text-aligh: center;
				perspective: 1000px;
				display: inline-block;
				margin: 10px;
				transition: all 0.3s 0s ease-in;
			}
			.flip-card-inner {
				position: relative;
				width: inherit;
				height: 100%;
				text-align: center;
				transition: 1s cubic-bezier(0.445, 0.05, 0.55, 0.95);
				transform-style: preserve-3d;		
				box-shadow: 0 0.15rem 1.75rem 0 rgba(33, 40, 50, 0.15);
			}
			.flip-card:hover .flip-card-inner {
				transform: rotateY(180deg);
			}
			.flip-card-front{
				background-color: #e4d4bb;
				background-image: repeating-radial-gradient(circle, 
				    #E4D4BB, #D6C5AD 50%, #D6C5AD 100%
				  );
				  background-size: 10px 10px;
				z-index: 2;
			}
			.flip-card-back{
				z-index: 1;
				background-color: #fff;
				transform: rotateY(180deg);
			}
			.flip-card-front,
			.flip-card-back {
				position: absolute;
				width: 100%;
				height: 100%;
				backface-visibility: hidden;
			}
			.flip-card-back > * {
				opacity: 100%;
			}
			.flip-card-back img {
				opacity: 30%;
				height: 50%;
			}
			.flip-card-back p {
				text-align: left;
				padding: 0 30px;
				box-sizing: border-box;
			}
			.flip-card-back button {
				display: block;
				width: 100px;
				margin: 20px auto;
				background-color: #000;
				color: #fff;
				text-align: center;
				padding: 5px;
				border-radius: 20px;
				text0transform: uppercase;
				text-decoration: none;
				transition: 0.5s;				
			}
			.text-overlay {
				position: absolute;
				top: 0;
			    left: 0;
				width: 100%;
				height: 100%;
				display: flex;
				flex-direction: column;
				justify-content: center;
				align-items: center;
			}
			.text-overlay button {
				display: inline-block;
				margin: 0 5px;
			}			
			.text-overlay .btn-update:hover {
				background-color: dodgerblue;
			}
			.text-overlay .btn-delete:hover {
				background-color: tomato;
			}
			.buttons-container {
			    display: flex; /* 이 컨테이너 내의 항목들을 가로로 배열 */
			    justify-content: center; /* 버튼들을 중앙에 정렬 */
			    gap: 10px; /* 버튼 사이의 간격 설정 */
			}			
			div.flip-card.show {
			  opacity: 1 !important;
			  transform: scale(1) !important;
			
			  div.card-title {
			    a.toggle-info {
			      background: @salmon !important;
			      span {
			        top: 15px;
			      }
			      span.left {
			        right: 10px;
			      }
			      span.right {
			        left: 10px;
			      }
			    }
			  }
			  div.card-flap {
			    background: @white;
			    transform: rotateX(0deg);
			  }
			  div.flap1 {
			    transition: all 0.3s 0s ease-out;
			  }
			  div.flap2 {
			    transition: all 0.3s 0.2s ease-out;
			  }
			}
			div.menu-container.showing {
			  div.flip-card {
			    cursor: pointer;
			    opacity: 0.6;
			    transform: scale(0.75);
			  }
			}
						
		</style>
		<meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>QTOrder</title>
        <link href="https://cdn.jsdelivr.net/npm/litepicker/dist/css/litepicker.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/yg.css" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="assets/img/logo_small.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
    
</head>


<body class="nav-fixed">
        <nav class="topnav navbar navbar-expand shadow justify-content-between justify-content-sm-start navbar-light bg-white" id="sidenavAccordion">
            <button class="btn btn-icon btn-transparent-dark order-1 order-lg-0 me-2 ms-lg-2 me-lg-0" id="sidebarToggle"><i data-feather="menu"></i></button>
            <a class="navbar-brand pe-3 ps-4 ps-lg-2" href="list_festival.jsp"><img id="main_logo" class="navbar-brand pe-3 ps-4 ps-lg-2" src="assets/img/logo_small.png">QTOrder</a>
            <ul class="navbar-nav align-items-center ms-auto">
                <li class="nav-item dropdown no-caret dropdown-user me-3 me-lg-4">
                    <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownUserImage" href="javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img class="img-fluid" src="assets/img/illustrations/profiles/profile-1.png" /></a>
                    <div class="dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up" aria-labelledby="navbarDropdownUserImage">
                        <h6 class="dropdown-header d-flex align-items-center">
                            <img class="dropdown-user-img" src="assets/img/illustrations/profiles/profile-1.png" />
                            <div class="dropdown-user-details">
                                <div class="dropdown-user-details-name">${loggedInUser.getFt_name()}</div>
                            </div>
                        </h6>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#!">
                            <div class="dropdown-item-icon"><i data-feather="log-out"></i></div>
                            Logout
                        </a>
                    </div>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sidenav shadow-right sidenav-light">
                    <div class="sidenav-menu">
                        <div class="nav accordion" id="accordionSidenav">
                            <div class="sidenav-menu-heading">푸드트럭</div>
                            <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="nav-link-icon"><i data-feather="grid"></i></div>
                                메뉴
                                <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" data-bs-parent="#accordionSidenav">
                                <nav class="sidenav-menu-nested nav accordion" id="accordionSidenavPagesMenu">
                                    <a class="nav-link" href="myTest.jsp">메인 사진</a>
                                    <a class="nav-link" href="myTest4.jsp">메뉴 등록</a>
                                    <a class="nav-link" href="myTest3.jsp">설정</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapseApps" aria-expanded="false" aria-controls="collapseApps">
                                <div class="nav-link-icon"><i data-feather="globe"></i></div>
                                주문
                                <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseApps" data-bs-parent="#accordionSidenav">
                                <nav class="sidenav-menu-nested nav accordion" id="accordionSidenavAppsMenu">
                                    <a class="nav-link" href="order3.jsp">주문 현황</a>
                                    <a class="nav-link" href="#!">주문 표</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="accounts.jsp">
                                <div class="nav-link-icon"><i data-feather="dollar-sign"></i></div>
                                정산
                            </a>
                            <a class="nav-link collapsed" href="noticeList.jsp">
                                <div class="nav-link-icon"><i data-feather="message-circle"></i></div>
                                공지사항
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <!-- Main page content-->
                    <div class="container-xl px-4 mt-5">
                        <!-- Custom page header alternative example-->
                        <div class="d-flex justify-content-between align-items-sm-center flex-column flex-sm-row mb-4">
                            <div class="me-4 mb-3 mb-sm-0">
                                <h1 class="mb-0">서초강산 푸드트럭 <button width = "50px" height = "50px" class = "btn btn-red btn-icon" type = "button"><i data-feather = "feather"></i></button></h1> 
                                <div class="small">
                                    <span class="fw-500 text-primary">Friday</span>
                                    &middot; September 20, 2021 &middot; 12:16 PM
                                </div>
                            </div>
                            <!-- Date range picker example-->
                            <div class="input-group input-group-joined border-0 shadow" style="width: 16.5rem">
                                <span class="input-group-text"><i data-feather="calendar"></i></span>
                                <input class="form-control ps-0 pointer" id="litepickerRangePlugin" placeholder="Select date range..." />
                            </div>
                        </div>
                        <!-- Illustration dashboard card example-->
                        <nav class = "nav nav-borders">
                        	<a class = "nav-link ms-0" href = "TestServlet">메인 사진</a>
                        	<a class = "nav-link active" href = "myTest4.jsp">메뉴 등록</a>
                        	<a class = "nav-link " href = "myTest3.jsp">설정</a>
                        	<a class = "nav-link " href = "#!">미리보기</a>
                        </nav>
                        <hr class="mt-0 mb-4" />
					<%
						String fileDir = "assets/img/hotdog"; //파일을 보여줄 디렉토리
														//String filePath = request.getRealPath(fileDir) + "/"; 
						String filePath = request.getRealPath(fileDir) + "/";
	
						File f = new File(filePath);
						File[] files = f.listFiles(); //파일의 리스트를 대입
	
						/* for ( int i = 0; i < files.length; i++ ) {
						  if ( files[i].isFile()){
						    out.println(files[i].getName());											      
						  }
						} */
					%>
                        <div id="menu-container" class="menu-container">                                 		                                 		
	                        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">메뉴 그룹명을 입력하세요.</h5>
											<button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<form action="FileUpload" method="post" enctype="multipart/form-data" onsubmit="return updateMenu()">  										
											<div class="modal-body row">										
												<div class="modal-body-left" style="width: 50%; position: relative;">
													<img id="imagePreview" style="border: 1px solid black" alt="Menu Image" src="https://media.istockphoto.com/id/157483425/ko/%EC%82%AC%EC%A7%84/%ED%95%AB-%EA%B2%BD%EA%B2%AC-%EB%AA%A8%EB%93%A0-%EA%B3%A0%EC%A0%95-%ED%95%B8%EB%93%A4-%ED%8F%AC%ED%95%A8.jpg?s=612x612&w=0&k=20&c=Rg6OytnWItGBeAG73xlJlvu150O-RGjKTLdMcudW4II=">
													<input type="file" id="fileInput" name="fileInput" style="display: none;" accept="image/*">
													<div style="position: absolute; top: 10px; right: 10px;">
										                <button class="btn btn-primary btn-sm" type="button">삭제</button>
										                <button class="btn btn-secondary btn-sm" type="button" onclick="document.getElementById('fileInput').click();">수정</button>
										            </div>
												</div>
												<div class="modal-body-right" style="width: 50%">
													<div class="mb-3">
		                                                <label class="small mb-1" for="inputMenuName">Menu Name</label>
		                                                <input class="form-control" id="inputMenuName" type="text" placeholder="Enter Menu Name" value="Menu Name" />
		                                            </div>
		                                            <div class="row gx-3 mb-3">
		                                                <div class="col-md-6">
		                                                    <label class="small mb-1" for="inputMenuPrice">Menu Price</label>
		                                                    <input class="form-control" id="inputMenuPrice" type="text" placeholder="Enter Menu Price" value="Menu Price" />
		                                                </div>
		                                                <div class="col-md-6">
		                                                    <label class="small mb-1" for="inputMenuDuration">Menu Duration</label>
		                                                    <input class="form-control" id="inputMenuDuration" type="text" placeholder="Enter Menu Duration" value="Menu Duration" />
		                                                </div>
		                                            </div>
		                                            <div class="mb-3">
		                                                <label class="small mb-1" for="inputMenuInfo">Menu Info</label>
		                                                <input class="form-control" id="inputMenuInfo" type="text" placeholder="Enter Menu info" value="Menu Info" />
		                                                <input style="display: none;"class="form-control" id="inputMenuIdx" type="text" placeholder="Enter Menu Name" value="Menu Index" />
		                                            </div>
												</div>											
											</div>
											<div class="modal-footer">
												<button class="btn btn-secondary btn-sm" type="button" data-bs-dismiss="modal">Close</button>
												<button id="saveButton" class="btn btn-primary btn-sm" type="submit" data-bs-dismiss="modal" onclick="updateMenu()">Save</button>
											</div>
										</form>
									</div>
								</div>
							</div>	
							<div class="modal fade" id="AddMenuModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">메뉴 그룹명을 입력하세요.</h5>
											<button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<form>										
											<div class="modal-body row">										
												<div class="modal-body-left" style="width: 50%">
													<img style="border: 1px solid black"src="https://media.istockphoto.com/id/157483425/ko/%EC%82%AC%EC%A7%84/%ED%95%AB-%EA%B2%BD%EA%B2%AC-%EB%AA%A8%EB%93%A0-%EA%B3%A0%EC%A0%95-%ED%95%B8%EB%93%A4-%ED%8F%AC%ED%95%A8.jpg?s=612x612&w=0&k=20&c=Rg6OytnWItGBeAG73xlJlvu150O-RGjKTLdMcudW4II=">
												</div>
												<div class="modal-body-right" style="width: 50%">
													<div class="mb-3">
		                                                <label class="small mb-1" for="addMenuName">Menu Name</label>
		                                                <input class="form-control" id="addMenuName" type="text" placeholder="Enter Menu Name"/>
		                                            </div>
		                                            <div class="row gx-3 mb-3">
		                                                <div class="col-md-6">
		                                                    <label class="small mb-1" for="addMenuPrice">Menu Price</label>
		                                                    <input class="form-control" id="addMenuPrice" type="text" placeholder="Enter Menu Price"/>
		                                                </div>
		                                                <div class="col-md-6">
		                                                    <label class="small mb-1" for="addMenuDuration">Menu Duration</label>
		                                                    <input class="form-control" id="addMenuDuration" type="text" placeholder="Enter Menu Duration"/>
		                                                </div>
		                                            </div>
		                                            <div class="mb-3">
		                                                <label class="small mb-1" for="addMenuInfo">Menu Info</label>
		                                                <input class="form-control" id="addMenuInfo" type="text" placeholder="Enter Menu info"/>
		                                            </div>
												</div>											
											</div>
											<div class="modal-footer">
												<button class="btn btn-secondary btn-sm" type="button" data-bs-dismiss="modal">Close</button>
												<button class="btn btn-primary btn-sm" type="submit" data-bs-dismiss="modal" onclick="addMenu()">Add</button>
											</div>
										</form>
									</div>
								</div>
							</div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="assets/demo/chart-pie-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/litepicker/dist/bundle.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="js/litepicker.js"></script>
    </body>
    
	<script>	
		let interval;
		
		let inputMenuName = document.getElementById('inputMenuName');
		let inputMenuPrice = document.getElementById('inputMenuPrice');
		let inputMenuDuration = document.getElementById('inputMenuDuration');
		let inputMenuInfo = document.getElementById('inputMenuInfo');
		let inputMenuIdx = document.getElementById('inputMenuIdx');
		let imagePreview = document.getElementById('imagePreview');
		imagePreview
		let menu_list = document.getElementById("menu-list");
		let menu_container = document.getElementById('menu-container');		
		
		fetch('FoodTruckMenu')
			.then(response => response.json()) 
		    .then(data => {	        
            	let element = "";            	
            	//menu_container.innerText = '';
            	console.log(data)

            	for(let i = 0; i < data.length; i++) {
            		element += `
            			<div class="flip-card">
	                		<div class="flip-card-inner">
	                			<div class="flip-card-front">     
	                				<img class="" src="assets/img/hotdog/\${data[i].menu_img}">                    			
	                			</div>
	                			<div class="flip-card-back">
	                				<img style="opacity: 30%" src="assets/img/hotdog/\${data[i].menu_img}">
	                				<div class="text-overlay">
		                				<h1 data-idx="\${ data[i].menu_idx }"> \${ data[i].menu_name }</h1>
		                				<h4> \${ data[i].menu_price.toLocaleString("ko-KR") }원</h4>
		                				<p> \${ data[i].menu_info }</p>
		                				<div class="buttons-container">
			                				<button class="btn-update" type="button" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" id="saveMenuGroup" onclick='updateMenuButton(\${ JSON.stringify(data[i]) } )'>Update</button>
	                                		<button class="btn-delete" type="button" >Delete</button>   
		                				</div>
	                				</div>
	                			</div>                        			
	                		</div>
	                	</div>
            		`;
            	}
            	element += `
            		<div class="flip-card" data-bs-toggle="modal" data-bs-target="#AddMenuModalCenter" style="background-color: #333333;">
            			
            		</div>
            	`;
            	menu_container.insertAdjacentHTML("afterbegin", element);            	
		    })
		    .catch(error => console.error('Error:', error));
		
		function updateMenuButton(data) {			
			inputMenuName.value = data.menu_name;
			inputMenuPrice.value = data.menu_price + "원";
			inputMenuDuration.value = data.menu_waiting_time + "분";
			inputMenuInfo.value = data.menu_info;
			inputMenuIdx.value = data.menu_idx;		
			imagePreview.src = "assets/img/hotdog/" + data.menu_img;
		}
		
		function updateMenu() {		
			
		    let menu_name = inputMenuName.value;
			let menu_price = inputMenuPrice.value;
			let menu_duration = inputMenuDuration.value;
			let menu_info = inputMenuInfo.value;
			let menu_idx = inputMenuIdx.value;
			let menu_imgName = fileInput.files[0];
			
			let menu = new Object();
			
			menu.menu_name = menu_name;
			menu.menu_price = menu_price.replace("원", "");
			menu.menu_duration = menu_duration.replace("분", "");
			menu.menu_info = menu_info;
			menu.menu_idx = menu_idx;
			if(fileInput.files[0]) {
		        menu.menu_image = fileInput.files[0].name;
		    }
			console.log(menu)
		    $.ajax({
		        type: "get",
		        url: "UpdateMenu", // 서블릿 URL 변경
		        data: {"formData" : JSON.stringify(menu)},		        
		        success: function(response) {
		            console.log("Upload Success", response);
		            // 성공 로직 처리...
		        },
		        error: function(xhr, status, error) {
		            console.error("Upload Failed", status, error);
		            // 실패 로직 처리...
		        }
		    }); 
			return true;
		}
		
		function addMenu() {
			let addMenuName = document.getElementById('addMenuName').value;
			let addMenuPrice = document.getElementById('addMenuPrice').value;
			let addMenuDuration = document.getElementById('addMenuDuration').value;
			let addMenuInfo = document.getElementById('addMenuInfo').value;
			
			let menu = new Object();
			
			menu.menu_name = addMenuName;
			menu.menu_price = addMenuPrice;
			menu.menu_duration = addMenuDuration;
			menu.menu_info = addMenuInfo;
			console.log("-----")
			console.log(menu)
			
			$.ajax({
				type: "get",
				url: "AddMenu",
				data : {'addMenu' : JSON.stringify(menu)},
				success: function (data) {
					let element = "";            	
	            	menu_container.innerText = '';
	            	console.log(data)

	            	for(let i = 0; i < data.length; i++) {
	            		element += `
	            			<div class="flip-card">
	                    		<div class="flip-card-inner">
	                    			<div class="flip-card-front">     
	                    				<img class="" src="assets/img/hotdog/\${data[i].menu_img}">                    			
	                    			</div>
	                    			<div class="flip-card-back">
	                    				<img style="opacity: 30%" src="assets/img/hotdog/\${data[i].menu_img}">
	                    				<div class="text-overlay">
	    	                				<h1 data-idx="\${ data[i].menu_idx }"> \${ data[i].menu_name }</h1>
	    	                				<h4> \${ data[i].menu_price.toLocaleString("ko-KR") }원</h4>
	    	                				<p> \${ data[i].menu_info }</p>
	    	                				<div class="buttons-container">
	    		                				<button class="btn-update" type="button" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" id="saveMenuGroup" onclick='updateMenuButton(\${ JSON.stringify(data[i]) } )'>Update</button>
	                                    		<button class="btn-delete" type="button" >Delete</button>   
	    	                				</div>
	                    				</div>
	                    			</div>                        			
	                    		</div>
	                    	</div>
	            		`;
	            	}
	            	element += `
	            		<div class="flip-card" data-bs-toggle="modal" data-bs-target="#AddMenuModalCenter" style="background-color: #333333;">
	            			
	            		</div>
	            	`;
	            	menu_container.insertAdjacentHTML("afterbegin", element);   
				},
				error: function() {
					console.log("메뉴 추가 실패")
				}
			})
		}
		
		document.addEventListener('DOMContentLoaded', function () {
		    // 상위 요소에 이벤트 리스너 추가
		    document.getElementById('menu-container').addEventListener('click', function(e) {
		        // 클릭된 요소가 삭제 버튼인지 확인
		        if (e.target && e.target.classList.contains('btn-delete')) {
		            const menuId = e.target.closest('.flip-card').querySelector('[data-idx]').getAttribute('data-idx');
					fetch(`DeleteMenu?menuId=\${menuId}`, {
		                method: 'DELETE'
		            })
		            .then(response => response.json())
		            .then(data => {
		            	let element = "";            	
		            	menu_container.innerText = '';
		            	console.log(data)

		            	for(let i = 0; i < data.length; i++) {
		            		element += `
		            			<div class="flip-card">
		                    		<div class="flip-card-inner">
		                    			<div class="flip-card-front">     
		                    				<img style="border: 2px solid black;" src="assets/img/hotdog/\${data[i].menu_img}">                    			
		                    			</div>
		                    			<div class="flip-card-back">
		                    				<img style="opacity: 30%" src="assets/img/hotdog/\${data[i].menu_img}">
		                    				<div class="text-overlay">
		    	                				<h1 data-idx="\${ data[i].menu_idx }"> \${ data[i].menu_name }</h1>
		    	                				<h4> \${ data[i].menu_price.toLocaleString("ko-KR") }원</h4>
		    	                				<p> \${ data[i].menu_info }</p>
		    	                				<div class="buttons-container">
		    		                				<button class="btn-update" type="button" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" id="saveMenuGroup" onclick='updateMenuButton(\${ JSON.stringify(data[i]) } )'>Update</button>
		                                    		<button class="btn-delete" type="button" >Delete</button>   
		    	                				</div>
		                    				</div>
		                    			</div>                        			
		                    		</div>
		                    	</div>
		            		`;
		            	}
		            	element += `
		            		<div class="flip-card" data-bs-toggle="modal" data-bs-target="#AddMenuModalCenter" style="background-color: #333333;">
		            			<div style="background-color: white">
		            				
		            			</div>
		            		</div>
		            	`;
		            	menu_container.insertAdjacentHTML("afterbegin", element);   
		                console.log(data)
		            })
		            .catch(err => console.error('Error:', err));
		        }
		    });
		});
		
		////////////////////////////////////////////////////////////////
		
		function printMenuInfo(menu_idx) {
			$.ajax({
				type: "get", 			//1.서버에 요청하는 방식(get/post) 
				url: "FoodTruckMenu", 		//2.서버에 요청되는 주소 
				//data : {'menu' : menu_name}, //3.클라이언트가 서버에 전달할 데이터 
				dataType: "json", 		//4.서버로부터 받아온 응답 데이터의 타입
				success: function (data) { //5-1.요청에 대한 응답이 성공했을때 동작할 함수
					//updateFoodTruckMenu(data);
					let element = "";
	            	let menu_list = document.getElementById("menu-list");
	            	menu_list.innerText = '';
	            	//console.log(data)
					for(let i = 0; i < data.length; i++) {
						if(data[i].menu_idx == menu_idx) {
							inputMenuName.value = data[i].menu_name;
							inputMenuPrice.value = data[i].menu_price + "원";
							inputMenuDuration.value = data[i].menu_waiting_time + "분";
							inputMenuCategory.value = data[i].menu_category;
							element += `
								<a class="list-group-item list-group-item-action active" onclick="printMenuInfo(\${ data[i].menu_idx })">
									\${ data[i].menu_name }
		            			</a>`;	
		            		
						} else {
							element += `
								<a class="list-group-item list-group-item-action" onclick="printMenuInfo(\${ data[i].menu_idx })">
									\${ data[i].menu_name }
		            			</a>`;
						}
					}
					menu_list.insertAdjacentHTML("afterbegin", element);	
				},
				error: function () { //5-2.요청에 대한 응답이 실패했을때 동작할 함수
					console.log("error");
				}
			})
			
			$.ajax({
				type: "get", 			//1.서버에 요청하는 방식(get/post) 
				url: "SelectMenuOptions", 		//2.서버에 요청되는 주소 
				data : {'menu_idx' : menu_idx}, //3.클라이언트가 서버에 전달할 데이터 
				dataType: "json", 		//4.서버로부터 받아온 응답 데이터의 타입
				success: function (data) { //5-1.요청에 대한 응답이 성공했을때 동작할 함수
					//updateFoodTruckMenu(data);
					let element = "";
	            	let menu_option = document.getElementById("menu-option");
	            	menu_option.innerText = '';
	            	console.log(data)
	            	element += `
	            		<div> \${ data[0].mo_name } </div>
	            	`;
	            	for(let i = 0; i < data.length; i++) {
	            		element += `
	            			<div> \${ data[i].mo_notice }</div>
	            		`;
	            	}
					/* for(let i = 0; i < data.length; i++) {
						if(data[i].menu_idx == menu_idx) {
							inputMenuName.value = data[i].menu_name;
							inputMenuPrice.value = data[i].menu_price + "원";
							inputMenuDuration.value = data[i].menu_waiting_time + "분";
							inputMenuCategory.value = data[i].menu_category;
							element += `
								<a class="list-group-item list-group-item-action active" onclick="printMenuInfo(\${ data[i].menu_idx })">
									\${ data[i].menu_name }
		            			</a>`;	
		            		
						} else {
							element += `
								<a class="list-group-item list-group-item-action" onclick="printMenuInfo(\${ data[i].menu_idx })">
									\${ data[i].menu_name }
		            			</a>`;
						}
					} */
					menu_option.insertAdjacentHTML("afterbegin", element);	
				},
				error: function () { //5-2.요청에 대한 응답이 실패했을때 동작할 함수
					console.log("error");
				}
			})
		}
		function updateFoodTruckMenu(data) {
			
		}
	</script>
	<script>
		$(document).ready(function(){
		  	var zindex = 10;
		  
		  	$(document).on("mouseenter", ".flip-card", function(e){
		    	e.preventDefault();
		    	console.log("click!!");
		    	var isShowing = false;

		    	if ($(this).hasClass("show")) {
		      		isShowing = true
		    	}

		    	if ($("div.menu-container").hasClass("showing")) { // a card is already in view
		      		$("div.flip-card.show")
		        	.removeClass("show");

		      	if (isShowing) { // this card was showing - reset the grid
		        	$("div.menu-container")
		          	.removeClass("showing");
		      	} else { // this card isn't showing - get in with it
		        	$(this)
		          	.css({zIndex: zindex})
		          	.addClass("show");
		      	}
		      	zindex++;

			} else { // no cards in view
		    	$("div.menu-container")
		        .addClass("showing");
		      	$(this)
		        .css({zIndex:zindex})
		        .addClass("show");
		      	zindex++;
			}		    
		});
		$(document).on("mouseleave", ".flip-card", function(e) {
			if ($("div.menu-container").hasClass("showing")) { 
				$("div.menu-container").removeClass("showing");
			}
			$("div.flip-card").removeClass("show");
		});
	});
	</script>	
	<script>
		document.body.addEventListener('click', function(event) {
		    if (event.target.classList.contains('trigger-file-input')) {
		        document.getElementById('fileInput').click();
		    }
		});
	
		// 'fileInput' 변경 이벤트 처리
		document.body.addEventListener('change', function(event) {
		    if (event.target.id === 'fileInput') {
		        var fileInput = event.target;
		        if (fileInput.files && fileInput.files[0]) {
		            var reader = new FileReader();
		            reader.onload = function(e) {
		                document.getElementById('imagePreview').src = e.target.result;
		            };
		            reader.readAsDataURL(fileInput.files[0]);
		        }
		    }
		});
		
		document.getElementById('fileInput').onchange = function(event) {
		    var reader = new FileReader();
		    reader.onload = function(){
		        var output = document.getElementById('imagePreview');
		        output.src = reader.result;
		    };
		    reader.readAsDataURL(event.target.files[0]);
		};
	</script>
</body>
</html>