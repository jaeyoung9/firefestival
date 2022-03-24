<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">

function fsubmit() {
	var user_id = $("#user_id").val()
	var user_pw = $("#user_pw").val()

	if (user_id == null || user_id == '') {
		alert("아이디를 입력하세요.");
		return 0;
	} else if (user_pw == null || user_pw == '') {
		alert("비밀번호를 입력하세요");
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
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<body>
<div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-center">회원로그인</h5>
            <form class="form-signin" id="frm" name="frm">
              <div class="form-label-group">
                <input type="id" class="form-control focused-id" name="ID" id="ID" placeholder="아이디를 입력하세요.">
              </div><br/>

              <div class="form-label-group">
                <input type="password" class="form-control focused-password" name="PASSWORD" id="PASSWORD" placeholder="비밀번호를 입력하세요.">
              </div>
              
              <hr/>

              <button class="btn btn-lg btn-primary btn-block text-uppercase" id="Login">LOGIN</button><br/><br/>
              </form>
              <div>
				<a href="<c:url value='/findId'/>">아이디 찾기</a>
				<span>|</span>
				<a href="<c:url value='/findPw'/>">비밀번호 찾기</a>
				<span>|</span>
				<a href="<c:url value='/joinForm'/>">회원가입</a>
				</div>
          </div>
        </div>
      </div>
    </div>
  </div>

	
               
        

</body>
</html>