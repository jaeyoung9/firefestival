<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
</head>
<body>

<form id="noticeGo" action="/notice/Go" method="POST" enctype="multipart/form-data">
	<div>
		제목<br><input type="text" name="NOTICE_TITLE" id="NOTICE_TITLE"><br>
		<textarea name="NOTICE_CONTENT" maxlength="3000" id="NOTICE_CONTENT" cols="50"
				rows="25" class="" required></textarea><br>

<input type="file" id="NOTICE_NEW_IMG" name="file"><br>
<input type="button" class="submit" value="등록">
	</div>
</form>

</body>

<script type="text/javascript">
	$(document).ready(function() {

		$('.submit').on('click', function() {

			var form = $('#noticeGo');

			var formData = new FormData(form[0]);

			formData.append("file", $('input[name=file]')[0].files[0]);

			$.ajax({
				url : '/fire/notice/Go',
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