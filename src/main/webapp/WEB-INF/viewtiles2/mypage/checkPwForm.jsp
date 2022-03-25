<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script>
	function checkSubmit(){
		var pw = $("#USER_PW").val();
		
		if(pw == null || pw = '') {
			alert("비밀번호를 입력하세요.");
			return 0;
		}
		checkPw.submit();
	}
</script>

</head>
<body>
<div class="checkpwd">
<h1>비밀번호 확인</h1><br>
</div>

<div>
<div>
<div class="checkpwd2">
<form id="checkPw" action="<c:url value='/mypage/checkPw'/>" method="POST">
<input type="hidden" id="USER_ID" name="USER_ID" value="${USER_ID }">
<div>
<h4><label>비밀번호 입력</label></h4>
<span class="box">
<input type="password" class="int" name="USER_PW" id="USER_PW" placeholder="비밀번호를 입력하세요">
</span>
</div>
<p>
	<button class="w-btn" type="button" onclick="checkSubmit();">확인</button>
	<button class="w-btn" type="button" onclick="location.href=../myPage?USER_ID=${USER_ID}'">취소</button>
</p>
</form>

</div>
</div>
</div>




</body>
</html>