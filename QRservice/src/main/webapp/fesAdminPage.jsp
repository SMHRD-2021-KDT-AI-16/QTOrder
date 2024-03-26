<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, kr.qtorder.model.FoodTruckVO"%>
<%@ page import="java.util.List, kr.qtorder.model.FestivalVO"%>
<%@ page import="java.util.List, kr.qtorder.model.FestivalLocVO"%>
<%@ page import="java.util.List, kr.qtorder.model.FesAddListVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
    <head>
        <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>QTOrder</title>
  <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
  <link href="css/styles.css" rel="stylesheet" />
  <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
  <script data-search-pseudo-elements defer
    src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js"
    crossorigin="anonymous"></script>

  <style>
    .custom-nav-fixed {
      top: 3.625rem;
    }

    .custom-col-xl-8 {
      flex: 0 0 auto;
    }

    #datatablesSimple {
      width: 100%;
      border-collapse: collapse;
      margin: 0 10px;
      /* 좌우 간격을 조절하는 마진 추가 */
      margin-bottom: 20px;
      /* 표 간의 간격을 조절할 수 있는 마진 추가 */
    }

    #datatablesSimple th,
    #datatablesSimple td {
      padding: 12px;
      /* 셀 내부의 패딩 추가 */
      text-align: left;
    }

    .font-setting {
      font-weight: bold;
      font-size: inherit;
    }

    .margin-top {
      margin-top: 15px;
    }

    .margin-bottom {
      margin-bottom: 15px;
    }

    .content_title {
      font-weight: bold !important;
      color: #FA823C !important;
    }

    .addbtn-color {
      font-weight: bold;
      background-color: black;
      border-color: black;
    }

    .main-bg-color {
      background-color: #FA823C;
    }
  </style>
    </head>
    <body class="nav-fixed" style="background-color: #FA823C">
        <nav class="topnav navbar navbar-expand shadow justify-content-between justify-content-sm-start navbar-light bg-white" id="sidenavAccordion">
            
            <button class="btn btn-icon btn-transparent-dark order-1 order-lg-0 me-2 ms-lg-2 me-lg-0" id="sidebarToggle"><i data-feather="menu"></i></button>
            
            <a class="navbar-brand pe-3 ps-4 ps-lg-2" href="list_festival.jsp">QTOrder</a>
            
            <ul class="navbar-nav align-items-center ms-auto">
                
                <li class="nav-item dropdown no-caret d-none d-md-block me-3">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownDocs" href="javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <div class="fw-500">Documentation</div>
                        <i class="fas fa-chevron-right dropdown-arrow"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end py-0 me-sm-n15 me-lg-0 o-hidden animated--fade-in-up" aria-labelledby="navbarDropdownDocs">
                        <a class="dropdown-item py-3" href="https://docs.startbootstrap.com/sb-admin-pro" target="_blank">
                            <div class="icon-stack bg-primary-soft text-primary me-4"><i data-feather="book"></i></div>
                            <div>
                                <div class="small text-gray-500">Documentation</div>
                                Usage instructions and reference
                            </div>
                        </a>
                        <div class="dropdown-divider m-0"></div>
                        <a class="dropdown-item py-3" href="https://docs.startbootstrap.com/sb-admin-pro/components" target="_blank">
                            <div class="icon-stack bg-primary-soft text-primary me-4"><i data-feather="code"></i></div>
                            <div>
                                <div class="small text-gray-500">Components</div>
                                Code snippets and reference
                            </div>
                        </a>
                        <div class="dropdown-divider m-0"></div>
                        <a class="dropdown-item py-3" href="https://docs.startbootstrap.com/sb-admin-pro/changelog" target="_blank">
                            <div class="icon-stack bg-primary-soft text-primary me-4"><i data-feather="file-text"></i></div>
                            <div>
                                <div class="small text-gray-500">Changelog</div>
                                Updates and changes
                            </div>
                        </a>
                    </div>
                </li>
                <!-- Navbar Search Dropdown-->
                <!-- * * Note: * * Visible only below the lg breakpoint-->
                <li class="nav-item dropdown no-caret me-3 d-lg-none">
                    <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="searchDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i data-feather="search"></i></a>
                    <!-- Dropdown - Search-->
                    <div class="dropdown-menu dropdown-menu-end p-3 shadow animated--fade-in-up" aria-labelledby="searchDropdown">
                        <form class="form-inline me-auto w-100">
                            <div class="input-group input-group-joined input-group-solid">
                                <input class="form-control pe-0" type="text" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" />
                                <div class="input-group-text"><i data-feather="search"></i></div>
                            </div>
                        </form>
                    </div>
                </li>
                <!-- Alerts Dropdown-->
                <li class="nav-item dropdown no-caret d-none d-sm-block me-3 dropdown-notifications">
                    <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownAlerts" href="javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i data-feather="bell"></i></a>
                    <div class="dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up" aria-labelledby="navbarDropdownAlerts">
                        <h6 class="dropdown-header dropdown-notifications-header">
                            <i class="me-2" data-feather="bell"></i>
                            Alerts Center
                        </h6>
                        <!-- Example Alert 1-->
                        <a class="dropdown-item dropdown-notifications-item" href="#!">
                            <div class="dropdown-notifications-item-icon bg-warning"><i data-feather="activity"></i></div>
                            <div class="dropdown-notifications-item-content">
                                <div class="dropdown-notifications-item-content-details">December 29, 2021</div>
                                <div class="dropdown-notifications-item-content-text">This is an alert message. It's nothing serious, but it requires your attention.</div>
                            </div>
                        </a>
                        <!-- Example Alert 2-->
                        <a class="dropdown-item dropdown-notifications-item" href="#!">
                            <div class="dropdown-notifications-item-icon bg-info"><i data-feather="bar-chart"></i></div>
                            <div class="dropdown-notifications-item-content">
                                <div class="dropdown-notifications-item-content-details">December 22, 2021</div>
                                <div class="dropdown-notifications-item-content-text">A new monthly report is ready. Click here to view!</div>
                            </div>
                        </a>
                        <!-- Example Alert 3-->
                        <a class="dropdown-item dropdown-notifications-item" href="#!">
                            <div class="dropdown-notifications-item-icon bg-danger"><i class="fas fa-exclamation-triangle"></i></div>
                            <div class="dropdown-notifications-item-content">
                                <div class="dropdown-notifications-item-content-details">December 8, 2021</div>
                                <div class="dropdown-notifications-item-content-text">Critical system failure, systems shutting down.</div>
                            </div>
                        </a>
                        <!-- Example Alert 4-->
                        <a class="dropdown-item dropdown-notifications-item" href="#!">
                            <div class="dropdown-notifications-item-icon bg-success"><i data-feather="user-plus"></i></div>
                            <div class="dropdown-notifications-item-content">
                                <div class="dropdown-notifications-item-content-details">December 2, 2021</div>
                                <div class="dropdown-notifications-item-content-text">New user request. Woody has requested access to the organization.</div>
                            </div>
                        </a>
                        <a class="dropdown-item dropdown-notifications-footer" href="#!">View All Alerts</a>
                    </div>
                </li>
                
                <li class="nav-item dropdown no-caret d-none d-sm-block me-3 dropdown-notifications">
                    <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownMessages" href="javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i data-feather="mail"></i></a>
                    <div class="dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up" aria-labelledby="navbarDropdownMessages">
                        <h6 class="dropdown-header dropdown-notifications-header">
                            <i class="me-2" data-feather="mail"></i>
                            Message Center
                        </h6>
                
                        <a class="dropdown-item dropdown-notifications-item" href="#!">
                            <img class="dropdown-notifications-item-img" src="assets/img/illustrations/profiles/profile-2.png" />
                            <div class="dropdown-notifications-item-content">
                                <div class="dropdown-notifications-item-content-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</div>
                                <div class="dropdown-notifications-item-content-details">Thomas Wilcox · 58m</div>
                            </div>
                        </a>
                
                        <a class="dropdown-item dropdown-notifications-item" href="#!">
                            <img class="dropdown-notifications-item-img" src="assets/img/illustrations/profiles/profile-3.png" />
                            <div class="dropdown-notifications-item-content">
                                <div class="dropdown-notifications-item-content-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</div>
                                <div class="dropdown-notifications-item-content-details">Emily Fowler · 2d</div>
                            </div>
                        </a>
                
                        <a class="dropdown-item dropdown-notifications-item" href="#!">
                            <img class="dropdown-notifications-item-img" src="assets/img/illustrations/profiles/profile-4.png" />
                            <div class="dropdown-notifications-item-content">
                                <div class="dropdown-notifications-item-content-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</div>
                                <div class="dropdown-notifications-item-content-details">Marshall Rosencrantz · 3d</div>
                            </div>
                        </a>
                
                        <a class="dropdown-item dropdown-notifications-item" href="#!">
                            <img class="dropdown-notifications-item-img" src="assets/img/illustrations/profiles/profile-5.png" />
                            <div class="dropdown-notifications-item-content">
                                <div class="dropdown-notifications-item-content-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</div>
                                <div class="dropdown-notifications-item-content-details">Colby Newton · 3d</div>
                            </div>
                        </a>
                
                        <a class="dropdown-item dropdown-notifications-footer" href="#!">Read All Messages</a>
                    </div>
                </li>
                
                <li class="nav-item dropdown no-caret dropdown-user me-3 me-lg-4">
                    <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownUserImage" href="javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img class="img-fluid" src="assets/img/illustrations/profiles/profile-1.png" /></a>
                    <div class="dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up" aria-labelledby="navbarDropdownUserImage">
                        <h6 class="dropdown-header d-flex align-items-center">
                            <img class="dropdown-user-img" src="assets/img/illustrations/profiles/profile-1.png" />
                            <div class="dropdown-user-details">
                                <div class="dropdown-user-details-name">Valerie Luna</div>
                                <div class="dropdown-user-details-email">vluna@aol.com</div>
                            </div>
                        </h6>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#!">
                            <div class="dropdown-item-icon"><i data-feather="settings"></i></div>
                            Account
                        </a>
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
                                죽체 및 행사
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
                    
                    <div class="sidenav-footer">
                        <div class="sidenav-footer-content">
                            <div class="sidenav-footer-subtitle">사용자:</div>
                            <div class="sidenav-footer-title">${loginId}</div>
                        </div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    
				<!-- 메인 컨텐츠 -->
        <div class="container-xl px-4 mt-4 main-bg-color">
          <div class="row">
            <div class="custom-col-xl-8">

              <!-- 업체 조회 -->
              <div class="card mb-4 margin-top">
                <div class="card-header content_title">업체 조회</div>
                <div class="card-body">
                  <table id="datatablesSimple">
                    <thead>
                      <tr>
                        <th>푸드트럭 업체명</th>
                        <th>성명</th>
                        <th>사업자번호</th>
                        <th>전화번호</th>
                      </tr>
                    </thead>

                    <tbody>
                      <c:forEach var="ft" items="${selectFoodTruck}">
                        <tr>
                          <td>
                            <div class="d-flex align-items-center">${ft.ft_name}</div>
                          </td>
                          <td>${ft.ft_owner}</td>
                          <td>${ft.ft_bno}</td>
                          <td>${ft.ft_tel}</td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
              <!-- 업체 조회 -->

              <% 
              	HttpSession sessions = request.getSession(); 
              	List<FestivalVO> selectFestival = (List<FestivalVO>)sessions.getAttribute("selectFestival");
              %>
					
                  <!-- 업체 등록 -->
                  <div class="card mb-4">
                    <div class="card-header content_title">참여 업체 등록</div>
                    
                    <form action="addList.do" method="post" onsubmit="return validateForm()">
                      <div class="card-body">
                        <!-- Form Row-->
                        <div class="row gx-3 mb-3">
                        
                        <!-- Hidden input -->
						<input type="hidden" id="selectedFestivalName" name="selectedFestivalName" value="">
                        <input type="hidden" id="selectedFestivalStart" name="selectedFestivalStart" value="">
                        <input type="hidden" id="selectedFestivalEnd" name="selectedFestivalEnd" value="">
                        <input type="hidden" id="selectedFestivalBooth" name="selectedFestivalBooth" value="">
                        <input type="hidden" id="loginId" name="loginId" value="${loginId}">
                        
                          
                          <div class="mb-3">
                            <label class="small mb-1 font-setting" for="inputFirstName">축제명</label>
                            <div name="festival_name">
                              <select id="festivalSelect" class="form-select" aria-label="Default select example">
                              	<option>축제를 선택해 주세요.</option>
                                <c:forEach var="f" items="${selectFestival}">
                                  <c:if test="${loginId==f.admin_id}">
                                    <option value="${f.ft_idx}">${f.fes_name}</option>
                                  </c:if>
                                </c:forEach>
                              </select>
                            </div>
                          </div>
                          
                          <div class="col-md-6">
                            <label class="small mb-1 font-setting" for="inputFirstName">축제 시작 날짜</label>
                            <div>
                                <input id="festivalStartSelect" class="btn">
                            </div>
                          </div>
                        
                        
                          <div class="col-md-6">
                            <label class="small mb-1 font-setting" for="inputFirstName">축제 종료 날짜</label>
                            <div>
                              <input id="festivalEndSelect" class="btn">
                            </div>
                          </div>
                        </div>
                        
                        <div class="mb-3 margin-top">
                          <label class="small mb-1 font-setting">부스번호(지정위치 번호)</label>
                          <select id="boothSelect" class="form-select" aria-label="Default select example">
                              <option value=""></option>
                          </select>
                        </div>
                     
                        <div class="mb-3">
                          <label class="small mb-1 font-setting" for="inputLastName">사업자번호</label>
                          <input name="input_bno" class="form-control" id="inputFirstName" type="text" placeholder="지정할 사업자번호를 입력하세요."
                            value="">
                        </div>
                        <!-- Submit button-->
		                  <div class="card mb-4">
		                        <button class="btn btn-primary addbtn-color" type="submit" onclick="setSelectedFestivalName();">추가하기</button>
		                  </div>
                      </div>
                      
                      </form>
                      
                      </div>
                  </div>
            </div>
            
            <div class="card margin-bottom">
              <div class="card-header content_title">등록한 업체</div>
              <div class="card-body">
                <table id="datatablesSimple">
                  <thead>
                    <tr>
                      <th>축제명</th>
                      <th>축제기간</th>
                      <th>부스번호</th>
                      <th>사업자번호</th>
                      <th>Actions</th>
                    </tr>
                  </thead>

                  <tbody>
                    <c:forEach var="a" items="${selectAddList}">
                    <c:if test="${loginId==a.admin_id}">
                      <tr>
                        <td>
                          <div class="d-flex align-items-center">${a.fes_name}</div>
                        </td>
                        <td>${a.fes_start} ~ ${a.fes_end}</td>
                        <td>${a.fes_loc_name}</td>
                        <td>${a.ft_bno}</td>
                        <td><a class="btn btn-datatable btn-icon btn-transparent-dark" href="deleteList.do?num=${a.list_idx}" onclick="confirmDelete(${a.list_idx})"><i
                              data-feather="trash-2"></i></a>
                        </td>
                      </tr>
                     </c:if>
                     </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
            
            
          </div>
			</main>
			
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script>
        document.getElementById("festivalSelect").addEventListener("change", function() {
            var festivalSelect = document.getElementById("festivalSelect");
            var selectedFestival = festivalSelect.options[festivalSelect.selectedIndex].value;
			
            var festivalStartSelect = document.getElementById("festivalStartSelect");
            var festivalEndSelect = document.getElementById("festivalEndSelect");

            $.ajax({
        		url : 'http://localhost:8081/QRservice/getfesdate.do?ft_idx='+selectedFestival,

        		success : function(result) {
					console.log(result)
					var data = JSON.parse(result);
				    
				   
				    var startDate = data.startDate;
				    var endDate = data.endDate;
				    
				    console.log("startDate", startDate); 
				    console.log("endDate", endDate);   
				   
				    festivalStartSelect.value = startDate;
				    festivalEndSelect.value = endDate;
        		},
        		error : function() {

        		}
        	});


           
            getBooths(selectedFestival);
        });
        
        function getBooths(selectedFestival) {
        	 $.ajax({
         		url : 'http://localhost:8081/QRservice/getfesti_loc.do?fes_idx='+selectedFestival,

         		success : function(result) {
 					console.log(result);
 					
 					var selectElement = document.getElementById("boothSelect");
 				    
 				    
 				    while (selectElement.firstChild) {
 				        selectElement.removeChild(selectElement.firstChild);
 				    }
 					
 					result.forEach(function(item) {
 				        var option = document.createElement("option"); 
 				        option.value = item.locationName; 
 				        option.textContent = item.locationName; 
 				        document.getElementById("boothSelect").appendChild(option); 
 				    });
         		},
         		error : function() {

         		}
         	});
        }
            	

function setSelectedFestivalName() {
	var festivalSelect = document.getElementById("festivalSelect");
    var selectedFestival = festivalSelect.options[festivalSelect.selectedIndex].innerText;
    console.log("festivalSelect ",selectedFestival);
    var festivalStartSelect = document.getElementById("festivalStartSelect").value;
    var festivalEndSelect = document.getElementById("festivalEndSelect").value;
    var boothSelect = document.getElementById("boothSelect").value;
    
    document.getElementById("selectedFestivalName").value = selectedFestival;
    document.getElementById("selectedFestivalStart").value = festivalStartSelect;
    document.getElementById("selectedFestivalEnd").value = festivalEndSelect;
    document.getElementById("selectedFestivalBooth").value = boothSelect;
    
}


function validateForm() {
    var businessNumber = document.getElementById("inputFirstName").value;

    if (businessNumber === "") {
       
        alert("사업자 번호를 입력하세요.");
        return false; 
    }

   
    return true;
}

function confirmDelete(listIdx) {
    if (confirm("삭제하시겠습니까?")) {
       
        window.location.href = "deleteList.do?num=" + listIdx;
    } else {
       
    	event.preventDefault();
    }
}

</script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables/datatables-simple-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
