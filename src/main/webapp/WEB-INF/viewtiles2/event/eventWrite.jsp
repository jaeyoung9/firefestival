<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://cdn.staticfile.org/jquery/3.1.1/jquery.min.js"></script>
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
	<div style="justify-content: center">
		<form id="eventWrite" action="/fire/event/Write" method="POST"
			enctype="multipart/form-data">
			<table>
				<tr>
					<td>
						<div class="form-group">
							<label class="form-label mt-4">제목</label> <input type="text"
								class="form-control" name="EVENT_TITLE" id="EVENT_TITLE"
								value="${edetail.EVENT_TITLE}">
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
							<input type="file" accept="image/jpg,image/png,image/jpeg,image/gif"
								class="form-control" id="EVENT_THUMB" name="file">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<button class="primary-btn header-btn text-capitalize mt-10">등록</button>
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

			var form = $('#eventWrite');

			var formData = new FormData(form[0]);

			formData.append("file", $('input[name=file]')[0].files[0]);

			$.ajax({
				url : '/fire/event/Write',
				type : 'POST',
				data : formData,
				processData : false,
				contentType : false,
				beforeSend : function() {
					console.log('jQuery ajax form submit beforeSend');
				},
				success : function(data) {
					alert("작성완료." + EVENT_CONTENT);
					console.log('jQuery ajax form submit success');
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