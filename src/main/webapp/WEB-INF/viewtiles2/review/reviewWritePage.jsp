<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
</head>
<body>
<div style="justify-content: center">
<form id="reviewWrite" action="review" method="POST" enctype="multipart/form-data">
<input type="hidden" name="USER_ID" id="USER=ID" value="${USER_ID}">
<table>

				<tr>
					<td>
						<div class="form-group">
							<label class="form-label mt-4">제목</label> 
							<input type="text" class="form-control" name="REVIEW_TITLE" id="REVIEW_TITLE">
						</div>
					</td>
				</tr>
				
				<tr>
					<td>
						<div class="form-group">
							<label class="form-label mt-4">내용</label>
							<textarea name="REVIEW_CONTENT" class="form-control editor" id="REVIEW_CONTENT" class="editor" maxlength="3000"></textarea>
						</div>
					</td>
				</tr>
	
				<tr>
					<td>
						<div class="form-group">
							<label class="form-label mt-4">파일</label> 
							<input type="file" accept="image/jpg,image/png,image/jpeg,image/gif" class="form-control" id="NREVIEW_NEW_IMG" name="file">
						</div>
					</td>
				</tr>
				
				<tr>
					<td>
						<button type="submit" class="primary-btn header-btn text-capitalize mt-10" href="<c:url value='/review'/>">등록</button>
					</td>
				</tr>

</table>
</form>
</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('.submit').on('click', function() {
			var form = $('#reviewWrite');
			var formData = new FormData(form[0]);
			formData.append("file", $('input[name=file]')[0].files[0]);
			$.ajax({
				url : '/fire/reviewWrite/Page',
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
					location.href = "<c:url value='/review'/>";
				},
				error : function(data) {
					console.log('jQeury ajax form submit error' + data);
				},
				complete : function() {
					console.log('jQeury ajax form submit complete');
				}
			});

		});
	});
</script>
</html>