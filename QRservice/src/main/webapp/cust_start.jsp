<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>QTOrder</title>
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
           
           font-size: 140px;
           position: absolute;
           width: 100%;
           height: 100%;
           /* text-transform: uppercase; */
           animation: stroke 5s 1 alternate;
           fill: #FA823C;
           opacity: 0;
       }       
       @keyframes stroke {
          0% {
             stroke-dashoffset: 25%;
             stroke-dasharray: 0 50%;
             fill: transparent;
             /* stroke: #FA823C; */
             stroke: #000;
             stroke-width: 3;
             opacity: 1;
         }
         20% {
             fill: transparent;
             stroke: #000;
             opacity: 1;
         }
         40% {    
             stroke: #000;
             opacity: 0;
         }
         80% {
             stroke-dashoffset: -25%;
             stroke-dasharray: 50% 0;
             fill: #FA823C; /* 최종 채우기 색상 */
             stroke: #000;
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
        50% { transform: scale(1.2, 0.5)}
        100% { 
           transform: scale(1, 0.5);
        }
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
        animation:load 5s linear;
      }
      @keyframes dis_opacity{
         0% {
            opacity: 1;
         }
         80% {
            opacity: 1;
         }
         0% {
            opacity: 0;
         }
      }
      @keyframes load{
        17%{
          border-bottom-right-radius: 3px;
        }
        25%{
          transform: translatey(9px) rotate(22.5deg);
        }
        50%{ 
          transform: translatey(18px) scale(1, 0.9) rotate(45deg);
          border-bottom-right-radius: 40px;
        }
        75%{
          transform: translatey(9px) rotate(67.5deg);
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
@-webkit-keyframes fall {
    0% {
        opacity: 0.9;
        top: 0
    }
    100% {
        opacity: 0.2;
        top: 100%
    }
}

@-o-keyframes fall {
    0% {
        opacity: 0.9;
        top: 0
    }
    100% {
        opacity: 0.2;
        top: 100%
    }
}

@-ms-keyframes fall {
    0% {
        opacity: 0.9;
        top: 0
    }
    100% {
        opacity: 0.2;
        top: 100%
    }
}

@-moz-keyframes fall {
    0% {
        opacity: 0.9;
        top: 0
    }
    100% {
        opacity: 0.2;
        top: 100%
    }
}

@keyframes fall {
    0% {
        opacity: 0.9;
        top: 0
    }
    100% {
        opacity: 0.2;
        top: 100%
    }
}

@-webkit-keyframes blow-soft-left {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: -50%
    }
}

@-o-keyframes blow-soft-left {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: -50%
    }
}

@-ms-keyframes blow-soft-left {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: -50%
    }
}

@-moz-keyframes blow-soft-left {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: -50%
    }
}

@keyframes blow-soft-left {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: -50%
    }
}

@-webkit-keyframes blow-medium-left {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: -100%
    }
}

@-o-keyframes blow-medium-left {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: -100%
    }
}

@-ms-keyframes blow-medium-left {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: -100%
    }
}

@-moz-keyframes blow-medium-left {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: -100%
    }
}

@keyframes blow-medium-left {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: -100%
    }
}

@-webkit-keyframes blow-soft-right {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: 50%
    }
}

@-o-keyframes blow-soft-right {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: 50%
    }
}

@-ms-keyframes blow-soft-right {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: 50%
    }
}

@-moz-keyframes blow-soft-right {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: 50%
    }
}

@keyframes blow-soft-right {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: 50%
    }
}

@-webkit-keyframes blow-medium-right {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: 100%
    }
}

@-o-keyframes blow-medium-right {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: 100%
    }
}

@-ms-keyframes blow-medium-right {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: 100%
    }
}

@-moz-keyframes blow-medium-lerightft {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: 100%
    }
}

@keyframes blow-medium-right {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: 100%
    }
}

@-webkit-keyframes sway-0 {
    0% {
        -webkit-transform: rotate(-5deg)
    }
    40% {
        -webkit-transform: rotate(28deg)
    }
    100% {
        -webkit-transform: rotate(3deg)
    }
}

