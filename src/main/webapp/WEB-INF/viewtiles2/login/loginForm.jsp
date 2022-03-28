<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>

<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">

function fsubmit() {
	var user_id = $("#user_id").val()
	var user_pw = $("#user_pw").val()

	if (user_id == null || user_id == '') {
		alert("아이디를 입력하세요.");
		return 0;
	} else if (user_pw == null || user_pw == '') {
		alert("비밀번호를 입력하세요.");
		return 0;
	}

	
	$("#USER_ID").val(user_id);
	$("#USER_PW").val(user_pw);

	loginForm.submit();
	
	
	
	
	
}
</script>
</head>
<script>
	
</script>

<body>
<div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body"><!--  -->
          <div align="left">
           <h2 class="card-title text-center"><strong>로그인</strong></h2>
            </div>
            <form class="form-signin" id="frm" name="frm" action="<c:url value = '/login'/>" method="POST">
              <div class="form-label-group">
                <input type="text" class="form-control focused-id" name="USER_ID" id="user_id" placeholder="아이디를 입력하세요.">
              </div>

              <div class="form-label-group">
                <input type="password" class="form-control focused-password" name="USER_PW" id="user_pw" placeholder="비밀번호를 입력하세요.">
              </div>
              
              <hr/>

              <button class="btn btn-lg btn-primary btn-block text-uppercase" onclick="fsubmit();">LOGIN</button>
              </form>
              <div>
				<a href="<c:url value='/findId/'/>">아이디 찾기</a>
				<span>|</span>
				<a href="<c:url value='/findPw/'/>">비밀번호 찾기</a>
				<span>|</span>
				<a href="<c:url value='/joinForm/'/>">회원가입</a>
				</div>
          </div>
        </div>
      </div>
    </div>
  </div>

	
               
        

</body>
</html>