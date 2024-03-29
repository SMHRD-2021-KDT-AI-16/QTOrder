<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <link rel="icon" type="image/x-icon" href="assets/img/logo_small.png" />
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
									<h1>축제/행사 정보 조회</h1>
								</div>
								<div class="card mb-4">
									<div class="card-body p-0">
										<div class="table-responsive table-billing-history">
											<table id="fes_list_t" class="table mb-0">
												<thead>
													<tr>
														<th class="border-gray-200" scope="col">축제/행사명</th>
														<th class="border-gray-200" scope="col">시작일</th>
														<th class="border-gray-200" scope="col">종료일</th>
														<th class="border-gray-200" scope="col">상태</th>
														<!-- <th class="border-gray-200" scope="col">삭제</th> -->
													</tr>
												</thead>
												<tbody id="fes_list">
													
												</tbody>
											</table>
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
			//console.log("test");
			$.ajax({
				url: 'http://localhost:8081/QRservice/getFes_List.do',
				
				success: function (result) {
					console.log("result : "+result);
					for (var i = 0; i < result.length; i++) {
		                var fesInfo = result[i];
						
		                var fesName = fesInfo.fes_name;
		                var fesStart = new Date(fesInfo.fes_start).getTime();
		                
		                var fesEnd = new Date(fesInfo.fes_end).getTime();
		                
		                var currentDate = new Date().getTime();

		                var startDate = new Date(fesInfo.fes_start).toLocaleDateString();
		                var endDate = new Date(fesInfo.fes_end).toLocaleDateString();
		                
		                var status;

		                if (currentDate < fesStart) {
		                    statusText = "예정";
		                    statusClass = "badge-blue";
		                } else if (currentDate >= fesStart && currentDate <= fesEnd) {
		                    statusText = "진행중";
		                    statusClass = "badge-green";
		                } else {
		                    statusText = "종료";
		                    statusClass = "badge-red";
		                }

		                const tbody = document.getElementById("fes_list")
		                
		                const tr = document.createElement("tr");
		                
		                const td1 = document.createElement("td");
		                td1.innerText = fesName;
		                
		                const td2 = document.createElement("td");
		                td2.innerText = startDate;
		                
		                const td3 = document.createElement("td");
		                td3.innerText = endDate;
		                
		                const td4 = document.createElement("td");
		                const span = document.createElement("span")
		                span.className = statusClass;
		                span.textContent = statusText;
		                
		                td4.appendChild(span);
		                
		                tr.appendChild(td1);
		                tr.appendChild(td2);
		                tr.appendChild(td3);
		                tr.appendChild(td4);
		                
		                tbody.appendChild(tr);
		            }
				},
				error: function(){
					console.log("error");
				}
  		    });
			</script>
			
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        
    </body>
</html>