@-o-keyframes sway-0 {
    0% {
        -o-transform: rotate(-5deg)
    }
    40% {
        -o-transform: rotate(28deg)
    }
    100% {
        -o-transform: rotate(3deg)
    }
}

@-ms-keyframes sway-0 {
    0% {
        -ms-transform: rotate(-5deg)
    }
    40% {
        -ms-transform: rotate(28deg)
    }
    100% {
        -ms-transform: rotate(3deg)
    }
}

@-moz-keyframes sway-0 {
    0% {
        -moz-transform: rotate(-5deg)
    }
    40% {
        -moz-transform: rotate(28deg)
    }
    100% {
        -moz-transform: rotate(3deg)
    }
}

@keyframes sway-0 {
    0% {
        transform: rotate(-5deg)
    }
    40% {
        transform: rotate(28deg)
    }
    100% {
        transform: rotate(3deg)
    }
}

@-webkit-keyframes sway-1 {
    0% {
        -webkit-transform: rotate(10deg)
    }
    40% {
        -webkit-transform: rotate(43deg)
    }
    100% {
        -webkit-transform: rotate(15deg)
    }
}

@-o-keyframes sway-1 {
    0% {
        -o-transform: rotate(10deg)
    }
    40% {
        -o-transform: rotate(43deg)
    }
    100% {
        -o-transform: rotate(15deg)
    }
}

@-ms-keyframes sway-1 {
    0% {
        -ms-transform: rotate(10deg)
    }
    40% {
        -ms-transform: rotate(43deg)
    }
    100% {
        -ms-transform: rotate(15deg)
    }
}

@-moz-keyframes sway-1 {
    0% {
        -moz-transform: rotate(10deg)
    }
    40% {
        -moz-transform: rotate(43deg)
    }
    100% {
        -moz-transform: rotate(15deg)
    }
}

@keyframes sway-1 {
    0% {
        transform: rotate(10deg)
    }
    40% {
        transform: rotate(43deg)
    }
    100% {
        transform: rotate(15deg)
    }
}

@-webkit-keyframes sway-2 {
    0% {
        -webkit-transform: rotate(15deg)
    }
    40% {
        -webkit-transform: rotate(56deg)
    }
    100% {
        -webkit-transform: rotate(22deg)
    }
}

@-o-keyframes sway-2 {
    0% {
        -o-transform: rotate(15deg)
    }
    40% {
        -o-transform: rotate(56deg)
    }
    100% {
        -o-transform: rotate(22deg)
    }
}

@-ms-keyframes sway-2 {
    0% {
        -ms-transform: rotate(15deg)
    }
    40% {
        -ms-transform: rotate(56deg)
    }
    100% {
        -ms-transform: rotate(22deg)
    }
}

@-moz-keyframes sway-2 {
    0% {
        -moz-transform: rotate(15deg)
    }
    40% {
        -moz-transform: rotate(56deg)
    }
    100% {
        -moz-transform: rotate(22deg)
    }
}

@keyframes sway-2 {
    0% {
        transform: rotate(15deg)
    }
    40% {
        transform: rotate(56deg)
    }
    100% {
        transform: rotate(22deg)
    }
}

@-webkit-keyframes sway-3 {
    0% {
        -webkit-transform: rotate(25deg)
    }
    40% {
        -webkit-transform: rotate(74deg)
    }
    100% {
        -webkit-transform: rotate(37deg)
    }
}

@-o-keyframes sway-3 {
    0% {
        -o-transform: rotate(25deg)
    }
    40% {
        -o-transform: rotate(74deg)
    }
    100% {
        -o-transform: rotate(37deg)
    }
}

@-ms-keyframes sway-3 {
    0% {
        -ms-transform: rotate(25deg)
    }
    40% {
        -ms-transform: rotate(74deg)
    }
    100% {
        -ms-transform: rotate(37deg)
    }
}

@-moz-keyframes sway-3 {
    0% {
        -moz-transform: rotate(25deg)
    }
    40% {
        -moz-transform: rotate(74deg)
    }
    100% {
        -moz-transform: rotate(37deg)
    }
}

