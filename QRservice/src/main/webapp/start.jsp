<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Insert title here</title>
    <style>    
       body {
           display: flex;
           justify-content: center;
           align-items: center;
           height: 100vh;
           margin: 0;
           background-color: #e3f2fd;
       }
       svg {
           font-family: 'Tmon';
           font-size: 140px;
           position: absolute;
           width: 100%;
           height: 100%;
           text-transform: uppercase;
           animation: stroke 5s 1 alternate;
           fill: #FA823C;
           opacity: 0;
       }       
       @keyframes stroke {
          0% {
             stroke-dashoffset: 25%;
             stroke-dasharray: 0 50%;
             fill: transparent;
             stroke: #FA823C;
             stroke-width: 5;
             opacity: 1;
         }
         20% {
             fill: transparent;
             stroke: #FA823C;
             opacity: 1;
         }
         40% {    
             stroke: #FA823C;
             opacity: 0;
         }
         80% {
             stroke-dashoffset: -25%;
             stroke-dasharray: 50% 0;
             fill: #FA823C; /* 최종 채우기 색상 */
             stroke: #FA823C;
             stroke-width: 0;
             opacity: 1;
         }
         100% {
         	opacity: 0;
         }
      }
      .box {
        width : 150px;
        height : 150px;
        position: absolute;
        top: 0;
        left: 0;
        right:0;
        bottom:0;
        margin:auto;
      }
      
      .box::before{
        content:'';
        width:150px;
        height:150px;
        background-color: black;
        position:absolute;
        top:90px;
        left: 0;
        border-radius: 50%;
        opacity: 0.2;
        animation:shadow 0.6s linear infinite;
      }
      
      @keyframes shadow{
        0%{ transform: scale(1, 0.5)}
        50%{ transform: scale(1.2, 0.5)}
        100%{ transform: scale(1, 0.5)}
      }
      
      .box::after{
        content: '';
        background: pink;
        width: 150px;
        height: 150px;
        position: absolute;
        left: 0;
        top: 0;
        border-radius: 3px;
        animation:load 0.6s linear infinite;
      }
      
      @keyframes load{
        17%{
          border-bottom-right-radius: 3px;
        }
        25%{
          transform: translatey(9px) rotate(22.5deg)
        }
        50%{ 
          transform: translatey(18px) scale(1, 0.9) rotate(45deg);
          border-bottom-right-radius: 40px
        }
        75%{
          transform: translatey(9px) rotate(67.5deg)
        }
        100% {
          transform: translatey(0px) rotate(90deg);
        }
      }
      
      .flower {
  position: relative;
  width: 100px;
  height: 100px;
  border-radius: 50%;
  background: pink; /* 중앙의 작은 원 */
  margin: 40px auto;
}

.flower::before,
.flower::after {
  content: '';
  position: absolute;
  width: 100px;
  height: 100px;
  border-radius: 50%;
  background: pink;
}

.flower::before {
  /* 왼쪽 꽃잎 */
  transform: rotate(45deg);
  top: -30px;
  left: 0;
}

.flower::after {
  /* 오른쪽 꽃잎 */
  transform: rotate(-45deg);
  top: -30px;
  right: 0;
}
    </style>
</head>
<body>

   <div class="box"></div>
    <svg viewBox="0 0 1320 300">
        <text x="50%" y="50%" dy="40px" text-anchor="middle">QTOrder</text>
    </svg>
    
    <script type="text/javascript">
        setTimeout(function() {
            window.location.href = "fesAdminLogin.jsp";
        }, 6000);
    </script>
</body>
</html>