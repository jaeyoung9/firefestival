<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
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
<form id="noticeGo" action="/notice/Go" method="POST" enctype="multipart/form-data">
<table>
	<div>
		<tr>
		<td>제목</td>
		<td>
		<input type="text" name="NOTICE_TITLE" id="NOTICE_TITLE"></td>
		</tr>
		<tr>
		<td>내용</td>
		<td><textarea name="NOTICE_CONTENT" class="editor" maxlength="3000"  id="NOTICE_CONTENT"></textarea></td>
		</tr>
		<!-- <script>CKEDITOR.replace('NOTICE_CONTENT');</script>-->
    
	</div>
	<tr>
<td></td>
<td>
<input type="file" accept="image/jpg,image/png,image/jpeg,image/gif" name="file"  id="NOTICE_NEW_IMG" >
<!-- <div class="form-group form_file">
  <input class="form-control form_point_color01" type="text" title="첨부된 파일명" readonly style="width:250px">
  <span class="file_load">
		<input type="file" accept="image/jpg,image/png,image/jpeg,image/gif" name="file"  id="NOTICE_NEW_IMG" >
		<label class="btn-default" for="NOTICE_NEW_IMG">찾아보기</label>
	</span>
</div>
 -->

</td>
</tr>
<tr>
<td></td>
<td>
<button type="button" class="btn btn-hover submit" >등록</button>
</td>
</tr>
	</table>
</form>
</div>
</body>

<script type="text/javascript">


	$(document).ready(function() {

		$('.submit').on('click', function() {

			var form = $('#noticeGo');
		
			var formData = new FormData(form[0]);

			formData.append("file", $('input[name=file]')[0].files[0]);

			$.ajax({
				url : '/fire/notice/Go',
				type : 'POST',
				data : formData,
				processData : false,
				contentType : false,
				beforeSend : function() {
					console.log('jQeury ajax form submit beforeSend');
				},
				success : function(data) {
					console.log('jQeury ajax form submit success' );
					alert("작성완료." + NOTICE_CONTENT);
				},
				error : function(data) {
					console.log('jQeury ajax form submit error' + data);
				},
				complete : function() {
					console.log('jQeury ajax form submit complete');
				}
			});//end ajax

		});
	});
</script>
</html>