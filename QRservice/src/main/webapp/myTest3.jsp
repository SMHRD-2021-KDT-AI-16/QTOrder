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
			html {
    			height: 100%;
			}
			
			body {
			    font-family: sans-serif;
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
			    visibility: hidden;
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
			
			.img {
			    position: absolute;
			}
			
			.image-thumnail {
				width: 50%;
				height: 50%;
				object-fit: cover;
			}
			
			.btn-menu-drag {
			  width: 70px;
			  height: 70px;
			  border: none;
			  border-radius: 8px;
			  margin: 12px;
			  cursor: move;
			  font-size: 30px;
			  background: #eaeaea4f;
			}			
			
			.draggable.dragging {
			  opacity: 0.5;
			}
			.btn-dark:hover {
				background-color: #FFC0CB;
			}
			
			.drag-container {
			  margin: 10px;
			  padding: 10px;
			  background-color: #b5c1dc57;
			  border-radius: 8px;
			}
			
			.drag-menu {
				background-color: #ffffff;
			}
			
			.group {
				text-align: center;
				/* white-space: nowrap; */
				overflow: hidden;
			}
			.item {
				width: 20vw;
			  	height: 8vw;
			  	background-position: center;
			  	background-size: 8vh cover;
			  	margin: 1vw;
			  	border-radius: 5%;
			  	display: block;
			  	cursor: pointer;
			  	opactiy: 30%;
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
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
                        	<a class = "nav-link " href = "myTest4.jsp">메뉴 등록</a>
                        	<a class = "nav-link active" href = "myTest3.jsp">설정</a>
                        	<a class = "nav-link " href = "#!">미리보기</a>
                        </nav>
                        <hr class="mt-0 mb-4" />					
						<div class="row mt-5">
                            <div class="col-lg-4 mb-4">
                                <!-- Illustration card example-->
                                <div class="card card-header-actions mb-4">
                                    <div class="card-header">Main Menu                                    	
                                    	<div class="dropdown">
                                    		<button class="btn btn-primary btn-sm dropdown-toggle" id="dropdownFadeIn" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expended="false">Menu</button>
                                    		<div class="dropdown-menu animated--fade-in" aria-labelledby="dropdownFadeIn">
                                    			<% 		     
                                    				List<MenuVO> listMenuVO = (List<MenuVO>)session.getAttribute("listMenuVO");
		                                        	for(int i = 0; i < listMenuVO.size(); i++) {  %>
														<a class="dropdown-item" onclick="addMainMenu('<%= listMenuVO.get(i).getMenu_name()%>')">
		                                            	  <% out.println(listMenuVO.get(i).getMenu_name()); %>
		                                        		</a>
													
		                                        <%  } %>
                                    		</div>                                    		
                                    	</div>
                                    </div>
                                    
                                    <div class="group" id='main-menu-list'>           
	                                   	                                	
                                    </div>
                                </div>                                
                            </div>
                            <div class="col-lg-8 mb-4">
                                <!-- Area chart example-->
                                <div class="card card-header-actions mb-4">
                                    <div class="card-header">Menu Group
                                    	<div>
                                    		<button class="btn btn-indigo btn-sm" type="button" id="saveMenuGroup">Save Group</button>
                                    		<button class="btn btn-primary btn-sm" type="button" data-bs-toggle="modal" data-bs-target="#exampleModalCenter">Add Group</button>                                    		                                 		
                                    		<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
												<div class="modal-dialog modal-dialog-centered" role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="exampleModalLabel">메뉴 그룹명을 입력하세요.</h5>
															<button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">
															<input type="text" size="50" id='group-name'>
														</div>
														<div class="modal-footer">
															<button class="btn btn-secondary btn-sm" type="button" data-bs-dismiss="modal">Close</button>
															<button class="btn btn-primary btn-sm" type="button" data-bs-dismiss="modal" onclick="addGroup()">Save</button>
														</div>
													</div>
												</div>
											</div>
                                    	</div>
                                    </div>
                                    <div class="card-body">    
                                    <a class="btn btn-datatable btn-icon btn-transparent-dark" href="#!"><i data-feather="trash-2"></i></a>                                   
                                    	<div class="list-group list-group-flush small" id='group-container'>
	                                    	<div class="drag-container drag-menu" >	  	                                    		                                  											    
											</div>																		
                                    	</div>
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
        <script src="js/dragmove.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="assets/demo/chart-pie-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/litepicker/dist/bundle.js" crossorigin="anonymous"></script>
        <script src="js/litepicker.js"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script> 
    </body>
       
    <script type="text/javascript">
		/* $(function () {
			$("#a").on("click", getData);
		}); */
		
		let main_menu_list = document.getElementById("main-menu-list");
		let group_container = document.getElementById('group-container');
		fetch('ShowMainMenu')
			.then(response => response.json()) 
		    .then(data => {	        
	        	let element = "";            	
	        	//group_container.innerText = '';	      
	        	$.ajax({
	        		type: "get", 			//1.서버에 요청하는 방식(get/post) 
	 				url: "GetMenuGroup", 		//2.서버에 요청되는 주소 
	 				//data : {'menu' : menu_name}, //3.클라이언트가 서버에 전달할 데이터 
	 			 	dataType: "json", 		//4.서버로부터 받아온 응답 데이터의 타입
	 			 	success: function (group_info) { //5-1.요청에 대한 응답이 성공했을때 동작할 함수
	 			 		//showMainMenu(data)
	 			 		console.log("group_info")
	 			 		console.log(group_info)
	 			 		console.log("data")
	 			 		console.log(data)
	 			 			 			 		
	 			 		element += `<div class="drag-container drag-menu" >`;	 					
	 			 		
	 					for(let i = 0; i < data.length; i++) {
	 						element += `
	 							<button class="draggable btn btn-dark btn-sm" draggable="true" data-set="\${ data[i].menu_idx }">
	 	                  	  		\${ data[i].menu_name }
	 	              			</button>
	 						`;
	 					}				
	 					element += `</div>`;
	 					console.log(group_info.length - 1)
						for(let i = 0; i < group_info[group_info.length - 1].length; i++) { // 3번 반복
							element += `
		 							<div>\${ group_info[group_info.length - 1][i].group_name }
		 								<a class="btn btn-datatable btn-icon btn-transparent-dark" href="#!"><i data-feather="trash-2"></i></a>	
		 							</div> 							
		 						<div class="drag-container drag-menu-group" data-set="\${ group_info[group_info.length - 1][i].group_idx }">
		 					`;
		 					for(let j = 0; j < group_info.length - 1; j++) {
		 						if(group_info[group_info.length - 1][i].group_idx == group_info[j].group_idx ) {
		 							element += `
		 								<button class="draggable btn btn-dark btn-sm" draggable="true" data-set="\${ group_info[j].menu_idx }"> \${ group_info[j].menu_name }</button>		 								
		 							`;		 							
		 						}
		 					}
		 						
		 					element += `
		 						</div>
		 					`;
	 			 		}
	 					group_container.insertAdjacentHTML("beforebegin", element)
	 				},
	 				error: function () { //5-2.요청에 대한 응답이 실패했을때 동작할 함수
	 					 console.log("error");
	 				}
	 			 });//end ajax 	
		    })
		    .catch(error => console.error('Error:', error));
		
		function addGroup() {
			let group_name = document.getElementById("group-name").value;
			//console.log(group_name)
			$.ajax({
				type: "get", 			//1.서버에 요청하는 방식(get/post) 
				url: "AddMenuGroup", 		//2.서버에 요청되는 주소 
				data : {'group_name' : group_name}, //3.클라이언트가 서버에 전달할 데이터 
			 	dataType: "text", 		//4.서버로부터 받아온 응답 데이터의 타입
			 	success: function (data) { //5-1.요청에 대한 응답이 성공했을때 동작할 함수			 		
			 		
				},
				error: function () { //5-2.요청에 대한 응답이 실패했을때 동작할 함수
					 console.log("error");
				}
			 });//end ajax 
		}
		
		document.getElementById('saveMenuGroup').addEventListener('click', function() {
		    const allSets = {};
		    
		    document.querySelectorAll('.drag-container.drag-menu-group').forEach((container) => {		    	
		        const setName = container.dataset.set;
		        //const menus = Array.from(container.children).map(div => (div.textContent).trim());
		        const menus = Array.from(container.children).map(div => div.dataset.set);
		        allSets[setName] = menus;
		    });		 
		    
		    console.log("allSets = " )
		    console.log(JSON.stringify(allSets))
		   
		    $.ajax({
				type: "post", 			//1.서버에 요청하는 방식(get/post) 
				url: "SaveMenuGroup", 		//2.서버에 요청되는 주소 
				data : {'allSets' : JSON.stringify(allSets)}, //3.클라이언트가 서버에 전달할 데이터 
			 	dataType: "text", 		//4.서버로부터 받아온 응답 데이터의 타입
			 	success: function (data) { //5-1.요청에 대한 응답이 성공했을때 동작할 함수			 		
			 		
				},
				error: function () { //5-2.요청에 대한 응답이 실패했을때 동작할 함수
					 console.log("error");
				}
			 });//end ajax 
		});
		
		document.querySelectorAll('.delete-btn').forEach(button => {
	        button.addEventListener('click', function() {
	            this.parentElement.remove();
	            console.log("delete")
	        });
	    });
	</script>
	<script src='https://unpkg.co/gsap@3/dist/gsap.min.js'></script><script  src="./script.js"></script>
	<script>	
		function addMainMenu(menu_name) {
			 $.ajax({
				type: "get", 			//1.서버에 요청하는 방식(get/post) 
				url: "AddMainMenu", 		//2.서버에 요청되는 주소 
				data : {'menu' : menu_name}, //3.클라이언트가 서버에 전달할 데이터 
			 	dataType: "json", 		//4.서버로부터 받아온 응답 데이터의 타입
			 	success: function (data) { //5-1.요청에 대한 응답이 성공했을때 동작할 함수
			 		showMainMenu(data)
				},
				error: function () { //5-2.요청에 대한 응답이 실패했을때 동작할 함수
					 console.log("error");
				}
			 });//end ajax 
		}
		
		function deleteMainMenu(menu_name) {
			 $.ajax({
				type: "get", 			//1.서버에 요청하는 방식(get/post) 
				url: "DeleteMainMenu", 		//2.서버에 요청되는 주소 
				data : {'menu' : menu_name}, //3.클라이언트가 서버에 전달할 데이터 
			 	dataType: "json", 		//4.서버로부터 받아온 응답 데이터의 타입
			 	success: function (data) { //5-1.요청에 대한 응답이 성공했을때 동작할 함수			 		
			 		showMainMenu(data);
				},
				error: function () { //5-2.요청에 대한 응답이 실패했을때 동작할 함수
					 console.log("error");
				}
			 });//end ajax 
		}		
		
		function showMainMenu(data) {
			
	 		let element = '';
	 		main_menu_list.innerText = '';
	 		for(let i = 0; i < data.length; i++) {
	 			if(data[i].menu_main == 1) {			 			
	 				let temp = data[i].menu_name;
	 							 				
				 	element = element +  
			 			`	<div class="item" style="background-image: url(http://localhost:8082/QRservice/assets/img/hotdog/main1.jpg)">				 				
				 				<button class="btn btn-outline-indigo btn-sm rounded-pill" onclick="deleteMainMenu('\${ temp }')">Delete</button>				                    
			                	<h1 style="color:white;"> \${ temp } </h1>
				 			</div>
			                <hr />
			 			`;			
	 			}			 			
	 		}  	 		
	 		main_menu_list.insertAdjacentHTML("afterbegin", element)
		}
		function startInterval() {
    		interval = setInterval( () => {
    			$.ajax({
					type: "get", 			//1.서버에 요청하는 방식(get/post) 
					url: "ShowMainMenu", 		//2.서버에 요청되는 주소 
					//data : {'menu' : menu_name}, //3.클라이언트가 서버에 전달할 데이터 
				 	dataType: "json", 		//4.서버로부터 받아온 응답 데이터의 타입
				 	success: function (data) { //5-1.요청에 대한 응답이 성공했을때 동작할 함수			 		
				 		showMainMenu(data);
					},
					error: function () { //5-2.요청에 대한 응답이 실패했을때 동작할 함수
						 console.log("error");
					}
				 });//end ajax 
    		}, 10000)    		
    	}
		function stopInterval() {
    		clearInterval(interval);
    	}
		main_menu_list.addEventListener("mouseover", (event) => {
			stopInterval();
		})
		main_menu_list.addEventListener("mouseout", (event) => {
			startInterval();
		})
		
		startInterval();		
	</script>
    <script>
    $(document).on("mouseover", "#group-container", function() { 
	    const items = document.querySelectorAll('.item')
	
	    const expand = (item, i) => {
	      items.forEach((it, ind) => {
	        if (i === ind) return
	        it.clicked = false
	      })
	      gsap.to(items, {
	        height: item.clicked ? '8vw' : '4vw',
	        duration: 2,
	        ease: 'elastic(1, .6)'
	      })
	      
	      item.clicked = !item.clicked
	      gsap.to(item, {
	    	  height: item.clicked ? '15vw' : '8vw',
	        duration: 2.5,
	        ease: 'elastic(1, .3)'
	      })
	    }
	
	    items.forEach((item, i) => {
	      item.clicked = false
	      item.addEventListener('click', () => expand(item, i))
	    })
    })
		var submit = document.getElementById('submitButton');
		submit.onclick = showImage();     //Submit 버튼 클릭시 이미지 보여주기
		
		function showImage() {
		    var newImage = document.getElementById('image-show').lastElementChild;
		    newImage.style.visibility = "visible";
		    
		    document.getElementById('image-upload').style.visibility = 'visible';
		    document.getElementById('frm').submit();		
		    document.getElementById('fileName').textContent = null;     //기존 파일 이름 지우기
		}
				
		function loadFile(input) {
		    var file = input.files[0];
		
		    var name = document.getElementById('fileName');
		    name.textContent = file.name;
		
		    var newImage = document.createElement("img");
		    newImage.setAttribute("class", 'img');
		
		    newImage.src = sessionStorage.getItem('session_img');
		    
		    newImage.style.width = "70%";
		    newImage.style.height = "70%";
		    newImage.style.visibility = "visible";   //버튼을 누르기 전까지는 이미지 숨기기
		    newImage.style.objectFit = "contain";
		
		    var container = document.getElementById('image-show');
		    container.appendChild(newImage);
		};
	</script>
</body>
</html>