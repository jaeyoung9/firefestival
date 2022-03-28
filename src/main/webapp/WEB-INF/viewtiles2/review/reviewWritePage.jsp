<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					/* location.href = "<c:url value='/reviewPage?USER_ID=${USER_ID}'/>"; */
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
	<tr>
			<td>
				<div class="form-group">
             	   <label class="form-label mt-4">제목</label>
           		     <input type="text"  class="form-control" name="REIVEW_TITLE" id="REIVEW_TITLE">
          	    </div>
            </td>
        </tr>
		<tr>
			<td>
				<div class="form-group">
                	<label class="form-label mt-4">내용</label>
                	<textarea name="REIVEW_CONTENT"  class="form-control editor" id="REIVEW_CONTENT" class="editor" maxlength="3000"></textarea>
            	</div>
            </td>
		</tr>
		<tr>
			<td>
				<div class="form-group">
                	<label class="form-label mt-4">파일</label>
                	<input type="file" accept="image/jpg,image/png,image/jpeg,image/gif" class="form-control" id="REVIEW_NEW_IMG" name="file">
            	</div>
			</td>
		</tr>
<tr>
<td>
<button type="button" class="primary-btn header-btn text-capitalize mt-10" >등록</button>
</td>
</tr>
	</table>
</form>
</body>
</html>