@keyframes sway-3 {
    0% {
        transform: rotate(25deg)
    }
    40% {
        transform: rotate(74deg)
    }
    100% {
        transform: rotate(37deg)
    }
}

@-webkit-keyframes sway-4 {
    0% {
        -webkit-transform: rotate(40deg)
    }
    40% {
        -webkit-transform: rotate(68deg)
    }
    100% {
        -webkit-transform: rotate(25deg)
    }
}

@-o-keyframes sway-4 {
    0% {
        -o-transform: rotate(40deg)
    }
    40% {
        -o-transform: rotate(68deg)
    }
    100% {
        -o-transform: rotate(25deg)
    }
}

@-ms-keyframes sway-4 {
    0% {
        -ms-transform: rotate(40deg)
    }
    40% {
        -ms-transform: rotate(68deg)
    }
    100% {
        -ms-transform: rotate(25deg)
    }
}

@-moz-keyframes sway-4 {
    0% {
        -moz-transform: rotate(40deg)
    }
    40% {
        -moz-transform: rotate(68deg)
    }
    100% {
        -moz-transform: rotate(25deg)
    }
}

@keyframes sway-4 {
    0% {
        transform: rotate(40deg)
    }
    40% {
        transform: rotate(68deg)
    }
    100% {
        transform: rotate(25deg)
    }
}

@-webkit-keyframes sway-5 {
    0% {
        -webkit-transform: rotate(50deg)
    }
    40% {
        -webkit-transform: rotate(78deg)
    }
    100% {
        -webkit-transform: rotate(40deg)
    }
}

@-o-keyframes sway-5 {
    0% {
        -o-transform: rotate(50deg)
    }
    40% {
        -o-transform: rotate(78deg)
    }
    100% {
        -o-transform: rotate(40deg)
    }
}

@-ms-keyframes sway-5 {
    0% {
        -ms-transform: rotate(50deg)
    }
    40% {
        -ms-transform: rotate(78deg)
    }
    100% {
        -ms-transform: rotate(40deg)
    }
}

@-moz-keyframes sway-5 {
    0% {
        -moz-transform: rotate(50deg)
    }
    40% {
        -moz-transform: rotate(78deg)
    }
    100% {
        -moz-transform: rotate(40deg)
    }
}

@keyframes sway-5 {
    0% {
        transform: rotate(50deg)
    }
    40% {
        transform: rotate(78deg)
    }
    100% {
        transform: rotate(40deg)
    }
}

@-webkit-keyframes sway-6 {
    0% {
        -webkit-transform: rotate(65deg)
    }
    40% {
        -webkit-transform: rotate(92deg)
    }
    100% {
        -webkit-transform: rotate(58deg)
    }
}

@-o-keyframes sway-6 {
    0% {
        -o-transform: rotate(65deg)
    }
    40% {
        -o-transform: rotate(92deg)
    }
    100% {
        -o-transform: rotate(58deg)
    }
}

@-ms-keyframes sway-6 {
    0% {
        -ms-transform: rotate(65deg)
    }
    40% {
        -ms-transform: rotate(92deg)
    }
    100% {
        -ms-transform: rotate(58deg)
    }
}

@-moz-keyframes sway-6 {
    0% {
        -moz-transform: rotate(65deg)
    }
    40% {
        -moz-transform: rotate(92deg)
    }
    100% {
        -moz-transform: rotate(58deg)
    }
}

@keyframes sway-6 {
    0% {
        transform: rotate(65deg)
    }
    40% {
        transform: rotate(92deg)
    }
    100% {
        transform: rotate(58deg)
    }
}

@-webkit-keyframes sway-7 {
    0% {
        -webkit-transform: rotate(72deg)
    }
    40% {
        -webkit-transform: rotate(118deg)
    }
    100% {
        -webkit-transform: rotate(68deg)
    }
}

@-o-keyframes sway-7 {
    0% {
        -o-transform: rotate(72deg)
    }
    40% {
        -o-transform: rotate(118deg)
    }
    100% {
        -o-transform: rotate(68deg)
    }
}

@-ms-keyframes sway-7 {
    0% {
        -ms-transform: rotate(72deg)
    }
    40% {
        -ms-transform: rotate(118deg)
    }
    100% {
        -ms-transform: rotate(68deg)
    }
}

