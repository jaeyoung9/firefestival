<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회원가입</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src = "js/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="text-sm-center">
<div>
<a href="/fire/joinForm"><h1>회원가입</h1></a>
</div>
<form id="joinForm" method="POST" action="<c:url value='/joinOk'/>"  enctype="multipart/form-data">
<div>
	<h4><label>아이디</label></h4>
		
			<input type="text" id="user_id" name="USER_ID" onkeyup="fn_joinIdCk()" maxlength="20" placeholder="아이디를 입력하세요"><br><span id="idckok" class="paw"></span><br>
		
</div>
<div>
	<h4><label>닉네임</label></h4>
		
			<input type="text" id="user_nic" name="USER_NIC" onkeyup="fn_joinNicCk()" maxlength="30" placeholder="이름을 입력하세요"><br><span id="nicckok" class="paw"></span><br>
		
</div>
<div>
	<h4><label>비밀번호</label></h4>
		
			<input type="password" id="user_pw" class="pw" name="USER_PW" maxlength="30" placeholder="비밀번호를 입력하세요"><br><font id = "checkPw1" size = "2"></font><br>
		
</div>
<div>
	<h4><lable>비밀번호 확인</lable></h4>
		
			<input type="password" id="user_pw2" class="pw" name="USER_PW2" maxlength="30" placeholder="비밀번호를 확인하세요"><br><font id = "checkPw" size = "2"></font><br>
		
</div>
<div>
		<input type="file" id="user_new_img" name="file">
		<button type="button" class="submit" >등록</button>
	</div>


<div class="">
	<button type="button" onclick="joinform_check();">가입하기</button>&nbsp;&nbsp;
	<button type="reset">취 소</button>
</div>
</form>
</div>
</body>

<script type="text/javascript">

//비밀번호 일치확인
	$('.pw').keyup(function(){
    	let pass1 = $("#user_pw").val();
        let pass2 = $("#user_pw2").val();
        if (pass1.length < 6 || pass1.length > 16) {
    		if(pass1){
    			$("#checkPw1").html('비밀번호 6이상 16이하로 입력');
    			$("#checkPw1").attr('color', 'black');
    		}
    	}
        
        if (pass1 != "" || pass2 != ""){
        	if (pass1 == pass2){
            	$("#checkPw").html('일치');
            	$("#checkPw").attr('color','green');
            } else {
            	$("#checkPw").html('불일치');
                $("#checkPw").attr('color','red');
            }
        }
    })
    

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
  	var user_name = $("#user_nic").val()
	var user_pw = $("#user_pw").val()
	var user_pw2 = $("#user_pw2").val()
	

	if (user_id == null || user_id == '') {
		alert("아이디를 입력하세요.");
		return 0;
	} else if (user_nic == null || user_nic == '') {
		alert("이름을 입력하세요");
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