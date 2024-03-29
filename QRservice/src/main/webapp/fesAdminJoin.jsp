<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>페스티벌 관리자 회원가입</title>
  <link href="css/styles.css" rel="stylesheet" />
  <link rel="icon" type="image/x-icon" href="assets/img/logo_small.png" />
  <script data-search-pseudo-elements defer
    src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js"
    crossorigin="anonymous"></script>

  <style>
    .bg-color {
      background-color: #FA823C;
      border-color: #FA823C;
    }

    .text-col {
      color: black !important;
    }
  </style>


</head>

<body class="bg-color">
  <div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
      <main>
        <div class="container-xl px-4">
          <div class="row justify-content-center">
            <div class="col-lg-7">
              
              <div class="card shadow-lg border-0 rounded-lg mt-5">
                <div class="card-header justify-content-center">
                  <h3 class="fw-light my-4">페스티벌 관리자 회원가입</h3>
                </div>
                <div class="card-body">
                  
                  <form action="fesAdminJoin.do" method="post">
                    
                    <div class="row gx-3">
                      <div class="col-md-6">
                        
                        <div class="mb-3">
                          <label class="small mb-1">아이디</label>
                          <input class="form-control" name="admin_id" id="admin_id" type="text"
                            placeholder="Enter ID" />
                        </div>

                        <div class="mb-3">
                          <button id="checkButton" class="btn btn-primary btn-block bg-color">아이디 중복확인</button>
                          <br><span id="resultCheck"></span>
                        </div>

                      </div>
                    </div>
                    
                    <div class="row gx-3">
                      <div class="col-md-6">
                        
                        <div class="mb-3">
                          <label class="small mb-1">비밀번호</label>
                          <input class="form-control" id="admin_pw" name="admin_pw" type="password"
                            placeholder="Enter password" />
                        </div>
                      </div>
                      <div class="col-md-6">
                        
                        <div class="mb-3">
                          <label class="small mb-1">비밀번호 확인</label>
                          <input class="form-control" id="admin_pw_check" name="admin_pw_check" type="password"
                            placeholder="Confirm password" />
                          <span id="passwordMismatch" style="color: red;"></span>
                        </div>
                      </div>
                    </div>
                    
                    <button id="submitbutton" class="btn btn-primary btn-block bg-color" type="submit">회원가입하기</button>
                  </form>
                </div>
                <div class="card-footer text-center">
                  <div class="small"><a class="text-col" href="fesAdminLogin.do">계정이 이미 있으신가요?</a></div>
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
</body>

<!-- 아이디 중복 확인 -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
  $('#checkButton').click(function (event) {
    event.preventDefault(); // 폼 제출 방지
    checkDuplicate(); // 중복 확인 함수 호출
  });

  function checkDuplicate() {
    var admin_id = $("#admin_id").val();
    $.ajax({
      url: 'IdCheck.do',
      data: { 'admin_id': admin_id },
      type: 'get',
      success: function (data) {
        if (data == 'true') {
          $('#resultCheck').text('사용할 수 없는 아이디입니다').css('color', 'red');
        } else if (data == 'false') {
          $('#resultCheck').text('사용할 수 있는 아이디입니다').css('color', 'blue');
        }
      },
      error: function () {
        alert('통신실패');
      }
    });
  }
</script>

<script>
  $('#submitbutton').click(function (event) {
    event.preventDefault(); // 폼 제출 방지
    stopSubmit();
  });

  function stopSubmit() {
    var admin_id = $("#admin_id").val();
    var password = $("#admin_pw").val();
    var confirmPassword = $("#admin_pw_check").val();
    $.ajax({
      url: 'IdCheck.do',
      data: { 'admin_id': admin_id },
      type: 'get',
      success: function (data) {
        if (data == 'true') {
          alert('중복된 아이디 입니다.')
          return false;
        } else if (data == 'false') {
          if (password != confirmPassword) {
            alert('비밀번호가 일치하지 않습니다')
            return false;
          } else {
            $("form").unbind('submit').submit();
            return true;
          }
        }
      },
      error: function () {
        alert('통신실패');
      }
    });
  }
</script>

<!-- 비밀번호 일치 확인 -->
<script>
  // 비밀번호 확인 함수
  function checkPasswordMatch() {
    var password = $("#admin_pw").val();
    var confirmPassword = $("#admin_pw_check").val();

    if (password !== confirmPassword) {
      $("#passwordMismatch").text("비밀번호가 일치하지 않습니다.");
      $("#passwordMismatch").css('color', 'red')
      return false;
    } else {
      $("#passwordMismatch").text("비밀번호가 일치합니다.");
      $("#passwordMismatch").css('color', 'blue')
      return true;
    }
  }

  // 폼 제출 전에 비밀번호 확인 함수 호출
  $("form").submit(function (event) {
    if (!checkPasswordMatch()) {
      event.preventDefault(); // 폼 제출 방지
    }
  });

  // 비밀번호 입력 시 매번 확인
  $("#admin_pw, #admin_pw_check").keyup(checkPasswordMatch);
</script>


</html>
