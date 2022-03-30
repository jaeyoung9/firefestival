<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 작성</title>
</head>
<body>
	<div style="justify-content: center">
		<form id="dataWrite" action="/data/WriteGo" method="POST"
			enctype="multipart/form-data">
			<table>
				<tr>
					<td>
						<div class="form-group">
							<label class="form-label mt-4">제목</label> <input type="text"
								class="form-control" name="DATA_TITLE" id="DATA_TITLE">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label class="form-label mt-4">내용</label>
							<textarea name="DATA_CONTENT" class="form-control editor"
								id="DATA_CONTENT" maxlength="3000"></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label class="form-label mt-4">파일</label>
							<input type="file" accept="image/jpg,image/png,image/jpeg,image/gif"
								class="form-control" id="DATA_THUMB" name="file">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<button type="button" class="primary-btn header-btn text-capitalize mt-10 submit">등록</button>
						<button type="button" class="primary-btn header-btn text-capitalize mt-10"
							onclick="history.back();">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>

<script type="text/javascript">
	$(document).ready(function() {

		$('.submit').on('click', function() {

			var form = $('#dataWrite');

			var formData = new FormData(form[0]);

			formData.append("file", $('input[name=file]')[0].files[0]);

			$.ajax({
				url : '/fire/data/WriteGo',
				type : 'POST',
				data : formData,
				processData : false,
				contentType : false,
				beforeSend : function() {
					console.log('jQuery ajax form submit beforeSend');
				},
				success : function(data) {
					console.log('jQuery ajax form submit success');
					alert("작성완료.");
				},
				
				error : function(data) {
					console.log('jQuery ajax form submit error' + data);
				},
				complete : function() {
					console.log('jQuery ajax form submit complete');
				}
			});//end ajax

		});
	});
</script>
</html>