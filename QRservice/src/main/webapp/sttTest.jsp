<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>음성 녹음하여 파일로 저장하기</title>
</head>
<body>
    <h1>음성 녹음하여 파일로 저장하기</h1>
    
    <button id="startButton">음성 입력 시작</button>
<button id="stopButton" style="display: none;">음성 입력 종료</button>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    const startButton = document.getElementById('startButton');
    const stopButton = document.getElementById('stopButton');
    let chunks = [];
    let isListening = false;

    // 오디오 녹음 시작 버튼 클릭
    startButton.onclick = function() {
        startButton.style.display = 'none';
        stopButton.style.display = 'block';
        
        navigator.mediaDevices.getUserMedia({ audio: true })
        .then(function(stream) {
            // 오디오 녹음 시작
            const mediaRecorder = new MediaRecorder(stream);
            mediaRecorder.start();
            console.log(mediaRecorder.state);
            
            // 오디오 데이터가 준비되면 실행
            mediaRecorder.ondataavailable = function(event) {
                chunks.push(event.data);
            }

            // 녹음 중지 버튼 클릭 시 처리
            stopButton.onclick = function() {
                mediaRecorder.stop();
            }

            // 녹음이 중지되면 실행
            mediaRecorder.onstop = function() {
                const blob = new Blob(chunks, { type: 'audio/wav' });
                const url = URL.createObjectURL(blob);
                const a = document.createElement('a');
                a.href = url;
                a.download = 'recorded_audio.wav';
                document.body.appendChild(a);
                a.click();
                window.URL.revokeObjectURL(url);
                chunks = [];
                startButton.style.display = 'block';
                stopButton.style.display = 'none';
            }

            // 음성 인식 시작
            startSpeechRecognition();
        })
        .catch(function(err) {
            console.error('오디오 녹음에 실패했습니다.', err);
        });
    }

 // 음성 인식 시작 함수
    function startSpeechRecognition() {
        if (!('webkitSpeechRecognition' in window)) {
            alert('웹 브라우저가 음성 인식을 지원하지 않습니다.');
            return;
        }

        const recognition = new webkitSpeechRecognition();
        recognition.lang = 'ko-KR';
        recognition.continuous = true;
        recognition.interimResults = false;

        recognition.onstart = function() {
            console.log('음성 인식이 시작되었습니다.');
        }

        recognition.onresult = function(event) {
            const transcript = event.results[0][0].transcript;
            console.log('인식된 텍스트:', transcript);
            
            if (transcript.includes('조리 중') || transcript.trim().includes('조리 중')) {
            	
            	console.log("조리중 인식");
            	let order_idx;
            	
            	var match = transcript.match(/\b\d+번?\b/g);
            	if (match !== null) {
            	    console.log(match[0]); // "31번" 출력
            	    if (order_idx === undefined) {
            	        order_idx = match[0];
            	    }
            	    console.log("or ",order_idx); // "31번" 출력
            	} else {
            	    console.log("숫자를 찾을 수 없습니다.");
            	}
                
                console.log("or2 ", order_idx);
                
                $.ajax({
            		url : 'http://localhost:8081/QRservice/changeOrderStatus.do?order_idx='+order_idx,

            		success : function(result) {
            			console.log("re ",result);
						if(result.row == 1){
							// tts 부분
							let text = order_idx+"번 주문 조리 중으로 변경합니다.";
			                ttsTest(text);
			                console.log('주문상태를 조리중으로 변경하였습니다.');
			                
			                // sms 전송
			                //checkTimeAndExecuteService();
			                recognition.stop();
			                setTimeout(function() {
			                    recognition.start();
			                }, 1000); 
						}
            		},
            		error : function() {

            		}
            	});
                recognition.stop();
                setTimeout(function() {
                    recognition.start();
                }, 1000); 
            }
            
            else if(transcript.includes('완료')){
            	
            	var match = transcript.match(/\b\d+번?\b/g);
            	if (match !== null) {
            	    console.log(match[0]); // "31번" 출력
            	    if (order_idx === undefined) {
            	        order_idx = match[0];
            	    }
            	    console.log("or ",order_idx); // "31번" 출력
            	} else {
            	    console.log("숫자를 찾을 수 없습니다.");
            	}
                
                console.log("or2 ", order_idx);
                
                $.ajax({
            		url : 'http://localhost:8081/QRservice/changeOrderStatus2.do?order_idx='+order_idx,

            		success : function(result) {
            			console.log("re ",result);
						if(result.row == 1){
							// tts 부분
							let text = order_idx+"번 주문 배송완료로 변경합니다.";
			                ttsTest(text);
			                console.log('주문상태를 배송완료로 변경하였습니다.');
			                
			                recognition.stop();
			                setTimeout(function() {
			                    recognition.start();
			                }, 1000); 
						}
            		},
            		error : function() {

            		}
            	});
                
                
                
                recognition.stop();
                setTimeout(function() {
                    recognition.start();
                }, 1000);
            }
            
            else if(transcript.includes('취소')){
				let text = "주문 취소 처리되었습니다.";
                ttsTest(text);
                console.log('주문 취소 처리되었습니다.');
                
                recognition.stop();
                setTimeout(function() {
                    recognition.start();
                }, 1000);
            }
			
            else if(transcript.includes("큐티")){
				let text = "네. 말씀하세요.";
                ttsTest(text);
                
				recognition.stop();
                setTimeout(function() {
                    recognition.start();
                }, 1000);
			}else{
				recognition.stop();
				setTimeout(function() {
                    recognition.start();
                }, 1000);
			}
        }

        recognition.onerror = function(event) {
            console.error('음성 인식 중 오류가 발생했습니다.', event.error);
        }

        recognition.onend = function() {
            console.log('음성 인식이 종료되었습니다.');
            
            recognition.start();
        }

        recognition.start();
    }

 //tts 함수
 function ttsTest(text){
	var synth = window.speechSynthesis;

	var textToSpeak = text;

	var utterance = new SpeechSynthesisUtterance(textToSpeak);

	synth.speak(utterance);
 }
 
 function checkTimeAndExecuteService() {
	$.ajax({
		type: "POST",
	    url: "http://localhost:8081/QRservice/postmsg.do",
	    data: { /* 서비스에 필요한 데이터 */},
	    success: function(response) {
	                    
	    },
	    error: function(xhr, status, error) {
	                    
	    }
	});
	   
}
</script>

</body>
</html>
