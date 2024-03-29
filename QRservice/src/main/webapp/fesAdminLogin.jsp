<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>페스티벌 관리자 로그인</title>
  <link href="css/styles.css" rel="stylesheet" />
  <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
  <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
  <style>
    body, html {
     height: 100%;
     margin: 0;
   }
   body {
      display: flex;
        justify-content: center; /* 가로 중앙 정렬 */
        align-items: center;
        min-height: 100vh; /* 뷰포트 높이의 최소 크기 지정 */
       flex-direction: column;
   }
    .slider__wrap {
       width: 100%;
       height: 100vh;
       display: flex;
       align-items: center;
       justify-content: center;
       position: absolute; /* 슬라이더를 배경으로 사용하기 위해 */
       top: 0;
       left: 0;
       width: 100%;
       height: 100%;
       z-index: -1;
    }
    .slider__img {
     position: fixed;
     top: 0;
     left: 0;
     width: 100%;
     height: 100%;
     z-index: -1;
   }
   .slider__inner { /* 이미지 움직이는 영역 */
      display: flex;
      flex-wrap: nowrap;
      width: 3200px;  /* 총 이미지가 4800px */
      height: 100vh;
   }
   .slider { /* 개별적인 이미지 */
      position: relative;
      width: 100%;
      height: 100vh;
      flex: 0 0 auto;
   }
   .slider img {
       width: 100%; /* 이미지 가로 폭을 부모 요소에 맞춤 */
       height: 100%; /* 이미지 세로 높이를 부모 요소에 맞춤 */
       object-fit: cover; /* 컨테이너에 맞게 이미지를 조정 */
       object-position: center; /* 이미지가 중앙에 위치하도록 설정 */
       filter: brightness(50%);
   }
   .card {
     opacity: 0.85; /* 카드의 배경이 약간 투명하게 보이게 하려면 */
   }
   .container-xl {
     /* height: 100%; */
     /* display: flex; */
     /* justify-content: center;
     align-items: center; */
     z-index: 10;
   }
  </style>

</head>

