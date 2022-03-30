<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>

</head>
<body>
<div class="container py-3" style="justify-content: center">
<form id="noticeGo" action="/notice/Go" method="POST" enctype="multipart/form-data">
<table>
		<tr>
			<td>
				<div class="form-group">
             	   <label class="form-label mt-4">제목</label>
           		     <input type="text"  class="form-control" name="NOTICE_TITLE" id="NOTICE_TITLE" value="">
          	    </div>
            </td>
        </tr>
		<tr>
			<td>
				<div class="form-group">
                	<label class="form-label mt-4">내용</label>
                	<textarea name="NOTICE_CONTENT"  class="form-control editor" id="NOTICE_CONTENT" class="editor" maxlength="3000"></textarea>
                	<!-- <script>CKEDITOR.replace('NOTICE_CONTENT');</script>-->
            	</div>
            </td>
		</tr>
		<tr>
			<td>
				<div class="form-group">
                	<label class="form-label mt-4">파일</label>
                	<input type="file" accept="image/jpg,image/png,image/jpeg,image/gif" class="form-control" id="NOTICE_NEW_IMG" name="file">
            	</div>
			</td>
		</tr>
<tr>
<td>
<button type="button" class="primary-btn header-btn text-capitalize mt-10 submit" >등록</button>
</td>
</tr>

	</table>
</form>
</div>
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
					console.log('jQeury ajax form submit success' );
					alert("작성완료." + NOTICE_CONTENT);
				},
				error : function(data) {
					console.log('jQeury ajax form submit error');
				},
				complete : function() {
					console.log('jQeury ajax form submit complete');
				}
			});//end ajax

		});
	});
</script>
</html>