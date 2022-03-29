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
<div class="bg-light">
<div class="container py-3" style="margin: 0 auto; width: 503px;">
	<div class="row align-items-center justify-content-between">
		
			<a class="navbar-brand h1 text-align:center" href="/fire/reviewWritePage">
				<span class="text-dark h1">리뷰</span><span class="text-primary h1">작성</span>
			</a>
		</div>

<form id="reviewWrite" action="/reviewWrite/Page" method="POST" enctype="multipart/form-data">

<input type="hidden" name="USER_ID" id="USER_ID" value="${USER_ID}">

			<table style="margin: auto;">
				<tr>
					<td>
						<div class="form-group">
							<label class="form-label mt-4">제목</label> <input type="text"
								class="form-control" name="REVIEW_TITLE" id="REVIEW_TITLE">
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<div class="form-group">
							<label class="form-label mt-4">내용</label>
							<textarea name="REVIEW_CONTENT" class="form-control" id="REVIEW_CONTENT" maxlength="3000"></textarea>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<div class="form-group">
							<label class="form-label mt-4">파일</label> <input type="file"
								accept="image/jpg,image/png,image/jpeg,image/gif"
								class="form-control" id="REVIEW_NEW_IMG" name="file">
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<button type="button" class="primary-btn header-btn text-capitalize mt-10 submit" href="<c:url value='/review'/>">등록</button>
					</td>
				</tr>

			</table>
		</form>
		</div>
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