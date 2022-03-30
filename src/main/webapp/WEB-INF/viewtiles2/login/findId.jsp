<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script type="text/javascript">
	function fsubmit() {
		var user_nic = $("#user_nic").val()

		if (user_nic == null || user_nic == '') {
			alert("닉네임을 입력하세요.");
			return 0;

		}
		$("#USER_NIC").val(user_nic);
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
								<strong>아이디찾기</strong>
							</h3>

						</div>
						<div class="fid" style="font-size: 40px;"></div>



					</div>

					<div class="fid2">
						<div class="form-label-group">
							<form id="frm" action="/fire/findIdResult" method="POST">
								<div class="form-label-group">
									<input type="hidden" id="USER_NIC" name="USER_NIC">
								</div>
								<div>
									<div align="center">
										<span class="box"> <label class="form-label mt-4">
												<input type="text" class="int" maxlength="50"
												name="user_nic" id="user_nic" placeholder="닉네임을 입력하세요.">
										</label>
											<button class="primary-btn header-btn text-capitalize mt-10"
												type="button" onclick="fsubmit();">
												<svg xmlns="http://www.w3.org/2000/svg" width="16"
													height="16" fill="currentColor" class="bi bi-search"
													viewBox="0 0 16 16">
  <path
														d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
</svg>
											</button></span>
									</div>
								</div>



								<div align="center">


									<p>
										<a href='/fire/findId'>아이디찾기</a> <span> | </span><a
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