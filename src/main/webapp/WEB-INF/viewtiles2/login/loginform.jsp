<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>
<script type = "text/javascript">
function fsubmit(){
	var user_id = $("#user_id").val()
	var user_pw = $("#user_pw").val()
	
	if(user_id == null || user_id = ''){
		alert("아이디를 입력하세요");
		return 0;
	}else if (user_pw == null || user_pw ==''){
		alert("비밀번호를 입력하세요");
		return 0;
	}
	
	$("#USER_ID").val(user_id);
	$("#USER_PW").val(user_pw);
	
	loginForm.submit();
}
</script>




<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-body.jspf" %>
<body>


<div class = "login">
	<a href="<c:url value='/main'/>"><h2>LOGIN</h2></a>
</div>




<div>
<form class = "loginForm" method ="POST" action="<c:url value='/login'/>">
<div style="text-align":left;">
<label>아이디</label>
<span class = "box"><input type = "text" class="int" id ="user_id" maxlength = "20"
name = "USER_ID" placeolder = "아이디를 입력하세요.">
</span>
</div>
<br>
<div style="text-align: left;">
<label>비밀번호</label>
<span class = "box"><input type = "password" class = "int" id="user_pw" maxlength="20"
name = "USER_PW" placeolder = "비밀번호를 입력하세요.">
</span>
</div>
<br>
</form>
<div>
<a href="<c:url value='/loginForm/findId'/>">이이디 찾기</a>
<span>|</span>
<a href="<c:url value='/loginForm/findPw'/>">비밀번호 찾기</a>
</div>




</div>













</form>



</body>
</html>