@-moz-keyframes sway-7 {
    0% {
        -moz-transform: rotate(72deg)
    }
    40% {
        -moz-transform: rotate(118deg)
    }
    100% {
        -moz-transform: rotate(68deg)
    }
}

@keyframes sway-7 {
    0% {
        transform: rotate(72deg)
    }
    40% {
        transform: rotate(118deg)
    }
    100% {
        transform: rotate(68deg)
    }
}

@-webkit-keyframes sway-8 {
    0% {
        -webkit-transform: rotate(94deg)
    }
    40% {
        -webkit-transform: rotate(136deg)
    }
    100% {
        -webkit-transform: rotate(82deg)
    }
}

@-o-keyframes sway-8 {
    0% {
        -o-transform: rotate(94deg)
    }
    40% {
        -o-transform: rotate(136deg)
    }
    100% {
        -o-transform: rotate(82deg)
    }
}

@-ms-keyframes sway-8 {
    0% {
        -ms-transform: rotate(94deg)
    }
    40% {
        -ms-transform: rotate(136deg)
    }
    100% {
        -ms-transform: rotate(82deg)
    }
}

@-moz-keyframes sway-8 {
    0% {
        -moz-transform: rotate(94deg)
    }
    40% {
        -moz-transform: rotate(136deg)
    }
    100% {
        -moz-transform: rotate(82deg)
    }
}

@keyframes sway-8 {
    0% {
        transform: rotate(94deg)
    }
    40% {
        transform: rotate(136deg)
    }
    100% {
        transform: rotate(82deg)
    }
}

.sakura {
    background: -webkit-linear-gradient(120deg, rgba(255, 183, 197, 0.9), rgba(255, 197, 208, 0.9));
    background: -o-linear-gradient(120deg, rgba(255, 183, 197, 0.9), rgba(255, 197, 208, 0.9));
    background: -ms-linear-gradient(120deg, rgba(255, 183, 197, 0.9), rgba(255, 197, 208, 0.9));
    background: -moz-linear-gradient(120deg, rgba(255, 183, 197, 0.9), rgba(255, 197, 208, 0.9));
    background: linear-gradient(120deg, rgba(255, 183, 197, 0.9), rgba(255, 197, 208, 0.9));
    -webkit-border-radius: 12px 1px;
    -o-border-radius: 12px 1px;
    -ms-border-radius: 12px 1px;
    -moz-border-radius: 12px 1px;
    border-radius: 12px 1px;
    -webkit-pointer-events: none;
    -moz-pointer-events: none;
    -ms-pointer-events: none;
    -o-pointer-events: none;
    pointer-events: none;
    position: absolute
}
    </style>
    <link href="css/yg.css" rel="stylesheet" />
