<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 수정</title>
</head>
<body>
	<div class="myup">
		<form id="myUpdate" method="post"
			action="<c:url value='/mypage/myUpdateok'/>">
			<h4 class="myuph4" style="text-align: center">회원정보 수정</h4>
			<div>
				<div>
					<label> 아이디 </label> <span class="box"> <input type="text"
						class="int" id="user_id" name="USER_ID" value="${map.USER_ID }"
						readonly>
					</span>
				</div>
			</div>

			<div>
				<div>
					<label for="user_nic" class="form-label">별명</label> <input
									type="text" class="int" name="USER_NIC"
									id="USER_NIC" placeholder="닉네임" required
									value="${map.USER_NIC }">
				</div>
			</div>



			<div>
				<div>
					<label> 비밀번호 </label> <span class="box"> <input
						type="password" class="int" id="user_pw" name="USER_PW"
						value="${map.USER_PW }" readonly>
					</span>
				</div>
			</div>

			<div>
				<div>
					<label> 비밀번호 확인 </label> <span class="box"> <input
						type="password" class="int" id="user_pw2" name="USER_PW2"
						onkeyup="fn_passCk()" placeholder="비밀번호를 확인해주세요">&nbsp;&nbsp;
					</span>
				</div>
				<span id="same" class="paw"></span>
			</div>
			<div>
				<p>
					<button class="w-btn" type="button" onclick="update_check();">정보수정</button>
					<button class="w-btn" type="button"
						onclick="location.href='/fire/mypage?USER_ID=${USER_ID}'">돌아가기</button>
					<button class="w-btn" type="button" onclick="withdraw();">회원탈퇴</button>
				</p>
			</div>


		</form>
	</div>

</body>
<script type="text/javascript">
function fn_passCk() {
	var user_pw = document.getElementById('user_pw').value;
	var user_pw2 = document.getElementById('user_pw2').value;
	if (user_pw.length < 6 || user_pw.length > 16) {
		document.getElementById('same').innerHTML='비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.';
		document.getElementById('same').style.color='black';
	}
	else if(document.getElementById('user_pw').value!='' && document.getElementById('user_pw2').value!='') {
		 if(document.getElementById('user_pw').value==document.getElementById('user_pw2').value) {
			document.getElementById('same').innerHTML='비밀번호가 일치합니다.';
			document.getElementById('same').style.color='blue';
		}
		else {
			document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
			document.getElementById('same').style.color='red';
		}
	}
}

function update_check() {
	  //변수에 담아주기
		var user_pw = $("#user_pw").val()
		var user_pw2 = $("#user_pw2").val()

		if (user_pw == null || user_pw == '') {
			alert("비밀번호를 입력하세요");
			return 0;
		} else if (user_pw2 == null || user_pw2 == '') {
			alert("비밀번호를 확인하세요");
			return 0;
		} else if (user_pw != user_pw2) {
			alert("비밀번호가 달라서 가입 안된다 고처라");
			return 0;
		} else if (user_pw.length < 6 || user_pw.length > 16) {
			alert("비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.");
			return 0;
		}

		$("#USER_PW").val(user_pw)
		$("#USER_PW2").val(user_pw2)
	  
	  //입력 값 전송
	  myUpdate.submit(); //유효성 검사의 포인트   
	  alert("회원정보가 수정되었습니다")
	}

	function withdraw() {
		if (confirm("정말 탈퇴하시겠습니까??") == true){			 
			 alert("탈퇴되었습니다.");
			 location.href="<c:url value='/mypage/withdraw'/>";
		 }else{   
		     return false;
		 }
	}