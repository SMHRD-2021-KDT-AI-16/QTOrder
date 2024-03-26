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
</head>
<body style="background-color: #FA823C">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container-xl px-4">
					<div class="row justify-content-center">
						<div class="col-lg-5">							
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header justify-content-center">
									<h3 class="fw-light my-4">사업자 회원 로그인</h3>
								</div>
								<div class="card-body">
									<form>
										<div class="mb-3">
											<label class="small mb-1" for="businessNumber">사업자번호</label>
											<input class="form-control" id="businessNumber" type="text" placeholder="사업자번호를 입력해주세요" oninput="addHyphen(this)" />
										</div>
									
										<div class="mb-3">
											<label class="small mb-1" for="inputPassword">비밀번호</label>
											<input class="form-control" id="inputPassword" type="text" placeholder="비밀번호를 입력해주세요." />
										</div>
										<a href="foodtruck_join.jsp">회원가입</a>
										<div class="d-flex align-items-center justify-content-between mt-4 mb-0">
											<button class="btn btn-qtbtn btn-block" onclick="login()" type="button">로그인</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
		<div id="layoutAuthentication_footer">
			<footer class="footer-admin mt-auto footer-dark">
				<div class="container-xl px-4">
					<div class="row">
						<div class="col-md-6 small">Copyright &copy; Your Website 2021</div>
						<div class="col-md-6 text-md-end small">
							<a href="#!">Privacy Policy</a> &middot; <a href="#!">Terms &amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
		function login() {
			let b_num = document.getElementById("businessNumber").value;
			let pass = document.getElementById("inputPassword").value;
			
			$.ajax({
				url : 'http://localhost:8081/QRservice/fd_login.do',
				type : "POST",
				data :{
					b_num:b_num, // 사업자번호
					pass:pass // 비밀번호
				},

				success : function(result) {
					if(result){
						alert("로그인 성공");
						
						window.location.href = "order3.jsp";
					}else{
						alert("사업자 번호 혹은 비밀번호를 확인해 주세요.");
					}
				},
				error : function() {

				}
			});
		}
		function addHyphen(input) {
		    
			var numOnly = input.value.replace(/\-/g, '');
		    var num = input.value;

		    if (num.length >= 12) {
		        input.value = num.substring(0, 12);
		        return;
		    }
		    
		    var formattedNum = '';
		    for (var i = 0; i < numOnly.length; i++) {
		        if ((i === 3 || i === 5) && i < 10) {
		            formattedNum += '-';
		        }
		        formattedNum += numOnly.charAt(i);
		    }

		    input.value = formattedNum;
		}
	</script>
</body>
</html>
