<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α���������</title>
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
								<h1>�α���</h1>
								
							</div>






							<div>
								<div style="text-align: center"></div>


								<form class="loginForm" method="POST"
									action="<c:url value='/login'/>">
									<div style="text-align: left;">
										<label>���̵�</label> <span class="box"><input type="text"
											class="int" id="user_id" maxlength="20" name="USER_ID"
											placeholder="���̵� �Է��ϼ���."> </span>
									</div>
									<br>
									<div style="text-align: left;">
										<label>��й�ȣ</label> <span class="box"><input
											type="password" class="int" id="user_pw" maxlength="20"
											name="USER_PW" placeholder="��й�ȣ�� �Է��ϼ���."> </span>
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
		alert("���̵�� ��й�ȣ�� ��ġ ���� �ʽ��ϴ�.");
		$('.focused-email').focus();
	}
	
	if(${del_gb == 'Y'}){
		alert("����ϽǼ� ���� ���̵��Դϴ�.");
	}
	
	$("#Login").on("click",function(e){
		e.preventDefault();
		var ID = $("USER_ID").val();
		var PW = $("USER_PW").val();
		if(ID == "" || ID == null){
			alert("���̵��Է�");
			$('.focused-id').focus();
			return false;
		}
		if(pw == "" || PW == null){
			alert("��й�ȣ�Է�");
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
										<a href="<c:url value='/findId'/>">���̵� ã��</a><span>|</span>
										<a href="<c:url value='/findPw'/>">��й�ȣã��</a><span>|</span>
										<a href="<c:url value='/joinForm'/>">ȸ������</a>
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