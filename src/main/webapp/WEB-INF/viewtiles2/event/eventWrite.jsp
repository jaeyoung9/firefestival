<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 작성</title>
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
								<strong>이벤트 작성</strong>
							</h1>
							<form id="eventWrite" method="POST" enctype="multipart/form-data">
								<table>
									<tr>
										<td>
											<div class="form-group">
												<label class="form-label mt-4">제목</label>
												<input type="text" class="form-control" name="EVENT_TITLE" maxlength="3000"
													id="EVENT_TITLE" size="60" value="${edetail.EVENT_TITLE}" >
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="form-group">
												<label class="form-label mt-4">내용</label>
												<textarea name="EVENT_CONTENT" class="form-control editor"
													id="EVENT_CONTENT" class="editor" maxlength="3000">${edetail.EVENT_CONTENT}</textarea>
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
													class="form-control" id="EVENT_THUMB" name="file">
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
			
			var EVENT_TITLE = $("#EVENT_TITLE").val()
			var EVENT_CONTENT = $("#EVENT_CONTENT").val()
			var EVENT_THUMB = $("#EVENT_THUMB").val()

			var form = $('#eventWrite');
			var formData = new FormData(form[0]);

			formData.append("file", $('input[name=file]')[0].files[0]);
			
			if (EVENT_TITLE == null || EVENT_TITLE == '') {
				alert("제목을 입력하세요.");
				return 0;
			} else if (EVENT_CONTENT == null || EVENT_CONTENT == '') {
				alert("내용을 입력하세요.");
				return 0;
			} else if (EVENT_THUMB == null ||EVENT_THUMB == '') {
				alert("파일을 첨부하세요.");
				return 0;
			} else if (confirm("등록하시겠습니까??") == true) {
				alert("등록되었습니다.");
				/* $("#EVENT_TITLE").val(EVENT_TITLE)
				$("#EVENT_CONTENT").val(EVENT_CONTENT)
				$("#EVENT_THUMB").val(EVENT_THUMB) */
			$.ajax({
				url : '/fire/event/WWrite',
				type : 'POST',
				data : formData,
				processData : false,
				contentType : false,
				beforeSend : function() {
					console.log('jQuery ajax form submit beforeSend');
				},
				success : function(data) {
					location.href="<c:url value='/event'/>";
					console.log('jQuery ajax form submit success');	
				},
				error : function(data) {
					console.log('jQuery ajax form submit error' + data);
				},
				complete : function() {
					console.log('jQuery ajax form submit complete');
				}
			});//end ajax
			} //end if문
		});
	});
</script>
</html>