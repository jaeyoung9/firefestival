<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갤러리 작성</title>
<style type="text/css">
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-15 col-md-10 col-lg-7 mx-auto">
				<div class="card card-signin my-10">
					<div class="card-body">
						<div align="center">
							<h1 class="card-title text-center">
								<strong>갤러리 작성</strong>
							</h1>
							<form id="dataWrite" method="POST" enctype="multipart/form-data">
								<table>
									<tr>
										<td>
											<div class="form-group">
												<label class="form-label mt-4">제목</label>
												<input type="text" class="form-control" name="DATA_TITLE" maxlength="3000"
													id="DATA_TITLE" size="60" value="${ddetail.DATA_TITLE}" >
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="form-group">
												<label class="form-label mt-4">내용</label>
												<textarea name="DATA_CONTENT" class="form-control editor"
													id="DATA_CONTENT" class="editor" maxlength="3000">${ddetail.DATA_CONTENT}</textarea>
												<!-- <script>CKEDITOR.replace('EVENT_CONTENT');</script>-->
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="form-group">
												<label class="form-label mt-4">파일</label>
												<input type="file"
													accept="image/jpg,image/png,image/jpeg,image/gif"
													class="form-control" id="DATA_THUMB" name="file">
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<button type="button" name="write"
												class="primary-btn header-btn text-capitalize mt-10">등록</button>
											<button type="button"
												class="primary-btn header-btn text-capitalize mt-10"
												onclick="history.back();">취소</button>
										</td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(document).ready(function() {

		$("button[name='write']").on('click', function() {
			
			var DATA_TITLE = $("#DATA_TITLE").val()
			var DATA_CONTENT = $("#DATA_CONTENT").val()
			var DATA_THUMB = $("#DATA_THUMB").val()

			var form = $('#dataWrite');
			var formData = new FormData(form[0]);

			formData.append("file", $('input[name=file]')[0].files[0]);
			
			if (DATA_TITLE == null || DATA_TITLE == '') {
				alert("제목을 입력하세요.");
				return 0;
			} else if (DATA_CONTENT == null || DATA_CONTENT == '') {
				alert("내용을 입력하세요.");
				return 0;
			} else if (DATA_THUMB == null || DATA_THUMB == '') {
				alert("파일을 첨부하세요.");
				return 0;
			} else if (confirm("등록하시겠습니까??") == true) {
				alert("등록되었습니다.");
	
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
					location.href="<c:url value='/data'/>";
					console.log('jQuery ajax form submit success');	
				},
				error : function(data) {
					console.log('jQuery ajax form submit error' + data);
				},
				complete : function() {
					console.log('jQuery ajax form submit complete');
				}
			});
			} 
		});
	});
</script>
</html>