<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.io.*"%>
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
				width: 100%;
				height: 100%;
				object-fit: cover;
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
                        	<a class = "nav-link active ms-0" href = "TestServlet">메인 사진</a>
                        	<a class = "nav-link " href = "myTest4.jsp">메뉴 등록</a>
                        	<a class = "nav-link " href = "myTest3.jsp">설정</a>
                        	<a class = "nav-link " href = "#!">미리보기</a>
                        </nav>
                        <hr class="mt-0 mb-4" />
                        <div class="card mb-3 mt-5">
                            <div class="card-body p-5">
                                <div class="container">
							        <div class="image-upload" id="image-upload">							
							            <form action="fileupload.jsp" id = 'frm' method="post" enctype="multipart/form-data">
							                <div class="button">
							                    <label for="chooseFile">
							                        <font size = 5>👉 CLICK HERE! 👈</font>
							                    </label>
							                </div>
							                <input type="file" id="chooseFile" name="chooseFile" accept="image/*" onchange="loadFile(this)">
							            </form>		
							            <div class="fileContainer">
							                <div class="fileInput">
							                    <p>FILE NAME: </p>
							                    <p id="fileName"></p>
							                </div>
							                <div class="buttonContainer">
							                    <div class="submitButton" id="submitButton" type="submit" value="submit">SUBMIT</div>
							                </div>
							            </div>
							        </div>	
							    </div>
                            </div>
                        </div>
					<%
						String fileDir = "assets/img/hotdog"; //파일을 보여줄 디렉토리
														//String filePath = request.getRealPath(fileDir) + "/"; 
						String filePath = request.getRealPath(fileDir) + "/";
	
						File f = new File(filePath);
						File[] files = f.listFiles(); //파일의 리스트를 대입
						
						for ( int i = 0; i < files.length; i++ ) {
						  if ( files[i].isFile()){
						    //out.println(files[i].getName());
						    //System.out.println(files[i].getName());
						   	System.out.println(filePath + files[0].getName());
						  }
						} 
					%>
					<!-- C:\Users\user\Desktop\JSP_Servlet\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\QRservice -->
					<div class="row">
                            <div class="col-xl-3 col-md-6 mb-4">
                                <!-- Dashboard info widget 1-->
                                <div class="card border-start-lg border-start-primary h-100 lift">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center" class="image-show" id="image-show">
                                           <% if(files.length > 0) { %>
                                           <img style=" width : 190px; height : 100px;" class = 'image-thumnail' 
                                           		<%-- src = '<%= filePath + files[0].getName() %>' > --%>
                                           		src = 'assets/img/hotdog/main1.jpg' >
                                           <% } %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 mb-4">
                                <!-- Dashboard info widget 2-->
                                <div class="card border-start-lg border-start-secondary h-100 lift">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center">         
                                           <% if(files.length > 1) { %>                                   
										   <%-- <img width = "800px" height = "450px" class = 'image-thumnail' 
										   		src = '${ session_img }/<%= files[1].getName() %>' >	 --%>
										   		<img style=" width : 190px; height : 100px;" class = 'image-thumnail' 
										   		src = 'assets/img/hotdog/truck2.png' >
										   <% } %>										                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 mb-4">
                                <!-- Dashboard info widget 3-->
                                <div class="card border-start-lg border-start-success h-100 lift">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center">
                                           <% if(files.length > 2) { %>
                                           <img style=" width : 190px; height : 100px;" class = 'image-thumnail' 
										   		src = 'assets/img/hotdog/truck3.jpg' >	   
                                           <% } %>                                         
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 mb-4">
                                <!-- Dashboard info widget 3-->
                                <div class="card border-start-lg border-start-success h-100 lift">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center">
                                           <% if(files.length > 3) { %>
                                           <img style=" width : 190px; height : 100px;" class = 'image-thumnail' 
										   		src = 'assets/img/hotdog/truck4.jpg' >	
                                           <% } %>
                                        </div>
                                    </div>
                                </div>
                            </div>                            
                        </div>
                        
                        <div class="row">
                            <div class="col-lg-4 mb-4">
                                <!-- Illustration card example-->
                                <div class="card mb-4">
                                    <div class="card-header">Introduce</div>
                                    <div class="card-body">
                                    	<form>
                                    	
                                    		<textarea class="form-control" radius = "100px" name="message" rows="12" cols="42"></textarea>
                                    	</form>
                                    	<a class="btn btn-primary btn-sm mt-3" href="#!">Enter</a>
                                    </div>
                                </div>
                                
                            </div>
                            <div class="col-lg-8 mb-4">
                                <!-- Area chart example-->
                                <div class="card mb-4">
                                    <div class="card-header">Income</div>
                                    <div class="card-body">
                                        <div class="chart-area"><canvas id="myAreaChart" width="100%" height="30"></canvas></div>
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
        <script src="js/litepicker.js"></script>
    </body>
    <script>
	   
		    
		var submit = document.getElementById('submitButton');
		submit.onclick = showImage;     //Submit 버튼 클릭시 이미지 보여주기
		
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