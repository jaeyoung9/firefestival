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
 <c:forEach items="${NDetail}" var="ndetail">
 <input type="hidden" name="NOTICE_INDEX" id="NOTICE_INDEX" value="${ndetail.NOTICE_INDEX}">
<table>
	<div>
		<tr>
		<td>제목</td>
		<td>
		<input type="text" name="NOTICE_TITLE" id="NOTICE_TITLE" value="${ndetail.NOTICE_TITLE}"></td>
		</tr>
		<tr>
		<td>내용</td>
		
		<td><textarea name="NOTICE_CONTENT" class="editor" maxlength="3000"  id="NOTICE_CONTENT">${ndetail.NOTICE_CONTENT}</textarea></td>

		</tr>
		<!-- <script>CKEDITOR.replace('NOTICE_CONTENT');</script>-->
    
	
	<tr>
<td></td>
<td>
${ndetail.NOTICE_NOTICE_ORIGINAL}
<input type="file" class="btn input" id="NOTICE_NEW_IMG" name="file" >
</td>
</tr>
<tr>
<td>
<button type="button" class="btn btn-hover submit" >등록</button>
</td>
</tr>
</div>
	</table>
			</c:forEach>
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
					alert("수정완료.");
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