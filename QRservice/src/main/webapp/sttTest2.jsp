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

<script>
    const startButton = document.getElementById('startButton');
    const stopButton = document.getElementById('stopButton');
    let chunks = [];
    let isListening = false;

    // 오디오 녹음 시작 버튼 클릭 시 처리
    startButton.onclick = function() {
    startButton.style.display = 'none';
    stopButton.style.display = 'block';
    navigator.mediaDevices.getUserMedia({ audio: true })
    .then(function(stream) {
        const mediaRecorder = new MediaRecorder(stream);
        mediaRecorder.start();
        mediaRecorder.ondataavailable = function(event) {
            chunks.push(event.data);
        }
        stopButton.onclick = function() {
            mediaRecorder.stop();
        }
        mediaRecorder.onstop = function() {
            const blob = new Blob(chunks, { type: 'audio/wav' });
            const formData = new FormData();
            formData.append('audio', blob);
            fetch('upload.do', {
                method: 'POST',
                body: formData
            })
            .then(response => {
                console.log('Audio uploaded successfully');
                chunks = [];
                startButton.style.display = 'block';
                stopButton.style.display = 'none';
            })
            .catch(error => {
                console.error('Failed to upload audio', error);
            });
        }
    })
    .catch(function(err) {
        console.error('Failed to access microphone', err);
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
                let text = "조리 중으로 변경합니다.";
                ttsTest(text);
                console.log('주문상태를 조리중으로 변경하였습니다.');
                
                recognition.stop();
                
                setTimeout(function() {
                    recognition.start();
                }, 1000); // 1초 후에 다시 시작
            }
            if(transcript.includes('완료')){
            	let text = "주문 완료 처리되었습니다.";
                ttsTest(text);
                console.log('주문 완료 처리되었습니다.');
                console.log(transcript.split("번")[0]);
                recognition.stop();
                
                setTimeout(function() {
                    recognition.start();
                }, 1000);
            }
			if(transcript.includes('취소')){
				let text = "주문 취소 처리되었습니다.";
                ttsTest(text);
                console.log('주문 취소 처리되었습니다.');
                
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

 
 function ttsTest(text){
	 var synth = window.speechSynthesis;

	var textToSpeak = text;

	var utterance = new SpeechSynthesisUtterance(textToSpeak);

	synth.speak(utterance);
 }
</script>

</body>
</html>
