<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, kr.qtorder.model.NoticeVO"%>
<%@ page import="kr.qtorder.db.NoticeDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
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
    <link href="https://unpkg.com/easymde/dist/easymde.min.css" rel="stylesheet" />
    <link rel="icon" type="image/x-icon" href="assets/img/logo_small.png" />
    <script data-search-pseudo-elements defer
        src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js"
        crossorigin="anonymous"></script>
        
     <style>
    	.text-color{
    		color: white !important;
    		background-color: #FA823C;
    		border-color: #FA823C;
    	}
    	.title-set{
    		color: #FA823C !important;
    	}
    	.bg-color{
    		background-color: #FA823C;
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
            <main class="bg-color">
                <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
                    <div class="container-fluid px-4">
                        <div class="page-header-content">
                            <div class="row align-items-center justify-content-between pt-3">
                                <div class="col-auto mb-3">
                                    <h1 class="page-header-title">
                                        <div class="page-header-icon"><i data-feather="file-text"></i></div>
                                        공지사항 수정
                                    </h1>
                                </div>
                                <div class="col-12 col-xl-auto mb-3">
                                    <a class="btn btn-sm btn-light text-primary text-color" href="blog-management-posts-list.html">
                                        <i class="me-1" data-feather="arrow-left"></i>
                                        Back to All Posts
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </header>
                <!-- Main page content-->
                <% int num = Integer.parseInt(request.getParameter("num")); NoticeVO notice = new NoticeDAO().noticeDetail(num); %>
                <form action="noticeEdit.do" method="post">
                <div class="container-fluid px-4">
                    <div class="row gx-4">
                        <div class="col-lg-8">
                            <div class="card mb-4">
                                <div class="card-header title-set">Post Title</div>
                                <div class="card-body">
                                	<input type="hidden" name="notice_idx" value="<%= num %>">
                                	<input class="form-control" id="postTitleInput" type="text" name="noticeTitleEdit"
                                        placeholder="Enter your post title..."
                                        value="<%= notice.getNotice_title() %>" />
                                </div>
                            </div>
                            <div class="card card-header-actions mb-4 mb-lg-0">
                                <div class="card-header title-set">
                                    Post Content
                                    <i class="text-muted" data-feather="info" data-bs-toggle="tooltip"
                                        data-bs-placement="left"
                                        title="Markdown is supported within the post content editor."></i>
                                </div>
                                <div class="card-body">
                                    <textarea id="postEditor" name="noticeContentEdit"><%= notice.getNotice_content() %></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="card card-header-actions">
                                <div class="card-header title-set">
                                    Publish
                                    <i class="text-muted" data-feather="info" data-bs-toggle="tooltip"
                                        data-bs-placement="left"
                                        title="Your updates will be live once a moderator approves the changes."></i>
                                </div>
                                <div class="card-body">
                                    <div class="d-grid">
                                    	<button type="submit" class="fw-500 btn btn-primary text-color">Submit Updates</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </form>
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
    <script src="https://unpkg.com/easymde/dist/easymde.min.js" crossorigin="anonymous"></script>
    <script src="js/markdown.js"></script>
</body>

</html>