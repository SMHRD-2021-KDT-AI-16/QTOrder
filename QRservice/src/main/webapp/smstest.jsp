<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
function checkTimeAndExecuteService() {
	
	let status = document.getElementById("").innerText;

        if (status == "������") {
           $.ajax({
                type: "POST",
                url: "http://localhost:8081/QRservice/postmsg.do",
                data: { /* ���񽺿� �ʿ��� ������ */},
                success: function(response) {
                    
                },
                error: function(xhr, status, error) {
                    
                }
            });
        }
    }, 20000); 
}


$(document).ready(function() {
    checkTimeAndExecuteService();
});
</script>
</body>
</html>