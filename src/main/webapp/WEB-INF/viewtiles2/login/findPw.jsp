<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script type="text/javascript">
	function fsubmit() {
		var user_id = $("#user_id").val()

		if (user_id == null || user_id == '') {
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
	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<!--  -->
						<div align="left">
							<h3 class="card-title text-center">
								<strong>비밀번호찾기</strong>
							</h3>


						</div>
						<div class="fid" style="font-size: 40px;"></div>


					</div>


					<div class="fid2">
						<div class="form-label-group">
							<form id="frm" action="/fire/findPwResult" method="POST">
								<div class="form-label-group">
									<input type="hidden" id="USER_ID" name="USER_ID">
								</div>

								<div>

									<div align="center">
										<span class="box"><input type="text" class="int"
											maxlength="40" name="user_id" id="user_id"
											placeholder="아이디를 입력하세요.">
											<button class="w-btn w-btn-pink" type="button"
												onclick="fsubmit();">찾기</button></span>
									</div>
								</div>

								<div align="center">
									<p>
										<a href='/fire/findId'>아이디찾기</a> <span>|</span> <a
											href='/fire/findPw'>비밀번호 찾기</a>
									</p>

								</div>
								</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

</body>
</html>