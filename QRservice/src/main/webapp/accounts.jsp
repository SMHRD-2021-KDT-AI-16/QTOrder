<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>QTOrder</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/litepicker/dist/css/litepicker.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <link href="css/yg.css" rel="stylesheet" />
    <link rel="icon" type="image/x-icon" href="assets/img/logo_small.png" />
    <script data-search-pseudo-elements defer
        src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js"
        crossorigin="anonymous"></script>
        
    <style>
    .header-bg {
    	background-image: linear-gradient(135deg, #FA823C 0%, rgba(251, 255, 90, 0.9) 100%) !important;
    }
    </style>
        
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
                <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10 header-bg">
                    <div class="container-xl px-4">
                        <div class="page-header-content pt-4">
                            <div class="row align-items-center justify-content-between">
                                <div class="col-auto mt-4">
                                    <h1 class="page-header-title">
                                        <div class="page-header-icon"><i data-feather="activity"></i></div>
                                        매출내역
                                    </h1>
                                    <div class="page-header-subtitle">
                                    </div>
                                </div>
                                <div class="col-12 col-xl-auto mt-4">
                                    <div class="input-group input-group-joined border-0" style="width: 16.5rem">
                                        <span class="input-group-text"><i class="text-primary"
                                                data-feather="calendar"></i></span>
                                        <input class="form-control ps-0 pointer" id="litepickerRangePlugin"
                                            placeholder="Select date range..." />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </header>
                <!-- Main page content-->
                <div class="container-xl px-4 mt-n10">
               		<!-- Example Colored Cards for Dashboard Demo-->
                	<div class="row">
                        <div class="col-lg-6 col-xl-3 mb-4">
                            <div class="card bg-primary text-white h-100">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="me-3">
                                            <div class="text-white-75 small">총 매출액</div>
                                            <div class="text-lg fw-bold">1,000,000원</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer d-flex align-items-center justify-content-between small">
                                    <a class="text-white stretched-link" href="#!">View Report</a>
                                    <div class="text-white"><i class="fas fa-angle-right"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-xl-3 mb-4">
                            <div class="card bg-warning text-white h-100">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="me-3">
                                            <div class="text-white-75 small">총 취소액</div>
                                            <div class="text-lg fw-bold">35,000원</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer d-flex align-items-center justify-content-between small">
                                    <a class="text-white stretched-link" href="#!">View Report</a>
                                    <div class="text-white"><i class="fas fa-angle-right"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-xl-3 mb-4">
                            <div class="card bg-success text-white h-100">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="me-3">
                                            <div class="text-white-75 small">총 할인액</div>
                                            <div class="text-lg fw-bold">50,000원</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer d-flex align-items-center justify-content-between small">
                                    <a class="text-white stretched-link" href="#!">View Tasks</a>
                                    <div class="text-white"><i class="fas fa-angle-right"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-xl-3 mb-4">
                            <div class="card bg-danger text-white h-100">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="me-3">
                                            <div class="text-white-75 small">실 매출액</div>
                                            <div class="text-lg fw-bold">915,000원</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer d-flex align-items-center justify-content-between small">
                                    <a class="text-white stretched-link" href="#!">View Requests</a>
                                    <div class="text-white"><i class="fas fa-angle-right"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="row">
                    
	            		<div class="col-xl-6 mb-4">
	                        <!-- Invoice table-->
	                        <div class="table-responsive">
	                            <table class="table table-borderless mb-0">
	                                <thead class="border-bottom">
	                                	<tr class="small text-uppercase text-muted">
	                                        <th scope="col">매출 내역</th>
	                                    </tr>
	                                    <tr class="small text-uppercase text-muted">
	                                        <th scope="col">구분</th>
	                                        <th class="text-end" scope="col"></th>
	                                        <th class="text-end" scope="col">건수</th>
	                                        <th class="text-end" scope="col">금액</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                    <!-- Invoice item 1-->
	                                    <tr class="border-bottom">
	                                        <td>
	                                            <div class="fw-bold">내점</div>
	                                        </td>
	                                        <td class="text-end fw-bold"></td>
	                                        <td class="text-end fw-bold">80</td>
	                                        <td class="text-end fw-bold">400,000</td>
	                                    </tr>
	                                    <!-- Invoice item 2-->
	                                    <tr class="border-bottom">
	                                        <td>
	                                            <div class="fw-bold">포장</div>
	                                        </td>
	                                        <td class="text-end fw-bold"></td>
	                                        <td class="text-end fw-bold">120</td>
	                                        <td class="text-end fw-bold">600,000</td>
	                                    </tr>
	                                    <!-- Invoice item 3-->
	                                    <tr class="border-bottom">
	                                        <td>
	                                            <div class="fw-bold">합계</div>
	                                        </td>
	                                        <td class="text-end fw-bold"></td>
	                                        <td class="text-end fw-bold">200</td>
	                                        <td class="text-end fw-bold">1,000,000</td>
	                                    </tr>
	                                    <!-- Invoice subtotal-->
	                                    <tr>
	                                        <td class="text-end pb-0" colspan="3"><div class="text-uppercase small fw-700 text-muted">카드매출</div></td>
	                                        <td class="text-end pb-0"><div class="h5 mb-0 fw-700">600,000</div></td>
	                                    </tr>
	                                    <!-- Invoice tax column-->
	                                    <tr>
	                                        <td class="text-end pb-0" colspan="3"><div class="text-uppercase small fw-700 text-muted">현금매출</div></td>
	                                        <td class="text-end pb-0"><div class="h5 mb-0 fw-700">400,000</div></td>
	                                    </tr>
	                                    <!-- Invoice total-->
	                                    <tr>
	                                        <td class="text-end pb-0" colspan="3"><div class="text-uppercase small fw-700 text-muted">합계</div></td>
	                                        <td class="text-end pb-0"><div class="h5 mb-0 fw-700 text-green">1,000,000</div></td>
	                                    </tr>
	                                </tbody>
	                            </table>
	                        </div>
	                    </div>
	                    
	                    <div class="col-xl-6 mb-4">
	                        <!-- Invoice table-->
	                        <div class="table-responsive">
	                            <table class="table table-borderless mb-0">
	                                <thead class="border-bottom">
	                                	<tr class="small text-uppercase text-muted">
	                                        <th scope="col">할인/취소 내역</th>
	                                    </tr>
	                                    <tr class="small text-uppercase text-muted">
	                                        <th scope="col">구분</th>
	                                        <th class="text-end" scope="col"></th>
	                                        <th class="text-end" scope="col">건수</th>
	                                        <th class="text-end" scope="col">금액</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                    <!-- Invoice item 1-->
	                                    <tr class="border-bottom">
	                                        <td>
	                                            <div class="fw-bold">할인</div>
	                                        </td>
	                                        <td class="text-end fw-bold"></td>
	                                        <td class="text-end fw-bold">100</td>
	                                        <td class="text-end fw-bold">50,000</td>
	                                    </tr>
	                                    <!-- Invoice item 2-->
	                                    <tr class="border-bottom">
	                                        <td>
	                                            <div class="fw-bold">취소</div>
	                                        </td>
	                                        <td class="text-end fw-bold"></td>
	                                        <td class="text-end fw-bold">7</td>
	                                        <td class="text-end fw-bold">35,000</td>
	                                    </tr>
	                                    <!-- Invoice item 3-->
	                                    <tr class="border-bottom">
	                                        <td>
	                                            <div class="fw-bold">합계</div>
	                                        </td>
	                                        <td class="text-end fw-bold"></td>
	                                        <td class="text-end fw-bold">107</td>
	                                        <td class="text-end fw-bold">85,000</td>
	                                    </tr>
	                                    <!-- Invoice subtotal-->
	                                    <tr>
	                                        <td class="text-end pb-0" colspan="3"><div class="text-uppercase small fw-700 text-muted">카드취소</div></td>
	                                        <td class="text-end pb-0"><div class="h5 mb-0 fw-700">60,000</div></td>
	                                    </tr>
	                                    <!-- Invoice tax column-->
	                                    <tr>
	                                        <td class="text-end pb-0" colspan="3"><div class="text-uppercase small fw-700 text-muted">현금취소</div></td>
	                                        <td class="text-end pb-0"><div class="h5 mb-0 fw-700">25,000</div></td>
	                                    </tr>
	                                    <!-- Invoice total-->
	                                    <tr>
	                                        <td class="text-end pb-0" colspan="3"><div class="text-uppercase small fw-700 text-muted">합계</div></td>
	                                        <td class="text-end pb-0"><div class="h5 mb-0 fw-700 text-red">85,000</div></td>
	                                    </tr>
	                                </tbody>
	                            </table>
	                        </div>
	                    </div>
	                    
	                    
                    
                    </div>
                    	
                    
                    <!-- Example Charts for Dashboard Demo-->
                    <div class="row">
                        <div class="col-xl-6 mb-4">
                            <div class="card card-header-actions h-100">
                                <div class="card-header">
                                    매출 추이
                                    <div class="dropdown no-caret">
                                        <button class="btn btn-transparent-dark btn-icon dropdown-toggle"
                                            id="areaChartDropdownExample" type="button" data-bs-toggle="dropdown"
                                            aria-haspopup="true" aria-expanded="false"><i class="text-gray-500"
                                                data-feather="more-vertical"></i></button>
                                        <div class="dropdown-menu dropdown-menu-end animated--fade-in-up"
                                            aria-labelledby="areaChartDropdownExample">
                                            <a class="dropdown-item" href="#!">Last 12 Months</a>
                                            <a class="dropdown-item" href="#!">Last 30 Days</a>
                                            <a class="dropdown-item" href="#!">Last 7 Days</a>
                                            <a class="dropdown-item" href="#!">This Month</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#!">Custom Range</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="chart-area"><canvas id="myAreaChart" width="100%" height="30"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 mb-4">
                            <div class="card card-header-actions h-100">
                                <div class="card-header">
                                    Monthly Revenue
                                    <div class="dropdown no-caret">
                                        <button class="btn btn-transparent-dark btn-icon dropdown-toggle"
                                            id="areaChartDropdownExample" type="button" data-bs-toggle="dropdown"
                                            aria-haspopup="true" aria-expanded="false"><i class="text-gray-500"
                                                data-feather="more-vertical"></i></button>
                                        <div class="dropdown-menu dropdown-menu-end animated--fade-in-up"
                                            aria-labelledby="areaChartDropdownExample">
                                            <a class="dropdown-item" href="#!">Last 12 Months</a>
                                            <a class="dropdown-item" href="#!">Last 30 Days</a>
                                            <a class="dropdown-item" href="#!">Last 7 Days</a>
                                            <a class="dropdown-item" href="#!">This Month</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#!">Custom Range</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="chart-bar"><canvas id="myBarChart" width="100%" height="30"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Example DataTable for Dashboard Demo-->
                    <div class="card mb-4">
                        <div class="card-header">Personnel Management</div>
                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>주문번호</th>
                                        <th>주문내역</th>
                                        <th>결제방식</th>
                                        <th>성함</th>
                                        <th>판매날짜</th>
                                        <th>판매금액</th>
                                        <th>상태</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>주문번호</th>
                                        <th>주문내역</th>
                                        <th>결제방식</th>
                                        <th>성함</th>
                                        <th>판매날짜</th>
                                        <th>판매금액</th>
                                        <th>상태</th>
                                    </tr>
                                </tfoot>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>치즈 롱다리 핫도그(2)</td>
                                        <td>카드</td>
                                        <td>김*수</td>
                                        <td>2024/03/19</td>
                                        <td>10,000</td>
                                        <td>
                                            <div class="badge bg-primary text-white rounded-pill">판매완료</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>불고기 토스트(1)</td>
                                        <td>카드</td>
                                        <td>이*훈</td>
                                        <td>2024/03/20</td>
                                        <td>4,000</td>
                                        <td>
                                            <div class="badge bg-warning rounded-pill">카드취소</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>핫커리 핫도그(2) 치즈 롱다리 핫도그(2)</td>
                                        <td>현금</td>
                                        <td>신*기</td>
                                        <td>2024/03/20</td>
                                        <td>16,000</td>
                                        <td>
                                            <div class="badge bg-primary text-white rounded-pill">판매완료</div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </main>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" crossorigin="anonymous"></script>
    <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="js/datatables/datatables-simple-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/litepicker/dist/bundle.js" crossorigin="anonymous"></script>
    <script src="js/litepicker.js"></script>
</body>

</html>