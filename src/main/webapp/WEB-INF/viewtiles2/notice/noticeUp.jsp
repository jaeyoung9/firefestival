<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<body>
<div style="justify-content: center">
<form id="noticeUp" action="/notice/Up" method="POST" enctype="multipart/form-data">
<table>
	<div>
		<tr>
		<td>제목</td>
		<td>
		 <c:forEach items="${NDetail}" var="ndetail">
		<input type="text" name="NOTICE_TITLE" id="NOTICE_TITLE" value="${ndetail.NOTICE_TITLE}"></td>
		</tr>
		<tr>
		<td>내용</td>
		
		<td><textarea name="NOTICE_CONTENT" class="editor" maxlength="3000"  id="NOTICE_CONTENT">${ndetail.NOTICE_CONTENT}</textarea></td>
		</c:forEach>
		</tr>
		<!-- <script>CKEDITOR.replace('NOTICE_CONTENT');</script>-->
    
	</div>
	<tr>
<td></td>
<td>
<input type="file" class="btn input" id="NOTICE_NEW_IMG" name="file">
</td>
</tr>
<tr>
<td></td>
<td>
<button type="button" class="btn btn-hover submit" >등록</button>
</td>
</tr>
	</table>
</form>
</div>
<script type="text/javascript">


	$(document).ready(function() {

		$('.submit').on('click', function() {

			var form = $('#noticeUp');
		
			var formData = new FormData(form[0]);

			formData.append("file", $('input[name=file]')[0].files[0]);

			$.ajax({
				url : '/fire/notice/UpUp',
				type : 'POST',
				data : formData,
				processData : false,
				contentType : false,
				beforeSend : function() {
					console.log(formData+ 'jQeury ajax form submit beforeSend');
				},
				success : function(data) {
					console.log('jQeury ajax form submit success' );
					alert("작성완료.");
				},
				error : function(data) {
					console.log('jQeury ajax form submit error' );
				},
				complete : function() {
					console.log('jQeury ajax form submit complete');
				}
			});//end ajax

		});
	});
</script>

</body>

</html>