<body>
    <div class="slider__wrap">
        <div class="slider__img">
            <div class="slider__inner">
                <div class="slider s1"><img src="https://content.skyscnr.com/m/58008a95be7abe9d/original/eyeem-100010434-114562185.jpg?crop=1224px:647px&position=attention" alt="이미지1"></div>
                <div class="slider s2"><img src="https://cdn.kmecnews.co.kr/news/photo/202209/27147_15960_41.jpg" alt="이미지2"></div>
                <div class="slider s3"><img src="https://dimg.donga.com/wps/NEWS/IMAGE/2023/03/02/118124874.4.jpg" alt="이미지3"></div>
                <div class="slider s4"><img src="https://i.namu.wiki/i/JaudlPaMxzH-kbYH_b788UT_sX47F_ajB1hFH7s37d5CZUqOfA6vcoXMiW3E4--hG_PwgDcvQ6Hi021KyzghLQ.webp" alt="이미지4"></div>
            </div>
        </div>
    </div> 
      <!-- 더 많은 이미지들 
      "https://content.skyscnr.com/m/58008a95be7abe9d/original/eyeem-100010434-114562185.jpg?crop=1224px:647px&position=attention",
   "https://cdn.kmecnews.co.kr/news/photo/202209/27147_15960_41.jpg",
   "https://dimg.donga.com/wps/NEWS/IMAGE/2023/03/02/118124874.4.jpg",
   "https://menu.mt.co.kr/theleader/thumb/2024/02/06/2024022914177810557_1.jpg",
   "https://i.namu.wiki/i/JaudlPaMxzH-kbYH_b788UT_sX47F_ajB1hFH7s37d5CZUqOfA6vcoXMiW3E4--hG_PwgDcvQ6Hi021KyzghLQ.webp"
      
      -->
    
  
        <div class="container-xl px-4">
          <div class="row justify-content-center">
            <div class="col-lg-5">
              
              <div class="card shadow-lg border-0 rounded-lg mt-5">
                <div class="card-header justify-content-center">
                  <h3 class="fw-light my-4">행사 관리자 로그인</h3>
                </div>
                <div class="card-body">
                  <form action="fesAdminLogin.do" method="post">
                    <div class="mb-3">
                      <label class="small mb-1">아이디</label>
                      <input class="form-control" id="admin_id" name="admin_id" type="text" placeholder="아이디를 입력하세요" />
                    </div>
                    <div class="mb-3">
                      <label class="small mb-1">비밀번호</label>
                      <input class="form-control" id="admin_pw" name="admin_pw" type="password"
                        placeholder="비밀번호를 입력하세요" />
                    </div>
                    
                    <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                      <button id="admin_login" type="submit" class="btn btn-primary bg-color">로그인</button>
                    </div>
                  </form>
                </div>
                <div class="card-footer text-center">
                  <div class="small"><a class="text-col" href="GofesAdminJoin.do">회원가입</a></div>
                </div>
              </div>
            </div>
          </div>
        </div>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    crossorigin="anonymous"></script>
  <script src="js/scripts.js"></script>
   <script>
        // 선택자
        const sliderWrap = document.querySelector(".slider__wrap");
        const sliderImg = sliderWrap.querySelector(".slider__img");             // 보여지는 영역
        const sliderInner = sliderWrap.querySelector(".slider__inner");         // 움직이는 영역
        const slider = sliderWrap.querySelectorAll(".slider");                  // 개별 이미지

        let currentIndex = 0;                                                   // 현재 보이는 이미지
        let sliderCount = slider.length;                                        // 이미지 갯수
        let sliderInterval = 4000;                                              // 이미지 변경 간격 시간
        let sliderWidth = slider[0].clientWidth;                                // 이미지 가로값 구하기
        let sliderClone = sliderInner.firstElementChild.cloneNode(true);        // 첫 번째 이미지 복사
    </script>

    <!-- javascript -->
    <script>
        // 복사한 첫 번째 이미지 마지막에 붙여넣기
        // sliderInner.appendChild(sliderClone);
        
        // function sliderEffect(){
        //     currentIndex++;

        //     sliderInner.style.transition = "all 0.6s";
        //     sliderInner.style.transform = `translateX(-${sliderWidth * currentIndex}px)`;

        //     // 마지막 이미지에 위치했을 때 
        //     if(currentIndex == sliderCount){
        //         setTimeout(() => {
        //             sliderInner.style.transition = "0s";
        //             sliderInner.style.transform = `translateX(0px)`;
        //         }, 700);
        //         currentIndex = 0;
        //     }
        // };

        // setInterval(sliderEffect, sliderInterval);
    </script>

    <!-- GSAP -->
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.5/gsap.min.js"></script>
    <script>
        sliderInner.appendChild(sliderClone);

        function sliderEffect(){
            currentIndex++;

            gsap.to(".slider__inner",{
                x: -sliderWidth * currentIndex,
                duration: 0.6
            });

            // 마지막 이미지에 위치했을 때 
            if(currentIndex == sliderCount){
                setTimeout(() => {
                    gsap.to(".slider__inner", {
                        x: 0,
                        duration: 0
                    });
                }, 700);
                currentIndex = 0;
            }
        };
        setInterval(sliderEffect, sliderInterval);
    </script> -->

    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
    <script>

        sliderInner.append(sliderClone);

        function sliderEffect(){
            currentIndex++;

            $(".slider__inner").css({
                'transition': 'all 2s',
                'transform': `translateX(-\${sliderWidth * currentIndex}px)`
            });

            if(currentIndex == sliderCount){
                setTimeout(() => {
                    $(".slider__inner").css({
                        'transition': '0s',
                        'transform': 'translateX(0px)'
                    });
                }, 6000);
                currentIndex = 0;
            }
        };

        setInterval(sliderEffect, sliderInterval);
    </script>
</body>

</html>