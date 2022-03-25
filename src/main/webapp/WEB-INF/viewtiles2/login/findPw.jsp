<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script type = "text/javascript">
function fsubmit(){
	var user_id = $("#user_id").val()
	
	if(user_id == null || user_id == ''){
		alert("아이디를 입력하세요.");
		return 0;
		
	}
	$("#USER_ID").val(user_id);
	frm.submit();
}
</script>

<style>
.fpw {
	width: 30%;
	height: 100vh;
	display: block;
	justify-content: center;
	align-items: left;
	box-sizing: border-box;
	text-align: left;
	margin: auto;
}
</style>

</head>
<body>

<div>
		<div>
			
			<div style="text-align:center; margin-top: 15%; margin-bottom: 100px;">
				
					<p>
						<a href='/fire/findId'>아이디 찾기</a>
						<span> | </span>
						<a href='/fire/findPw'>비밀번호 찾기</a>
					</p>
					
				<div style="font-size:40px;">
						<h1>비밀번호 찾기</h1>
					</div>
				<div class="fpw">
				<form id="frm" action="/fire/findPwResult" method="POST">
					<input type="hidden" id="USER_ID" name="USER_ID"> 
					
						
					<div>
						
						<span class="box"><input type="text" class="int" maxlength="40" name="user_id" id="user_id" placeholder="아이디를 입력하세요."></span>
					</div>
					
					
					<p>
						<button class="w-btn w-btn-pink" type="button" onclick="fsubmit();">찾기</button>
						
						<button class="w-btn w-btn-pink" type="submit" onclick="location.href='http://localhost:9000/fire/findId'">아이디찾기</button>
					</p>

				</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>