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
		<tr>
			<td>
				<div class="form-group">
             	   <label class="form-label mt-4">제목</label>
           		     <input type="text"  class="form-control" name="NOTICE_TITLE" id="NOTICE_TITLE" value="${ndetail.NOTICE_TITLE}">
          	    </div>
            </td>
        </tr>
		<tr>
			<td>
				<div class="form-group">
                	<label class="form-label mt-4">내용</label>
                	<textarea name="NOTICE_CONTENT"  class="form-control" id="NOTICE_CONTENT" class="editor" maxlength="3000">${ndetail.NOTICE_CONTENT}</textarea>
            	</div>
            </td>
		</tr>
		<!-- <script>CKEDITOR.replace('NOTICE_CONTENT');</script>-->
		<tr>
			<td>
				<div class="form-group">
                	<label class="form-label mt-4">파일</label>
                	<input type="file" class="form-control" id="NOTICE_NEW_IMG" name="file">
            	</div>
			</td>
		</tr>
<tr>
<td>
<button type="button" class="primary-btn header-btn text-capitalize mt-10" >등록</button>
</td>
</tr>

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