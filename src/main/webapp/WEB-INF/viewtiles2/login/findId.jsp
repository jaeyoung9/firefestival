<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script type = "text/javascript">
function fsubmit(){
	var user_nic = $("#user_nic").val()
	
	if(user_nic == null || user_nic == ''){
		alert("닉네임을 입력하세요.");
		return 0;
		
	}
	$("#USER_NIC").val(user_nic);
	frm.submit();
}
</script>
<style>
.fid2{
width: 30%;
height: 100vh;
display: block;
justify-content:center;
align-item:left;
box-sizing:border-box;
text-align:left;
margin:auto;
}
</style>
</head>
<body>
<div class="container">
    <div class="row">
      <div class="col-sm-5 col-md-5 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
		
			<div style="text-align:center; margin-top: 15%; margin-bottom: 100px;">
				<div class="fid3">
				
				
				
					<p>
						<a href='/fire/findId'>아이디 찾기</a>
						<span> | </span>
						<a href='/fire/findPw'>비밀번호 찾기</a>
					</p>
					</div>
					<div class="fid" style="font-size:40px;">
						
					</div>
					<h5 class="card-title text-center">아이디찾기</h5>
					</div>
					<div class="fid2">
					<div class="form-label-group">
					<form id="frm" action="/fire/findIdResult" method="POST">
						<input type="hidden" id="USER_NIC" name="USER_NIC">
					
					<div>
						
						<span class="box"><input type="text" class="int" maxlength="40" name="user_nic" id="user_nic" placeholder="닉네임을 입력하세요."></span>
					</div>
					
					
					<p>
					<div align="right">
						<button class="w-btn w-btn-pink" type="button" onclick="fsubmit();">찾기</button>
						</div>
					</p>
					</form>
					</div>
				</div>
		</div>
		
	
</div>
</div>

</div>
</div>
</body>
</html>