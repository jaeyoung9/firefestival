<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���̵� ã��</title>
<script type = "text/javascript">
function fsubmit(){
	var user_nic = $("#user_nic").val()
	
	if(user_nic == null || user_nic == ''){
		alert("�г����� �Է��ϼ���.");
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
<div>
	<div>
		<a href="/findId"><h1>���̵�ã��</h1></a>
			<div style="text-align:center; margin-top: 15%; margin-bottom: 100px;">
				<div class="fid3">
					<p>
						<a href="/findId">���̵� ã��</a>
						<span> | </span>
						<a href="/findPw">��й�ȣ ã��</a>
					</p>
					</div>
					<div class="fid" style="font-size:40px;">
						<h1>���̵� ã��</h1>
					</div>
					<div class="fid2">
					<form id="frm" action="/flower/findIdResult" method="POST">
						<input type="hidden" id="USER_ID" name="USER_ID">
						
					<div>
						<label>NICKNAME</label>
						<span class="box"><input type="text" class="int" maxlength="20" name="user_nic" id="user_nic" placeholder="����� �г����� ���ÿ�."></span>
					</div>
					
					
					<p>
						<button class="w-btn w-btn-pink" type="button" onclick="fsubmit();">ã��</button>
						
					</p>
					</form>
					</div>
				</div>
		
	</div>
</div>
</body>
</html>