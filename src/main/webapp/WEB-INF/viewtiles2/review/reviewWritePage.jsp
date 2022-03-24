<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	$(document).ready(function() {
		$('.submit').on('click', function() {
			var form = $('#Upload');
			var formData = new FormData(form[0]);
			formData.append("file", $('input[name=file]')[0].files[0]);
			$.ajax({
				url : '/fire/reviewWritePage',
				type : 'POST',
				data : formData,
				processData : false,
				contentType : false,
				beforeSend : function() {
					console.log('jQeury ajax form submit beforeSend');
				},
				success : function(data) {
					console.log('jQeury ajax form submit success');
					alert("업로드완료");
					/* location.href = "<c:url value='/myPage?USER_ID=${USER_ID}'/>"; */
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
<meta charset="UTF-8">
<title>공지사항 작성</title>
</head>
<body>

<form id="Upload" action="/reviewWritePage" method="POST" enctype="multipart/form-data">
<table>
	<div>
		<tr>
		<td>제목</td>
		<td>
		<input type="text" name="REVIEW_TITLE" maxlength="3000" id="REVIEW_TITLE"></td>
		</tr>
		<tr>
		<td>내용</td>
		<td><textarea  name="REVIEW_CONTENT" maxlength="3000" id="REVIEW_CONTENT"></textarea></td>
		</tr>
	</div>
	<tr>
<td></td>
<td>
<input type="file" id="REVIEW_NEW_IMG" name="file">
</td>
</tr>
<tr>
<td></td>
<td>
<button type="button" class="submit" >등록</button>
</td>
</tr>
	</table>
</form>
</body>
</html>