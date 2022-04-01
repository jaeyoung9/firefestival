<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 작성</title>
<style type="text/css">
/* * {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box
}

:after,
:before {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box
}
body {
	margin: 20px;
}

.form-group {
	display: inline-block;
	margin-bottom: 0;
	vertical-align: middle;
}

.form-control {
	display: inline-block;
	width: 100%;
	height: 30px;
	font-size: 12px;
	line-height: 1.42857;
	color: rgb(85, 85, 85);
	background-color: rgb(255, 255, 255);
	background-image: none;
	box-shadow: rgba(0, 0, 0, 0.0745098) 0 1px 1px inset;
	padding: 6px 9px;
	border-width: 1px;
	border-style: solid;
	border-color: rgb(204, 204, 204);
	border-image: initial;
	border-radius: 2px;
	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.form-control[readonly],
fieldset[disabled] .form-control {
	background-color: rgb(238, 238, 238);
	opacity: 1;
}

.form_file .file_load {
	display: inline-block;
	position: relative;
	width: 65px;
	height: 31px;
	cursor: pointer;
}

.form_file .file_load [type="file"] {
	display: inline-block;
	position: absolute;
	width: inherit;
	height: inherit;
	z-index: 1;
	opacity: 0;
}

.form_file .file_load label {
	position: relative;
	z-index: 5;
	cursor: pointer;
}

.btn-default {
	display: inline-block;
	margin-bottom: 0;
	font-weight: normal;
	text-align: center;
	vertical-align: middle;
	touch-action: manipulation;
	cursor: pointer;
	background-image: none;
	white-space: nowrap;
	font-size: 12px;
	user-select: none;
	border-width: 1px;
	border-style: solid;
	background-color: rgb(255, 255, 255);
	border-color: rgb(204, 204, 204);
	border-image: initial;
	padding: 6px 9px;
	border-radius: 2px;
	color: rgb(51, 51, 51);
} */
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-15 col-md-10 col-lg-50 mx-auto">
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
												<input type="text" class="form-control" name="EVENT_TITLE" maxlength="1000" id="EVENT_TITLE"
													placeholder="최대 1000자 입력 가능" value="${edetail.EVENT_TITLE}" />
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="form-group">
												<label class="form-label mt-4">내용</label>
												<textarea rows="25" cols="500" name="EVENT_CONTENT" class="form-control editor" id="EVENT_CONTENT"
													maxlength="1333" placeholder="최대 1333자 입력 가능">${edetail.EVENT_CONTENT}</textarea>
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