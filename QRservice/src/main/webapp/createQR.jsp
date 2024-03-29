<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="nav-fixed" style="background-color: #FA823C">
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
                                <div class="dropdown-user-details-name">${loginId}</div>
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
                            <div class="sidenav-menu-heading">메뉴</div>
                            <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapseDashboards" aria-expanded="false" aria-controls="collapseDashboards">
                                <div class="nav-link-icon"><i data-feather="star"></i></div>
                                축제 및 행사
                                <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseDashboards" data-bs-parent="#accordionSidenav">
                                <nav class="sidenav-menu-nested nav accordion" id="accordionSidenavPages">
                                	<a class="nav-link" href="list_festival.jsp">목록</a>
                                    <a class="nav-link" href="add_festival.jsp">등록</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="nav-link-icon"><i data-feather="truck"></i></div>
                                부스 및 푸드트럭
                                <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" data-bs-parent="#accordionSidenav">
                                <nav class="sidenav-menu-nested nav accordion" id="accordionSidenavPagesMenu">
                                    <a class="nav-link collapsed" href="fesAdminPage.do">등록</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="moveQR.do" >
                            <div class="nav-link-icon"><i data-feather="grid"></i></div>
                                QR코드생성
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    
				<div class="container-xl px-4 mt-4">
					<div class="row">
						<div class="col-qt-8">
							<div class="card mb-4">
								<div class="card-header">
									<h1>QR코드생성</h1>
								</div>
								<div class="card mb-4">
									<div class="card-body p-0">
										<div class="table-responsive table-billing-history">
											<select id="festiSelect" name="festiSelect">
											<c:forEach var="x" items="${festilist}">
												<option value="${x.getFes_idx()}">${x.getFes_name()}
											</c:forEach>
											</select>
											<select id="size">
												<option>250x250
												<option>300x300
												<option>400x400
												<option>500x500
											</select>
											<button class="btn btn-qtbtn" type="button" onclick="createQR()">생성</button>
											<div id=""><img id="qrimg" src=""></div>
											<button id="imgdw" class="btn btn-qtbtn hiddenbtn" onclick="imgdownload()">다운로드</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
			
			<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
			<script>
			function createQR(){
				console.log("test");
			    var festiIdx = document.getElementById("festiSelect").value;
			    var size = document.getElementById("size").value;
			    var qrUrl = "https://qtorder.kr?ft_idx=" + festiIdx;
			    var url= "https://chart.apis.google.com/chart?cht=qr&chs="+size+"&chl="+qrUrl;
			    
			    document.getElementById("qrimg").setAttribute("src",url);
			    document.getElementById("imgdw").style.display = "block";
			}
			
			function imgdownload(){
				
				var selectElement = document.getElementById("festiSelect");
				var selectedOptionIndex = selectElement.selectedIndex;
				var selectedOptionText = selectElement.options[selectedOptionIndex].text;
				
				var srcValue = document.getElementById("qrimg").src
				var canvas = document.createElement("canvas");
			    var ctx = canvas.getContext("2d");
			    var img = new Image();
			    img.crossOrigin = "anonymous";
			    img.onload = function() {
			        canvas.width = img.width;
			        canvas.height = img.height;
			        ctx.drawImage(img, 0, 0);
			        
			        // 캔버스 이미지를 데이터 URL로 변환하여 다운로드 링크 생성
			        var dataUrl = canvas.toDataURL("image/png");
			        var downloadLink = document.createElement("a");
			        downloadLink.href = dataUrl;
			        downloadLink.download = selectedOptionText+"QRcode"; // 다운로드되는 이미지 파일 이름
			        document.body.appendChild(downloadLink);

			        // 다운로드 링크 클릭하여 이미지 다운로드 시작
			        downloadLink.click();

			        // 다운로드가 완료된 후 임시 다운로드 링크 제거
			        document.body.removeChild(downloadLink);
			    };
			    img.src = srcValue;
			}
			
			</script>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        
    </body>
</html>
