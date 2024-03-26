<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.io.*"%>
<%@ page import="kr.qtorder.model.MenuVO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.HashSet"%>
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
			
			.order-box {
			  width: 300px;
			  border-radius: 8px;
			  overflow: hidden;
			  margin: 100px auto;
			  transition: all 0.3s cubic-bezier(0.42, 0.0, 0.58, 1.0);
			}
			
			.order-box:hover {
			  box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
			  transform: translateY(-10px);
			}
			
			.order-box * {
			  padding: 10px;
			}
			
			.order-box .heading {
			  font-size: 28px;
			}
			
			.order-box .data {
			  display: flex;
			  flex-direction: column;
			  font-size: 12px;
			  color: #666;
			}
			
			.order-box .data span {
			  padding: 0;
			}
			
			.order-box .data .date {
			  margin-bottom: 2px;
			}
			
			.order-box .data .user-id {
			  font-size: 16px;
			  color: #000;
			  font-weight: 600;
			}
			
			.order-box .texts {
			  font-size: 14px;
			  line-height: 18px;
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
        <link href="css/orderslide.css" rel="stylesheet" />
        <link href="css/table.css" rel="stylesheet" />
        <link href="css/neumorphism.css" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
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
                    <div class="px-4 mt-5">
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
						<div class="row" >
							<div class="row col-lg-9 mb-4 ms-3">
								<div id="order-info-list" class="wrapper col-lg-3 mb-4" style="background-color: #ffffff">	
									<div class="row">
									</div>
								</div>
								<div id="order-menu-list" class="wrapper col-lg-7 mb-4" style="background-color: #ffffff; margin-left: 2rem">
									<div class="row">										
									</div>
								</div>
							</div>
							<%
	                            	List<HashMap<String, Object>> orderList = (List)session.getAttribute("orderlist");

									List<Integer> temp = new ArrayList<>();
	                            	for(int i = 0; i < orderList.size(); i++) {
	                            		temp.add(Integer.parseInt((orderList.get(i)).get("order_idx").toString()));
	                            	}
	                            	Set<Integer> set = new HashSet<Integer>(temp);
	                            	List<Integer> newList = new ArrayList<Integer>(set);
	                            	
	                            	//System.out.println(newList);
	                            	/* for(int i = 0; i < orderList.size(); i++) {
	                            		if(order_max <= Integer.parseInt((orderList.get(i)).get("order_idx").toString())) {
	                            			order_max = Integer.parseInt((orderList.get(i)).get("order_idx").toString());
	                            		}
	                            	} */
	                            	
	                        %>
							<div class="col-lg-1 mb-4" style="margin-right: 2rem">
								<table>
									<thead>
										<tr>
											<th>주문번호</th>
											<th>주문내용</th>
											<th>주문상태</th>
										</tr>
									</thead>
									<tbody id="order-table">
									    	<%
									    		int row = 0;
									    		for(int i = 10; i < newList.size(); i++) { %>									    			
									    			<tr class="lift">
									    				<td style='font-size: 2rem'><%= newList.get(i) %></td>
									    				<td>
									    				<%
									    					for(int j = 0; j < orderList.size(); j++) {
									    						if(newList.get(i) == Integer.parseInt((orderList.get(j)).get("order_idx").toString())) { %>
									    							<%= (orderList.get(j)).get("menu_name") %> <%= (orderList.get(j)).get("menu_cnt") %>개<br>
									    									
									    					<%	}
									    					}
									    				%>			
									    				</td>			
													    <td><span class="badge badge-info"><%= (orderList.get(i)).get("order_state") %></span></td>
													</tr>
									    	<%									    			
									    		}									    	
									    	%>
									</tbody>
								</table>                                
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
    	let interval;
    	let order_table = document.getElementById('order-table');
    	let order_menu_list = document.getElementById("order-menu-list")
    	let order_info_list = document.getElementById("order-info-list")
    	function myTest(order_idx) {
    		$.ajax({
    			type: "get",
    			url: "SelectOrderMenuDetail",
    			data: {"order_idx" : order_idx},
    			dataType: "json",
    			success: function(data) {
    				console.log(data)
    				order_menu_list.innerText = "";
    				order_info_list.innerText = "";
    				let element = ""
    				element += `
    					<div class="row">
    				`;
    				for(let i = 0 ; i < data.length; i++) {
    					element += `
    						<div class="name"> \${ data[i].menu_name } \${ data[i].menu_cnt }개</div>
							<div class="name"> \${ data[i].mo_name } : \${ data[i].mo_notice }</div>
							<hr />
    					`;
    				}
							
					element += `
						</div>
    				`;
    				order_menu_list.insertAdjacentHTML("afterbegin", element)	
    				let total_price = 0;
    				for(let i = 0; i < data.length; i++) {
    					total_price += data[i].menu_price * data[i].menu_cnt
    				}
    				element = `
    					<div class="name">주문 금액 : \${ total_price }원 </div>
						<div class="name">주문 시간</div>
						<div class="name">주문 번호</div>
    				`;
    				order_info_list.insertAdjacentHTML("afterbegin", element)	
    			},
    			error: function() {
    				console.log("error");
    			}
    		})
    	}
    	function startInterval() {
    		interval = setInterval( () => {
    			$.ajax({
    				type: "get", 			//1.서버에 요청하는 방식(get/post) 
    				url: "CreateOrderList", 		//2.서버에 요청되는 주소 
    				//data : {'menu' : menu_name}, //3.클라이언트가 서버에 전달할 데이터 
    				dataType: "json", 		//4.서버로부터 받아온 응답 데이터의 타입
    				success: function (data) { //5-1.요청에 대한 응답이 성공했을때 동작할 함수
    				 	showOrderAll(data);
    					//console.log(data);
    				},
    				error: function () { //5-2.요청에 대한 응답이 실패했을때 동작할 함수
    					console.log("error");
    				}
    			});
    		}, 1000)
    	}
    	function stopInterval() {
    		clearInterval(interval);
    	}
		
		order_table.addEventListener("mouseover", (event) => {
			stopInterval();
		})
		order_table.addEventListener("mouseout", (event) => {
			startInterval();
		})
		
		startInterval();
		
		function showOrderAll(data) {
	    	
	 		let element = '';
	 		order_table.innerText = '';
	 		let orderList = [];
	 		newList = <%= newList %>
	 		
	 		for(let i = 0; i < newList.length; i++) { 	
	 			element = element + 
	 				`<tr class="lift" onclick="myTest(\${ newList[i] })">
	 					<td style='font-size: 2rem'> \${ newList[i] } </td>
	 				<td>`;
	 				for(let j = 0; j < data.length; j++) {
						if(newList[i] == data[j].order_idx.toString()) { 
							element += `\${ data[j].menu_name }  \${ data[j].menu_cnt } 개<br>`;										
						}
					}
	 				element += 
						`</td>			
					    	<td><span class="badge badge-info">  \${ data[i].order_state } </span></td>
						</tr>`;
	 		}
	 		order_table.insertAdjacentHTML("afterbegin", element)	
		}

	</script>
</body>
</html>