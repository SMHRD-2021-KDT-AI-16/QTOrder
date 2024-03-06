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
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="nav-fixed">
        <nav class="topnav navbar navbar-expand shadow justify-content-between justify-content-sm-start navbar-light bg-white" id="sidenavAccordion">
            
            <button class="btn btn-icon btn-transparent-dark order-1 order-lg-0 me-2 ms-lg-2 me-lg-0" id="sidebarToggle"><i data-feather="menu"></i></button>
            
            <img id="main_logo" class="navbar-brand pe-3 ps-4 ps-lg-2" src="assets/img/logo.png">
            
            <form class="form-inline me-auto d-none d-lg-block me-3">
                <div class="input-group input-group-joined input-group-solid">
                    <input class="form-control pe-0" type="search" placeholder="Search" aria-label="Search" />
                    <div class="input-group-text"><i data-feather="search"></i></div>
                </div>
            </form>
            
            <!-- 상단 바 -->
            <ul class="navbar-nav align-items-center ms-auto">
                <!-- 돋보기 아이콘 메뉴 -->
                <li class="nav-item dropdown no-caret me-3 dropdown-notifications">
                    <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownAlerts" href="javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i data-feather="bell"></i></a>
                    <div class="dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up" aria-labelledby="navbarDropdownAlerts">
                        <h6 class="dropdown-header dropdown-notifications-header">
                            <i class="me-2" data-feather="bell"></i>
                            Alerts Center
                        </h6>
                        <!-- 1번째 칸 내용 -->
                        <a class="dropdown-item dropdown-notifications-item" href="#!">
                            <div class="dropdown-notifications-item-icon bg-warning"><i data-feather="activity"></i></div>
                            <div class="dropdown-notifications-item-content">
                                <div class="dropdown-notifications-item-content-details">December 29, 2021</div>
                                <div class="dropdown-notifications-item-content-text">10분 뒤 주문하신 음식이 조리가 완료됩니다.</div>
                            </div>
                        </a>
                        
                        <a class="dropdown-item dropdown-notifications-item" href="#!">
                            <div class="dropdown-notifications-item-icon bg-info"><i data-feather="bar-chart"></i></div>
                            <div class="dropdown-notifications-item-content">
                                <div class="dropdown-notifications-item-content-details">December 22, 2021</div>
                                <div class="dropdown-notifications-item-content-text">집에갈래</div>
                            </div>
                        </a>
                        
                        <a class="dropdown-item dropdown-notifications-item" href="#!">
                            <div class="dropdown-notifications-item-icon bg-danger"><i class="fas fa-exclamation-triangle"></i></div>
                            <div class="dropdown-notifications-item-content">
                                <div class="dropdown-notifications-item-content-details">December 8, 2021</div>
                                <div class="dropdown-notifications-item-content-text">!!!!!!!!!!!!!!!</div>
                            </div>
                        </a>
                        
                        <a class="dropdown-item dropdown-notifications-item" href="#!">
                            <div class="dropdown-notifications-item-icon bg-success"><i data-feather="user-plus"></i></div>
                            <div class="dropdown-notifications-item-content">
                                <div class="dropdown-notifications-item-content-details">December 2, 2021</div>
                                <div class="dropdown-notifications-item-content-text">?????????????????</div>
                            </div>
                        </a>
                        <a class="dropdown-item dropdown-notifications-footer" href="#!">모든 알림 확인</a>
                    </div>
                </li>                
            </ul>
        </nav>
        <!-- 상단 숨겨진 메뉴 끝 -->

        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sidenav shadow-right sidenav-light">
                    <div class="sidenav-menu">
                        <div class="nav accordion" id="accordionSidenav">
                            
                            <div class="sidenav-menu-heading d-sm-none">Menu</div>
                            
                            <a class="nav-link d-sm-none" href="#!">
                                <div class="nav-link-icon"><i data-feather="bell"></i></div>
                                Home
                                <span class="badge bg-warning-soft text-warning ms-auto">4 New!</span>
                            </a>
                            <!-- Sidenav Link (Messages)-->
                            <!-- * * Note: * * Visible only on and above the sm breakpoint-->
                            <a class="nav-link d-sm-none" href="#!">
                                <div class="nav-link-icon"><i data-feather="mail"></i></div>
                                Account
                                <span class="badge bg-success-soft text-success ms-auto">2 New!</span>
                            </a>
                        </div>
                    </div>
                    <!-- 사이드 하단 -->
                    <div class="sidenav-footer">
                        <div class="sidenav-footer-content">
                            <div class="sidenav-footer-subtitle">Logged in as:</div>
                            <div class="sidenav-footer-title">Valerie Luna</div>
                        </div>
                    </div>
                </nav>
                <!--  사이드 끝 -->
            </div>

		<!-- 중앙 상단부 -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-xl px-4">
					<h4 class="mb-0 mt-5">장바구니</h4>
					<hr class="mt-2 mb-4" />
					<div class="card card-icon lift lift-sm mb-4" href="knowledge-base-category.html">
						<div class="row g-0">
							<div class="col">
								<div class="card-body py-4">
									<h5 class="card-title text-primary mb-2">음식이름</h5>
									<button class="btn">-</button>
									<p class="btn card-text mb-1">1</p>
									<button class="btn">+</button>
									<div class="small text-muted">가격</div>
								</div>
							</div>
						</div>
					</div>

					<div class="card card-icon lift lift-sm mb-4" href="knowledge-base-category.html">
						<div class="row g-0">
							<!-- <div class="col-auto card-icon-aside bg-primary">
								<i class="text-white-50" data-feather="compass"></i>
							</div> -->
							<div class="col">
								<div class="card-body py-4">
									<h5 class="card-title text-primary mb-2">음식이름</h5>
									<p class="card-text mb-1">1</p>
									<div class="small text-muted">가격</div>
								</div>
							</div>
						</div>
					</div>

					<div class="card card-icon lift lift-sm mb-4" href="knowledge-base-category.html">
						<div class="row g-0">
						<div class="col">
								<div class="card-body py-4">
									<h5 id="food_num" class="card-title text-primary mb-2">음식이름</h5>
									<button class="btn">-</button>
									<p class="btn card-text mb-1">1</p>
									<button id="food_num_plus"class="btn">+</button>
									<div class="small text-muted">가격</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<hr class="mt-2 mb-4" />
				<div class="container-xl px-4">
					<div class="d-flex align-items-center justify-content-between mt-4 mb-0">
						<div class="small">총 결제 금액 : 000000원</div>
						<a class="btn btn-qtbtn" type="button" href="test.do">결제</a>
					</div>
				</div>
			</main>
			<script type="text/javascript">
				function add_food_num(){
					let btn_id = document.getElementById("food_num_plus");
					let num = btn_id.previousSibling; /* 수량 부분 가져오기 */
					
				}
			
			</script>
			<footer class="footer-admin mt-auto footer-light">
				<div class="container-xl px-4">
					<div class="row">
						<div class="col-md-6 small">Copyright &copy; QTOrder 2024</div>
						<div class="col-md-6 text-md-end small">
							<a href="#!">Privacy Policy</a> &middot; <a href="#!">Terms &amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
