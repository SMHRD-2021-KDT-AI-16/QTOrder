<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
        <link rel="icon" type="image/x-icon" href="assets/img/logo_small.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
    </head>
    <body style="background-color: #FA823C">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container-xl px-4">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <!-- Basic registration form-->
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header justify-content-center"><h3 class="fw-light my-4">����� ȸ������</h3></div>
                                    <div class="card-body">

									<form>
										<div class="row gx-3">
											<div class="mb-3">
												<label class="small mb-1" for="business_num">����� ��ȣ</label>
												<input id="bus_num" class="form-control" id="business_num"
													type="text" placeholder="����ڹ�ȣ�� �Է����ּ���" oninput="addHyphen(this)" />
											</div>
										</div>
										<div class="row gx-3">
											<div class="col-md-6">
												
												<div class="mb-3">
													<label class="small mb-1" for="bus_name">�̸�</label>
													<input class="form-control" id="bus_name"
														type="text" placeholder="�̸��� �Է����ּ���" />
												</div>
											</div>
											<div class="col-md-6">
												
												<div class="mb-3">
													<label class="small mb-1" for="inputConfirmPassword">��������</label>
													<input class="form-control"
														id="open_date" type="text"
														placeholder="�������� Ȥ�� �������� �Է����ּ���." oninput="adddate_Hyphen(this)"/>
												</div>
											</div>
										</div>
										
										<button id="bus_btn" type="button" class="btn btn-qtbtn" onclick="bus_num_check()" value=0> ����� ��ȣ ��� Ȯ��</button>
										<button id="bus_btn2" type="button" class="btn btn-qtbtn" onclick="bus_num_check2()" value=0> ����� ��ȣ �ߺ� Ȯ��</button>
										<br>
										<span id="b_numcheck"></span>
										<div class="row gx-3">
											<div class="mb-3">
												<label class="small mb-1" for="bus_phone">��ȭ��ȣ</label>
												<input id="bus_phone" class="form-control" id="bus_phone"
													type="text" placeholder="��ȭ��ȣ�� �Է����ּ���" oninput="tel_Hyphen(this)"/>
											</div>
										</div>
										<div class="row gx-3">
											<div class="mb-3">
												<label class="small mb-1" for="ft_name">�����</label>
												<input id="ft_name" class="form-control" id="ft_name"
													type="text" placeholder="�����̸��� �Է����ּ���. ���� ���� �����մϴ�." />
											</div>
										</div>
										
										<div class="row gx-3">
											<div class="col-md-6">
												<div class="mb-3">
													<label class="small mb-1" for="inputPassword">��й�ȣ</label>
													<input class="form-control" id="inputPassword"
														type="password" placeholder="Enter password" />
												</div>
											</div>
											<div class="col-md-6">
												<div class="mb-3">
													<label class="small mb-1" for="inputConfirmPassword">��й�ȣ Ȯ��</label>
													<input class="form-control"
														id="inputConfirmPassword" type="password"
														placeholder="Confirm password" />
												</div>
											</div>
											<span id="passwordMismatch" style="color: red;"></span>
										</div>
										
										<button class="btn btn-qtbtn btn-block" onclick="join_check()" type="button">ȸ������</button>
									</form>
								</div>
                                    <div class="card-footer text-center">
                                        <div class="small"><a href="auth-login-basic.html">�̹� ȸ���̽Ű���? �α����������� �̵�</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
		<script type="text/javascript">
		
			function bus_num_check() {
				let num = document.getElementById("bus_num").value;
				let name = document.getElementById("bus_name").value;
				let date = document.getElementById("open_date").value;
				num = num.replaceAll("-","");
				date = date.replaceAll("-","");
				console.log("num ", num);
				var data = {
						  "businesses": [
							    {
							      "b_no": num,
							      "start_dt": date,
							      "p_nm": name,
							      "p_nm2": "",
							      "b_nm": "",
							      "corp_no": "",
							      "b_sector": "",
							      "b_type": "",
							      "b_adr": ""
							    }
							  ]
							}

				$.ajax({
					url : "https://api.odcloud.kr/api/nts-businessman/v1/validate?serviceKey=VsuwnPoY8dv9qf%2B33XYqkhFAM9bSBmNORC1IvY077FhF3IwpemXO6Rh9%2FE3uEq0SMHjS6zgoAfG1afxFD8nzHA%3D%3D", // serviceKey ���� xxxxxx�� �Է�
					type : "POST",
					data : JSON.stringify(data),
					dataType : "JSON",
					contentType : "application/json",
					accept : "application/json",
					success : function(result) {
						console.log(result);
						console.log(result.data[0].valid);
						let tax_type = result.data[0].valid;
						
						if (tax_type == "02") {
							alert("��ϵ��� ���� �����Դϴ�.");
							document.getElementById("bus_num").value = "";
							document.getElementById("bus_name").value = "";
							document.getElementById("open_date").value = "";
							document.getElementById("bus_btn").value = 0;
						} else {
							alert("Ȯ�οϷ�Ǿ����ϴ�.");
							document.getElementById("bus_btn").value = 1;
						}

					},
					error : function(result) {
						console.log(result.responseText);
					}
				});
			}

			function join_check() {
				let b_num = document.getElementById("bus_num").value;
				
				let pass = document.getElementById("inputPassword").value;
				let pass_check = document.getElementById("inputConfirmPassword").value;
				
//				console.log(b_num);
				if (b_num != "") {
					let btn_val = document.getElementById("bus_btn").value;
					let btn_val2 = document.getElementById("bus_btn2").value;
					if (btn_val == 0) {
						alert("����ڹ�ȣ Ȯ���� ���� �����̽��ϴ�.");

					} else {
						if(btn_val2 == 0){
							alert("����ڹ�ȣ �ߺ�Ȯ���� ���� �����̰ų� �̹� ��ϵ� ��ȣ�Դϴ�.");
						}else{
						if(pass !== pass_check || pass == ""){
							alert("�Է��Ͻ� ��й�ȣ�� �ٸ��ϴ�.")
						}else{
							let b_num = document.getElementById("bus_num").value;
							let b_name = document.getElementById("bus_name").value;
							let b_phone = document.getElementById("bus_phone").value;
							let ft_name = document.getElementById("ft_name").value;
							let pass = document.getElementById("inputPassword").value;
							
							$.ajax({
								url : 'http://localhost:8081/QRservice/fd_join.do',
								type : "POST",
								data :{
									b_num:b_num, 
									b_name:b_name, 
									b_phone:b_phone, 
									bf_name:ft_name, 
									pass:pass 
								},
								success : function(result) {
									if(result){
										alert("ȸ�������� �Ϸ��ϼ̽��ϴ�.");
										window.location.href = "foodtruck_login.jsp";
									}else{
										alert("���ͳ� ������ �Ҿ��� �մϴ�. ��� �� �ٽ� �õ����ּ���.")
									}
								},
								error : function() {

								}
							});
							
						}}
					}
				} else {
					alert("����ڹ�ȣ�� �Է����� �����̽��ϴ�.")
				}
			}
			
			function checkPasswordMatch() {
			    var password = $("#inputPassword").val();
			    var confirmPassword = $("#inputConfirmPassword").val();

			    if (password !== confirmPassword) {
			      $("#passwordMismatch").text("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			      $("#passwordMismatch").css('color', 'red')
			      return false;
			    } else {
			      $("#passwordMismatch").text("��й�ȣ�� ��ġ�մϴ�.");
			      $("#passwordMismatch").css('color', 'blue')
			      return true;
			    }
			  }

			  // �� ���� ���� ��й�ȣ Ȯ�� �Լ� ȣ��
			  $("form").submit(function (event) {
			    if (!checkPasswordMatch()) {
			      event.preventDefault(); // �� ���� ����
			    }
			  });

			  // ��й�ȣ �Է� �� �Ź� Ȯ��
			  $("#inputPassword, #inputConfirmPassword").keyup(checkPasswordMatch);
			  
			  
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
			  
			  function adddate_Hyphen(input) {
				    
				    var numOnly = input.value.replace(/\-/g, '');
				    var num = input.value;

				    if (num.length >= 10) {
				        input.value = num.substring(0, 10);
				        return;
				    }
				    
				    var formattedNum = '';
				    for (var i = 0; i < numOnly.length; i++) {
				        if ((i === 4 || i === 6) && i < 10) {
				            formattedNum += '-';
				        }
				        formattedNum += numOnly.charAt(i);
				    }

				    input.value = formattedNum;
				}
			  
			  function tel_Hyphen(input) {
				    var num = input.value.replace(/\D/g, '');
				    var num2 = input.value

				    
				    if (num.startsWith('010')) {
				        var formattedNum = '';
				        
				        if (num2.length >= 13) {
					        input.value = num2.substring(0, 13);
					        return;
					    }
				        
				        for (var i = 0; i < num.length; i++) {
				            if (i === 3 || i === 7) {
				                formattedNum += '-';
				            }
				            formattedNum += num[i];
				        }
				        	
				        input.value = formattedNum;
				    } else {
				    	if (num2.length >= 12) {
					        input.value = num2.substring(0, 12);
					        return;
					    }
				    	
				        var formattedNum = '';
				        for (var i = 0; i < num.length; i++) {
				        	if (i === 3 || i === 6) {
				                formattedNum += '-';
				            }
				            formattedNum += num[i];
				        }
				        
				        input.value = formattedNum;
				    }
				}

			  
			function bus_num_check2(){
				let b_num = document.getElementById("bus_num").value;
				let b_check = document.getElementById("b_numcheck");
				let b_btn2 = document.getElementById("bus_btn2");
				$.ajax({
					url : 'bus_check2.do?bus_num='+b_num,

					success : function(result) {
						console.log("result ", result.yn);
						if(result.yn == 0){
							b_check.innerText="��ϵ��� ���� ����ڹ�ȣ�Դϴ�.";
							b_check.style.color = "blue";
							b_btn2.value=1;
						}else{
							b_check.innerText="�̹� ��ϵ� ����ڹ�ȣ�Դϴ�.";
							b_check.style.color = "red";
						}
						
					},
					error : function() {
					}
				});
			}
		</script>
		<div id="layoutAuthentication_footer">
                <footer class="footer-admin mt-auto footer-dark">
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
