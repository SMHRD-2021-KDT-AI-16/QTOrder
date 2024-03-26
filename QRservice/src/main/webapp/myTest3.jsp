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
			
			.drag-container {
			  margin: 10px;
			  padding: 10px;
			  background-color: #b5c1dc57;
			  border-radius: 8px;
			}
			
			.drag-menu {
				background-color: #ffffff;
			}
		</style>
		<meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Affiliate Dashboard - SB Admin Pro</title>
        <link href="https://cdn.jsdelivr.net/npm/litepicker/dist/css/litepicker.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body class="nav-fixed">
        <nav class="topnav navbar navbar-expand shadow justify-content-between justify-content-sm-start navbar-light bg-white" id="sidenavAccordion">
            <!-- Sidenav Toggle Button-->
            <button class="btn btn-icon btn-transparent-dark order-1 order-lg-0 me-2 ms-lg-2 me-lg-0" id="sidebarToggle"><i data-feather="menu"></i></button>
            <!-- Navbar Brand-->
            <!-- * * Tip * * You can use text or an image for your navbar brand.-->
            <!-- * * * * * * When using an image, we recommend the SVG format.-->
            <!-- * * * * * * Dimensions: Maximum height: 32px, maximum width: 240px-->
            <a class="navbar-brand pe-3 ps-4 ps-lg-2" href="index.html">SB Admin Pro</a>
            <!-- Navbar Search Input-->
            <!-- * * Note: * * Visible only on and above the lg breakpoint-->
            <form class="form-inline me-auto d-none d-lg-block me-3">
                <div class="input-group input-group-joined input-group-solid">
                    <input class="form-control pe-0" type="search" placeholder="Search" aria-label="Search" />
                    <div class="input-group-text"><i data-feather="search"></i></div>
                </div>
            </form>
            <!-- Navbar Items-->
            <ul class="navbar-nav align-items-center ms-auto">
                <!-- Documentation Dropdown-->
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
                            <!-- Sidenav Menu Heading (Account)-->
                            <!-- * * Note: * * Visible only on and above the sm breakpoint-->
                            <div class="sidenav-menu-heading d-sm-none">Account</div>
                            <!-- Sidenav Link (Alerts)-->
                            <!-- * * Note: * * Visible only on and above the sm breakpoint-->
                            <a class="nav-link d-sm-none" href="#!">
                                <div class="nav-link-icon"><i data-feather="bell"></i></div>
                                Alerts
                                <span class="badge bg-warning-soft text-warning ms-auto">4 New!</span>
                            </a>
                            <!-- Sidenav Link (Messages)-->
                            <!-- * * Note: * * Visible only on and above the sm breakpoint-->
                            <a class="nav-link d-sm-none" href="#!">
                                <div class="nav-link-icon"><i data-feather="mail"></i></div>
                                Messages
                                <span class="badge bg-success-soft text-success ms-auto">2 New!</span>
                            </a>
                            <!-- Sidenav Menu Heading (Core)-->
                            <div class="sidenav-menu-heading">Core</div>
                            <!-- Sidenav Accordion (Dashboard)-->
                            <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapseDashboards" aria-expanded="false" aria-controls="collapseDashboards">
                                <div class="nav-link-icon"><i data-feather="activity"></i></div>
                                Dashboards
                                <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseDashboards" data-bs-parent="#accordionSidenav">
                                <nav class="sidenav-menu-nested nav accordion" id="accordionSidenavPages">
                                    <a class="nav-link" href="dashboard-1.html">
                                        Default
                                        <span class="badge bg-primary-soft text-primary ms-auto">Updated</span>
                                    </a>
                                    <a class="nav-link" href="dashboard-2.html">Multipurpose</a>
                                    <a class="nav-link" href="dashboard-3.html">Affiliate</a>
                                </nav>
                            </div>
                            <div class="sidenav-menu-heading">Foodtruck</div>
                            <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="nav-link-icon"><i data-feather="grid"></i></div>
                                Menu
                                <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" data-bs-parent="#accordionSidenav">
                                <nav class="sidenav-menu-nested nav accordion" id="accordionSidenavPagesMenu">
                                    <a class="nav-link" href="myTest.jsp">메인 사진</a>
                                    <a class="nav-link" href="myTest2.jsp">메뉴 등록</a>
                                    <a class="nav-link" href="myTest3.jsp">설정</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapseApps" aria-expanded="false" aria-controls="collapseApps">
                                <div class="nav-link-icon"><i data-feather="globe"></i></div>
                                Order
                                <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseApps" data-bs-parent="#accordionSidenav">
                                <nav class="sidenav-menu-nested nav accordion" id="accordionSidenavAppsMenu">
                                    <a class="nav-link" href="order.jsp">주문 현황</a>
                                    <a class="nav-link" href="#!">주문 표</a>
                                </nav>
                            </div>
                            
                        </div>
                    </div>
                    <!-- Sidenav Footer-->
                    <div class="sidenav-footer">
                        <div class="sidenav-footer-content">
                            <div class="sidenav-footer-subtitle">Logged in as:</div>
                            <div class="sidenav-footer-title">Valerie Luna</div>
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
                        	<a class = "nav-link " href = "myTest2.jsp">메뉴 등록</a>
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
										   	//System.out.println(filePath);
										  }
										} 
									%>
                                    <div class="card-body px-0" id='main-menu-list'>           
	                                    <%
	                                    	for(int i = 0; i < listMenuVO.size(); i++) { 
	                                    		if(listMenuVO.get(i).getMenu_main() == 1) { %>
	                                    			<div class="d-flex align-items-center justify-content-between px-4">
					                                    <div class="d-flex align-items-center">
					                                        <!-- <i class="fab fa-cc-visa fa-2x cc-color-visa"></i> -->
					                                        <img class = 'image-thumnail' 
                                           						 src = '${ session_img }/<%= files[0].getName() %>' >
					                                        <div class="ms-4">
					                                            <div class="small">
					                                            	<%= listMenuVO.get(i).getMenu_name() %>
					                                            </div>
					                                        </div>
					                                    </div>
					                                    <div class="ms-4 small">
					                                        <!-- <div class="badge bg-light text-dark me-3">Default</div> -->
					                                        <%-- <a class="badge bg-info text-white rounded-pill" href="DeleteMainMenu?menu=<%= listMenuVO.get(i).getMenu_name()%>">Delete</a> --%>
					                                    	<button class="btn btn-outline-indigo btn-sm rounded-pill" onclick="deleteMainMenu('<%= listMenuVO.get(i).getMenu_name()%>')">Delete</button>
					                                    </div>
					                                </div>
					                                <hr />
	                                    <%	}	} %>		                                	
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
			 			`	<div class="d-flex align-items-center justify-content-between px-4">
				 				<div class="d-flex align-items-center">
				 					<img class = 'image-thumnail' 
	                               		src = 'http://localhost:8082/QRservice/assets/img/hotdog/main1.jpg' >
	                               	<div class="ms-4">
	                               		<div class="small">
	                               			\${ temp }
	                               		</div>
	                               	</div>
	                             </div>
			                     <div class="ms-4 small">
			                                        <!-- <div class="badge bg-light text-dark me-3">Default</div> -->
			                                        <%-- <a class="badge bg-info text-white rounded-pill" href="DeleteMainMenu?menu=<%= listMenuVO.get(i).getMenu_name()%>">Delete</a> --%>
			                     	<button class="btn btn-outline-indigo btn-sm rounded-pill" onclick="deleteMainMenu('\${ temp }')">Delete</button>
			                     </div>
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
    		}, 1000)    		
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