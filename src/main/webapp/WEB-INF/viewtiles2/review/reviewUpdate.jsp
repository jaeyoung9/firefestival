<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<body>
	<div class="bg-light">
<div class="container py-3" style="margin: 0 auto; width: 503px;">
	<div class="row align-items-center justify-content-between">
		
			<a class="navbar-brand h1 text-align:center" href="/fire/reviewUpdate">
				<span class="text-dark h1">리뷰</span><span class="text-primary h1">수정</span>
			</a>
		</div>
		<form id="reviewUpdate" action="/reviewUpdate/up" method="POST"
			enctype="multipart/form-data">
			
				<input type="hidden" id="USER_ID" name="USER_ID" value="${USER_ID}">
				<input type="hidden" name="REVIEW_INDEX" id="REVIEW_INDEX" value="${reviewUp.REVIEW_INDEX}">
				<table style="margin: auto;">
					<tr>
						<td>
							<div class="form-group">
								<label class="form-label mt-4">제목</label> 
								<input type="text" class="form-control" name="REVIEW_TITLE" id="REVIEW_TITLE" value="${reviewUp.REVIEW_TITLE}">
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="form-group">
								<label class="form-label mt-4">내용</label>
								<textarea name="REVIEW_CONTENT" class="form-control" id="REVIEW_CONTENT" maxlength="3000">${reviewUp.REVIEW_CONTENT}</textarea>
							</div>
						</td>
					</tr>

					<tr>
						<td>
							<div class="form-group">
								<label class="form-label mt-4">파일</label> <input type="file" class="form-control" id="REVIEW_NEW_IMG" name="file">
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<button type="button" class="primary-btn header-btn text-capitalize mt-10 submit">등록</button>
						</td>
					</tr>

				</table>
			
		</form>
		</div>
	</div>
	<script type="text/javascript">


	$(document).ready(function() {

		$('.submit').on('click', function() {

			var form = $('#reviewUpdate');
		
			var formData = new FormData(form[0]);

			formData.append("file", $('input[name=file]')[0].files[0]);

			$.ajax({
				url : '/fire/reviewUpdate/up',
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
					location.href = "<c:url value='/reviewDetail'/>";
				},
				error : function(data) {
					console.log('jQeury ajax form submit error' );
				},
				complete : function() {
					console.log('jQeury ajax form submit complete');
				}
			});

		});
	});
</script>

</body>

</html>