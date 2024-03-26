<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
        <style>
    
    .flatpickr-input[type="text"] {
      background-color: #ffffff; /* 원하는 색상으로 변경 */
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
                <!-- Messages Dropdown-->
                <li class="nav-item dropdown no-caret d-none d-sm-block me-3 dropdown-notifications">
                    <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownMessages" href="javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i data-feather="mail"></i></a>
                    <div class="dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up" aria-labelledby="navbarDropdownMessages">
                        <h6 class="dropdown-header dropdown-notifications-header">
                            <i class="me-2" data-feather="mail"></i>
                            Message Center
                        </h6>
                        <!-- Example Message 1  -->
                        <a class="dropdown-item dropdown-notifications-item" href="#!">
                            <img class="dropdown-notifications-item-img" src="assets/img/illustrations/profiles/profile-2.png" />
                            <div class="dropdown-notifications-item-content">
                                <div class="dropdown-notifications-item-content-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</div>
                                <div class="dropdown-notifications-item-content-details">Thomas Wilcox · 58m</div>
                            </div>
                        </a>
                        <!-- Example Message 2-->
                        <a class="dropdown-item dropdown-notifications-item" href="#!">
                            <img class="dropdown-notifications-item-img" src="assets/img/illustrations/profiles/profile-3.png" />
                            <div class="dropdown-notifications-item-content">
                                <div class="dropdown-notifications-item-content-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</div>
                                <div class="dropdown-notifications-item-content-details">Emily Fowler · 2d</div>
                            </div>
                        </a>
                        <!-- Example Message 3-->
                        <a class="dropdown-item dropdown-notifications-item" href="#!">
                            <img class="dropdown-notifications-item-img" src="assets/img/illustrations/profiles/profile-4.png" />
                            <div class="dropdown-notifications-item-content">
                                <div class="dropdown-notifications-item-content-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</div>
                                <div class="dropdown-notifications-item-content-details">Marshall Rosencrantz · 3d</div>
                            </div>
                        </a>
                        <!-- Example Message 4-->
                        <a class="dropdown-item dropdown-notifications-item" href="#!">
                            <img class="dropdown-notifications-item-img" src="assets/img/illustrations/profiles/profile-5.png" />
                            <div class="dropdown-notifications-item-content">
                                <div class="dropdown-notifications-item-content-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</div>
                                <div class="dropdown-notifications-item-content-details">Colby Newton · 3d</div>
                            </div>
                        </a>
                        <!-- Footer Link-->
                        <a class="dropdown-item dropdown-notifications-footer" href="#!">Read All Messages</a>
                    </div>
                </li>
                <!-- User Dropdown-->
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
                    
				<div class="container-xl px-4 mt-4">
					<div class="row">
						<div class="col-qt-8">
							<!-- Change password card-->
							<div class="card mb-4">
								<div class="card-header">
									<h1>축제/행사 정보 등록</h1>
								</div>
								<div class="card-body">
									<form action="fes.do" method="post">
										<div class="mb-3">
											<h3 class="mb-1">축제/행사 이름</h3>
											<input class="form-control" id="currentPassword"
												type="text" placeholder="축제명 / 행사명을 입력해주세요." name="fes_name"/>
										</div>

										<div class="mb-3">
									      <h3 class="mb-1">축제/행사 기간</h3>
									      <label class="small mb-1" for="fes_start">시작날짜</label>
									      <input class="form-control" id="fes_start" name="fes_start" type="text" placeholder="YYYY-MM-DD"/>
									      <label class="small mb-1" for="fes_end">종료날짜</label>
									      <input class="form-control" id="fes_end" name="fes_end" type="text" placeholder="YYYY-MM-DD"/>
									    </div>

										<div class="form-check">
											<input class="form-check-input" id="radioPrivacy1" type="radio" name="radioPrivacy" checked onchange="handleCheckboxChange()"/>
											<label class="form-check-label" for="radioPrivacy1">부스 구역설정 하기</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" id="radioPrivacy2" type="radio" name="radioPrivacy" onchange="handleCheckboxChange()" value="0"/>
											<label class="form-check-label" for="radioPrivacy2">부스 구역설정 안하기</label>
										</div>
										<div id="ch">
											<h3 style="color: red;">위치와 관련된 서비스가 불가능해집니다.</h3>
										</div>
										<div id="loc"  onchange="handleCheckboxChange()">
											<div id = "loc_col">
												<div>
													<input class="food_loc name" id="fes_loc_name1" type="text"
														placeholder="구역명을 입력해주세요" name="fes_loc_name1"/>
														
													<input class="food_loc loc_lat" id="loc_lat1" type="text"
														readonly="readonly" name="loc_lat1" />
														
													<input class="food_loc loc_lng" id="loc_lng1" type="text" readonly="readonly" name = "loc_lng1" />
													<button class="btn btn-qtbtn" onclick="add_loc()" type="button">추가</button>
												</div>
											</div>
											<div id="map" style="width: 100%; height: 500px">
												
											</div>
										</div>
										<button class="btn btn-primary" type="submit" >저장</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e193c7f773c86ecc8ab769e9704f781a&libraries=services,drawing"></script>
			<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
			<script>
				window.onload = function() {
					handleCheckboxChange();
					currentLocation();
				};
				
				// 날짜 입력부분
				document.addEventListener('DOMContentLoaded', function () {
					flatpickr("#fes_start", {
				    	dateFormat: "Y-m-d"
				    });

				    flatpickr("#fes_end", {
				    	dateFormat: "Y-m-d"
				    });
				});
				
				
				function handleCheckboxChange() {

					var checkbox1 = document.getElementById("radioPrivacy1");
					var checkbox2 = document.getElementById("radioPrivacy2");
					var inputField = document.getElementById("loc");
					var w_text = document.getElementById("ch");

					if (checkbox1.checked) {
						inputField.style.display = "block";
						w_text.style.display = "none";
					} else if (checkbox2.checked) {
						inputField.style.display = "none";
						w_text.style.display = "block";
					}
				}

				let loc_num = 1;

				function add_loc() {
					let lat = document.getElementById("loc_lat"+loc_num).value;
					console.log("test ",lat)
					if(!lat){
						alert("구역을 지정해주세요");
						return;
					}
					
					loc_num = loc_num + 1;
					document.getElementById("radioPrivacy1").value = loc_num;
					var loc = document.getElementById("loc_col");

					const div1 = document.createElement("div");

					const ip1 = document.createElement("input");
					ip1.id = "fes_loc_name"+loc_num;
					ip1.name = "fes_loc_name"+loc_num;
					ip1.className = "food_loc name" + loc_num;
					ip1.type = "text";
					ip1.placeholder = "구역명을 입력해주세요";

					const ip2 = document.createElement("input");
					ip2.id = "loc_lat"+loc_num;
					ip2.name = "loc_lat"+loc_num;
					ip2.className = "food_loc loc_lat" + loc_num;
					ip2.type = "text";
					ip2.readOnly = true;

					const ip3 = document.createElement("input");
					ip3.id = "loc_lng"+loc_num;
					ip3.name = "loc_lng"+loc_num;
					ip3.className = "food_loc loc_lng" + loc_num; // 수정된 부분
					ip3.type = "text";
					ip3.readOnly = true;

					const btn2 = document.createElement("button");
					btn2.id="delete_btn"+loc_num;
					btn2.className = "btn btn-qtbtn";
					btn2.innerText = "제거";
					btn2.type="button";
					btn2.onclick = (function(customOverlays) {
					    return function() {
					        loc_num = loc_num - 1;
					        let btnId = this.id;
					        let num = btnId.replace("delete_btn", "");
					        let loc_name = document.getElementById("fes_loc_name" + num).value;
					        
					        console.log("loc_name ", loc_name);
					        
					        let index = customOverlays.findIndex(function(overlay) {
					            return overlay.getContent() === '<div class="label" style="background-color: white; width:50px; text-align:center;">' + loc_name + '</div>';
					        });
					        console.log("index ", index);

					        if (index !== -1) {
					            markers[index].setMap(null);
					            customOverlays[index].setMap(null);
					            markers.splice(index, 1);
					            customOverlays.splice(index, 1);
					            console.log("customOverlays2 ",customOverlays)
					        }
					        loc.removeChild(div1);
					    };
					})(customOverlays); // createMap 함수 내에서 클로저로 customOverlays 배열 전달

					div1.appendChild(ip1);
					div1.appendChild(ip2);
					div1.appendChild(ip3);
					//div1.appendChild(btn1);
					div1.appendChild(btn2);

					loc.appendChild(div1);
				}

				let lat = 34.81183091553852;
				let lng = 126.3922304333026;
				
				function currentLocation() {
				    if (navigator.geolocation) {
				        navigator.geolocation.getCurrentPosition(function(position) {
				            lat = position.coords.latitude; // 위도
				            lng = position.coords.longitude; // 경도
				            
				            console.log("test : " + lat + "/" + lng);

				            // 위치 정보를 받아온 후에 지도를 생성
				            createMap();
				        });
				    } else {
				        // 위치 정보를 받아오지 못한 경우에 대한 처리
				    }
				    return true;
				}

				var markers = []; // 마커를 저장할 배열
				var customOverlays = []; // 커스텀 오버레이를 저장할 배열
				var clickListener; // 클릭 이벤트 리스너를 저장할 변수
				
				
				function createMap() {
				    var mapContainer = document.getElementById('map');
				    var mapOption = {
				        center: new kakao.maps.LatLng(lat, lng),
				        level: 3
				    };
				    var map = new kakao.maps.Map(mapContainer, mapOption);

				    if (clickListener) {
				        kakao.maps.event.removeListener(clickListener);
				    }
				    clickListener =  kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
				        var loc_name = $("#fes_loc_name"+loc_num).val();
				        if(!loc_name){
				            alert("구역명을 입력해주세요.")
				            return;
				        }
						
				        //
				        if (markers.length >= loc_num) {
				        	console.log("시작하자마자 커스텀오버레이 배열 현황 ", customOverlays);
				        	
				            var indexToRemove = markers.length-1; // 마지막으로 추가된 마커의 인덱스
				            console.log("마지막으로 추가된 마커의 인덱스 ",indexToRemove);
				            
				            var lastMarker = markers[indexToRemove]; // 마지막으로 추가된 마커
				            
				            var lastCustomOverlay = customOverlays[indexToRemove]; // 마지막으로 추가된 커스텀 오버레이
				            console.log("마지막으로 추가된 커스텀오버레이의 내용 ",lastCustomOverlay);
				            
				            lastMarker.setMap(null); 
				            lastCustomOverlay.setMap(null);
				            
				            console.log("맵상에서 삭제 후 커스텀오버레이 배열 현황 ", customOverlays);
				            
				            markers.splice(indexToRemove, 1); // 해당 인덱스의 마커 제거
				            
				            customOverlays.splice(indexToRemove, 1); // 해당 인덱스의 커스텀 오버레이 제거
				            console.log("커스텀오버레이 배열 현황 ", customOverlays);
				   
				        }

				        var latlng = mouseEvent.latLng;
				        var marker = new kakao.maps.Marker({
				            position: latlng
				        });
				        marker.setMap(map);

				        var loc_lat = latlng.getLat();
				        var loc_lng = latlng.getLng();

				        document.getElementById("loc_lat" + loc_num).value = loc_lat;
				        document.getElementById("loc_lng" + loc_num).value = loc_lng;

				        var content = '<div class="label" style="background-color: white; width:50px; text-align:center;">' + loc_name + '</div>';
				        var customOverlay = new kakao.maps.CustomOverlay({
				            position: latlng,
				            content: content,
				            yAnchor: 3
				        });
				        customOverlay.setMap(map);

				        markers.push(marker);
				        customOverlays.push(customOverlay);
				    });
				
				function setMarkers(map) {
					for (var i = 0; i < markers.length; i++) {
						markers[i].setMap(map);
					}
				}
			}
			
			</script>
			
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
