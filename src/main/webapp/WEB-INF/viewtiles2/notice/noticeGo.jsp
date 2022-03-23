<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
</head>
<body>

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
		<td><textarea style="display:none;" name="NOTICE_CONTENT" maxlength="3000" id="NOTICE_CONTENT"></textarea></td>
		</tr>
<script id="smartEditor" type="text/javascript"> 
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "NOTICE_CONTENT",  //textarea ID 입력
	    sSkinURI: "<c:url value='/smart/SmartEditor2Skin.html'/>",  //martEditor2Skin.html 경로 입력
	    fCreator: "createSEditor2",
	    htParams : { 
	    	// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
	        bUseToolbar : true, 
		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
		bUseVerticalResizer : true, 
		// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
		bUseModeChanger : false
	 
	    }
	});
</script>
	</div>
	<tr>
<td></td>
<td>
<input type="file" id="NOTICE_NEW_IMG" name="file">
</td>
</tr>
<tr>
<td></td>
<td>
<button type="button" class="submit" >등록</button>
</td>
</tr>
	</table>
</form>

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
					console.log('jQeury ajax form submit success');
					alert("작성완료.");
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