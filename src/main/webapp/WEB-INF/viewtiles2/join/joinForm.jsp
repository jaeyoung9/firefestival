<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회원가입</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src = "js/jquery-3.6.0.min.js"></script>
<style type="text/css">
.d-grid.gap-2{
	padding-top: 30px;
}
</style>
</head>
<body>
<div class="bg-light">
<div class="container py-3" style="margin: 0 auto; width: 503px;">
	<div class="row align-items-center justify-content-between">
		
			<a class="navbar-brand h1 text-align:center" href="/fire/joinForm">
				<span class="text-dark h1">회원</span><span class="text-primary h1">가입</span>
			</a>
		</div>
		<form id="joinForm" method="POST" action="<c:url value='/joinOk'/>" enctype="multipart/form-data">
			<div class ="form-group" style="margin-bottom: -12px">
				<label class="form-label mt-4">아이디</label>
				<input type="text" class="form-control" id="user_id" name="USER_ID" onkeyup="fn_joinIdCk()" maxlength="20" placeholder="아이디 입력하세요"><br><span id="idckok" class="paw"></span><br>
				
			</div>
			
			<div class="form-group" style="margin-bottom: -12px">
				<label class="form-label mt-4">닉네임</label>
				<input type="text" class="form-control" id="user_nic" name="USER_NIC" onkeyup="fn_joinNicCk()" maxlength="30" placeholder="닉네임 입력하세요"><br><span id="nicckok" class="paw"></span><br>				
			</div>
			
			<div class="form-group" style="margin-bottom: -12px">
				<label class="form-label mt-4">비밀번호</label>
				<input type="password" class="form-control is-valid" id="user_pw" name="USER_PW" maxlength="16" onkeyup="fn_passCk()" placeholder="비밀번호 입력하세요"><br><br>
			</div>
			
			<div class="form-group" style="margin-bottom: -12px">
				<label class="form-label mt-4">비밀번호 확인</label>
				<input type="password" class="form-control is-valid" id="user_pw2" name="USER_PW2" maxlength="16" onkeyup="fn_passCk()" placeholder="비밀번호 확인하세요"><br><span id="same" class="paw"></span><br>
			</div>
			
			<div class="form-group">
				<label class="form-label mt-4">프로필</label>
				<input type="file" class="form-control" id="user_new_img" name="file">
			</div>
			
			<div class="form-group">
				<button class="primary-btn header-btn text-capitalize mt-10" type="button" onclick="joinform_check();">가입하기</button>
				&nbsp;&nbsp;
				<button class="primary-btn header-btn text-capitalize mt-10" type="reset">취 소</button>
			</div>
		</form>
	</div>
</div>
</body>

<script type="text/javascript">

//비밀번호 일치확인
	function fn_passCk() {
	var user_pw = document.getElementById('user_pw').value;
	var user_pw2 = document.getElementById('user_pw2').value;
	if (user_pw.length < 6 || user_pw.length > 16) {
		document.getElementById('same').innerHTML='비밀번호는 6이상 16이하만 사용';
		document.getElementById('same').style.color='black';
	}
	else if(document.getElementById('user_pw').value!='' && document.getElementById('user_pw2').value!='') {
		 if(document.getElementById('user_pw').value==document.getElementById('user_pw2').value) {
			document.getElementById('same').innerHTML='비밀번호 일치';
			document.getElementById('same').style.color='blue';
		}
		else {
			document.getElementById('same').innerHTML='비밀번호 불일치';
			document.getElementById('same').style.color='red';
		}
	}
}
    

//아이디 체크
function fn_joinIdCk() {
	var user_id = $("#user_id").val()
    $.ajax({
        url : "http://localhost:9000/fire/joinIdCk",
        type : "POST",
        dataType :"JSON",
        data : {"id" : $("#user_id").val()},
        success : function (data) {
        	if (user_id == "") {
        		document.getElementById('idckok').innerHTML='아이디를 입력하세요.';
        		document.getElementById('idckok').style.color='black';
            } else if (data == 1) {
            	document.getElementById('idckok').innerHTML='중복된 아이디 입니다.';
            	document.getElementById('idckok').style.color='red';
            } else if (data == 0) {
            	document.getElementById('idckok').innerHTML='사용 가능한 아이디 입니다.';
            	document.getElementById('idckok').style.color='blue';
            }
        }

    });
};

//닉네임 체크
function fn_joinNicCk() {
	var user_nic = $("#user_nic").val()
    $.ajax({
        url : "http://localhost:9000/fire/joinNicCk",
        type : "POST",
        dataType :"JSON",
        data : {"nic" : $("#user_nic").val()},
        success : function (data) {
        	if (user_nic == "") {
        		document.getElementById('nicckok').innerHTML='닉네임를 입력하세요.';
        		document.getElementById('nicckok').style.color='black';
            } else if (data == 1) {
            	document.getElementById('nicckok').innerHTML='중복된 닉네임 입니다.';
            	document.getElementById('nicckok').style.color='red';
            } else if (data == 0) {
            	document.getElementById('nicckok').innerHTML='사용 가능한 닉네임 입니다.';
            	document.getElementById('nicckok').style.color='blue';
            }
        }

    });
};
	
//joinform_check 함수로 유효성 검사
function joinform_check() {
  //변수에 담아주기
  	var user_id = $("#user_id").val()
  	var user_nic = $("#user_nic").val()
	var user_pw = $("#user_pw").val()
	var user_pw2 = $("#user_pw2").val()
	

	if (user_id == null || user_id == '') {
		alert("아이디를 입력하세요.");
		return 0;
	} else if (user_nic == null || user_nic == '') {
		alert("닉네임을 입력하세요");
		return 0;
	} else if (user_pw == null || user_pw == '') {
		alert("비밀번호를 입력하세요");
		return 0;
	} else if (user_pw2 == null || user_pw2 == '') {
		alert("비밀번호를 확인하세요");
		return 0;
	} else if (user_pw != user_pw2) {
		alert("비밀번호가 서로 다릅니다.");
		return 0;
	} else if (user_pw.length < 6 || user_pw.length > 16) {
		alert("비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.");
		return 0;
	} else if (document.getElementById('idckok').innerHTML != '사용 가능한 아이디 입니다.') {
		alert("아이디를 변경해주세요.");
		return 0;
	} else if (document.getElementById('nicckok').innerHTML != '사용 가능한 닉네임 입니다.') {
		alert("닉네임를 변경해주세요.");
		return 0;
	}

  	$("#USER_ID").val(user_id)
  	$("#USER_NIC").val(user_nic)
	$("#USER_PW").val(user_pw)
	$("#USER_PW2").val(user_pw2)
  
  //입력 값 전송
  joinForm.submit(); //유효성 검사의 포인트
  alert("가입을 축하드립니다.")
}

//업로드
$(document).ready(function() {

	$('.submit').on('click', function() {
		var form = $('#joinForm');
		var formData = new FormData(form[0]);
		formData.append("file", $('input[name=file]')[0].files[0]);
	$.ajax({
			url : '/fire/joinOk',
			type : 'POST',
			data : formData,
			processData : false,
			contentType : false,
			beforeSend : function() {
				console.log('jQeury ajax form submit beforeSend');
			},
			success : function(data) {
				console.log('jQeury ajax form submit success');
				alert("작성완료.");
			},
			error : function(data) {
				console.log('jQeury ajax form submit error' + data);
			},
			complete : function() {
				console.log('jQeury ajax form submit complete');
			}
		});//end ajax

	});
});
</script>
</html>