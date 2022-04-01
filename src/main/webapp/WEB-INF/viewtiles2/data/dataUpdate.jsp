<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갤러리 수정</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-15 col-md-10 col-lg-7 mx-auto">
				<div class="card card-signin my-10">
					<div class="card-body">
						<div align="center">
							<h1 class="card-title text-center">
								<strong>갤러리 수정</strong>
							</h1>
							<form id="dataUpdate" action="/data/Update" method="POST"
								enctype="multipart/form-data">
								<c:forEach items="${DDetail}" var="ddetail">
									<input type="hidden" name="DATA_INDEX" id="DATA_INDEX"
										value="${ddetail.DATA_INDEX}">
									<table>
										<tr>
											<td>
												<div class="form-group">
													<label class="form-label mt-4">제목</label> <input
														type="text" size="60" class="form-control"
														name="DATA_TITLE" id="DATA_TITLE"
														value="${ddetail.DATA_TITLE}" maxlength="3000">
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="form-group">
													<label class="form-label mt-4">내용</label>
													<textarea name="DATA_CONTENT" class="form-control"
														id="DATA_CONTENT" class="editor" maxlength="3000">${ddetail.DATA_CONTENT}</textarea>
												</div>
											</td>
										</tr>
										<!-- <script>CKEDITOR.replace('EVENT_CONTENT');</script>-->
										<tr>
											<td>
												<div class="form-group">
													<label class="form-label mt-4">파일</label> <input
														type="file" class="form-control" id="DATA_THUMB"
														name="file">
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<button type="button" name="update"
													class="primary-btn header-btn text-capitalize mt-10">수정</button>
												<button type="button"
													class="primary-btn header-btn text-capitalize mt-10"
													onclick="history.back();">취소</button>
											</td>
										</tr>
									</table>
								</c:forEach>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			
			$("button[name='update']").on('click', function() {

				var form = $('#dataUpdate');
				var formData = new FormData(form[0]);

				formData.append("file", $('input[name=file]')[0].files[0]);
	
				if (confirm("수정하시겠습니까??") == true) {
					alert("수정되었습니다.");
				$.ajax({
					url : '/fire/data/UpUpdate',
					type : 'POST',
					data : formData,
					processData : false,
					contentType : false,
					beforeSend : function() {
						console.log(formData + 'jQeury ajax form submit beforeSend');
					},
					success : function(data) {
						location.href="<c:url value='/data'/>";
						console.log('jQeury ajax form submit success');
					},
					error : function(data) {
						console.log('jQeury ajax form submit error');
					},
					complete : function() {
						console.log('jQeury ajax form submit complete');
					}
				});//end ajax
				}
			});
		});
	</script>
</body>
</html>