</head>
<body>
   <div class="box"></div>
    <svg viewBox="0 0 1320 300">
        <text x="50%" y="50%" dy="40px" text-anchor="middle">QTOrder</text>
    </svg>
    
    <script type="text/javascript">
        setTimeout(function() {
            window.location.href = "http://127.0.0.1:8081/QRservice/cust_login.jsp?fes_idx=10";
        }, 6000);
    </script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
   <script>
      $(window).load(function () {
          $('body').sakura();
      });
      (function ($) {
          // requestAnimationFrame Polyfill
          (function () {
              var lastTime = 0;
              var vendors = ['ms', 'moz', 'webkit', 'o'];

              for (var x = 0; x < vendors.length && !window.requestAnimationFrame; ++x) {
                  window.requestAnimationFrame = window[vendors[x] + 'RequestAnimationFrame'];
                  window.cancelAnimationFrame = window[vendors[x] + 'CancelAnimationFrame'] || window[vendors[x] + 'CancelRequestAnimationFrame'];
              }

              if (!window.requestAnimationFrame)
                  window.requestAnimationFrame = function (callback, element) {
                      var currTime = new Date().getTime();
                      var timeToCall = Math.max(0, 16 - (currTime - lastTime));
                      var id = window.setTimeout(function () {
                              callback(currTime + timeToCall);
                          },
                          timeToCall);
                      lastTime = currTime + timeToCall;

                      return id;
                  };

              if (!window.cancelAnimationFrame)
                  window.cancelAnimationFrame = function (id) {
                      clearTimeout(id);
                  };
          }());

          // Sakura function.
          $.fn.sakura = function (options) {
              // We rely on these random values a lot, so define a helper function for it.
              function getRandomInt(min, max) {
                  return Math.floor(Math.random() * (max - min + 1)) + min + 5;
              }

              // Helper function to attach cross-browser events to an element.
              var prefixes = ['moz', 'ms', 'o', 'webkit', ''];
              var prefCount = prefixes.length;

              function prefixedEvent(element, type, callback) {
                  for (var i = 0; i < prefCount; i++) {
                      if (!prefixes[i]) {
                          type = type.toLowerCase();
                      }

                      element.get(0).addEventListener(prefixes[i] + type, callback, false);
                  }
              }

              // Defaults for the option object, which gets extended below.
              var defaults = {
                  blowAnimations: ['blow-soft-left', 'blow-medium-left', 'blow-hard-left', 'blow-soft-right', 'blow-medium-right', 'blow-hard-right'],
                  className: 'sakura',
                  fallSpeed: 1,
                  maxSize: 14,
                  minSize: 9,
                  newOn: 300,
                  swayAnimations: ['sway-0', 'sway-1', 'sway-2', 'sway-3', 'sway-4', 'sway-5', 'sway-6', 'sway-7', 'sway-8']
              };

              var options = $.extend({}, defaults, options);

              // Declarations.
              var documentHeight = $(document).height();
              var documentWidth = $(document).width();
              var sakura = $('<div class="' + options.className + '" />');

              // Set the overflow-x CSS property on the body to prevent horizontal scrollbars.
              $('body').css({ 'overflow-x': 'hidden' });

              // Function that inserts new petals into the document.
              var petalCreator = function () {
                  setTimeout(function () {
                      requestAnimationFrame(petalCreator);
                  }, options.newOn);

                  // Get one random animation of each type and randomize fall time of the petals.
                  var blowAnimation = options.blowAnimations[Math.floor(Math.random() * options.blowAnimations.length)];
                  var swayAnimation = options.swayAnimations[Math.floor(Math.random() * options.swayAnimations.length)];
                  var fallTime = (Math.round(documentHeight * 0.007) + Math.random() * 5) * options.fallSpeed;

                  var animations = 'fall ' + fallTime + 's linear 0s 1' + ', ' +
                      blowAnimation + ' ' + (((fallTime > 30 ? fallTime : 30) - 20) + getRandomInt(0, 20)) + 's linear 0s infinite' + ', ' +
                      swayAnimation + ' ' + getRandomInt(2, 4) + 's linear 0s infinite';
                  var petal = sakura.clone();
                  var size = getRandomInt(options.minSize, options.maxSize);
                  var startPosLeft = Math.random() * documentWidth - 100;
                  var startPosTop = -((Math.random() * 20) + 15);

                  // Apply Event Listener to remove petals that reach the bottom of the page.
                  prefixedEvent(petal, 'AnimationEnd', function () {
                      $(this).remove();
                  });

                  // Apply Event Listener to remove petals that finish their horizontal float animation.
                  prefixedEvent(petal, 'AnimationIteration', function (ev) {
                      if ($.inArray(ev.animationName, options.blowAnimations) != -1) {
                          $(this).remove();
                      }
                  });

                  petal
                      .css({
                          '-webkit-animation': animations,
                          '-o-animation': animations,
                          '-ms-animation': animations,
                          '-moz-animation': animations,
                          animation: animations,
                          height: size,
                          left: startPosLeft,
                          'margin-top': startPosTop,
                          width: size
                      })
                      .appendTo('body');
              };


              // Recalculate documentHeight and documentWidth on browser resize.
              $(window).resize(function () {
                  documentHeight = $(document).height();
                  documentWidth = $(document).width();
              });

              // Finally: Start adding petals.
              requestAnimationFrame(petalCreator);
          };
      }(jQuery));
   </script>
</body>
</html>