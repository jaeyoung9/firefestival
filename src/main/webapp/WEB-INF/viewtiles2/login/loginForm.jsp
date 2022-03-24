<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인페이지</title>
<style>
.logindeco {
	width: 40%;
	justify-content: center;
	padding: 5rem;
	box-sizing: border-box;
	margin: auto;
}

a {
	text-decoration: none;
	color: black;
}

.login {
	position: relative;
	text-align: center;
}
</style>

</head>

<%@ include file="/WEB-INF/viewtiles2/include/include-body.jspf" %>







<body>
	<div class="logindeco">
		<div class="row">
			<div class="col-sm-10 col-md-8 col-lg-6 mx-auto">
				<div class="card card-signin my-20">
					<div class="card-body">
						<h5 class="card-title text-center"></h5>

						<div class="form-label-group">
							<div align="center">
								<h1>로그인</h1>
								
							</div>






							<div>
								<div style="text-align: center"></div>


								<form class="loginForm" method="POST"
									action="<c:url value='/login'/>">
									<div style="text-align: left;">
										<label>아이디</label> <span class="box"><input type="text"
											class="int" id="user_id" maxlength="20" name="USER_ID"
											placeholder="아이디를 입력하세요."> </span>
									</div>
									<br>
									<div style="text-align: left;">
										<label>비밀번호</label> <span class="box"><input
											type="password" class="int" id="user_pw" maxlength="20"
											name="USER_PW" placeholder="비밀번호를 입력하세요."> </span>
									</div>
									<br>
								</form>
								<div class="login">
									<div style="font-size: 40px;">
										<a href="<c:url value='/main'/>"><h2>LOGIN</h2></a>
									</div>
									<script type="text/javascript">
$(docment).ready(function(){
	if(!${checklogin}){
		alert("아이디와 비밀번호가 일치 하지 않습니다.");
		$('.focused-email').focus();
	}
	
	if(${del_gb == 'Y'}){
		alert("사용하실수 없는 아이디입니다.");
	}
	
	$("#Login").on("click",function(e){
		e.preventDefault();
		var ID = $("USER_ID").val();
		var PW = $("USER_PW").val();
		if(ID == "" || ID == null){
			alert("아이디입력");
			$('.focused-id').focus();
			return false;
		}
		if(pw == "" || PW == null){
			alert("비밀번호입력");
			$('.focused-password').focus();
			return false;
		}
		fn_Login();
	});

	function fn_Login(){
		var comSumit = new ComSubmit('frm');
		comSumit.setUrl("<c:url value='/main'/>");
		}
	});
</script>
									<div>
										<a href="<c:url value='/findId'/>">아이디 찾기</a><span>|</span>
										<a href="<c:url value='/findPw'/>">비밀번호찾기</a><span>|</span>
										<a href="<c:url value='/joinForm'/>">회원가입</a>
									</div>




								</div>



							</div>
						</div>



					</div>
				</div>
			</div>
		</div>
	</div>



</div>








</body>
</html>