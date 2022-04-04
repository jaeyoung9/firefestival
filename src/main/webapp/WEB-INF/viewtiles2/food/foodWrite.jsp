<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>먹거리/푸드트럭 작성</title>
<style type="text/css">
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
								<strong>먹거리/푸드트럭 작성</strong>
							</h1>
							<form id="foodWrite" method="POST" enctype="multipart/form-data">
								<table>
									<tr>
										<td>
											<div class="form-group">
												<label class="form-label mt-4">카테고리</label>
												<input type="text" class="form-control" name="FOOD_KATE" maxlength="1" id="FOOD_KATE"
													placeholder="먹거리: F  /  푸드트럭: T" value="${fdetail.FOOD_KATE}" />
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="form-group">
												<label class="form-label mt-4">내용</label>
												<textarea rows="25" cols="500" name="FOOD_CONTENT" class="form-control editor" id="FOOD_CONTENT"
													maxlength="1500" placeholder="최대 1,500자까지 입력 가능">${fdetail.FOOD_CONTENT}</textarea>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="form-group">
												<label class="form-label mt-4">파일</label>
												<input type="file"
													accept="image/jpg,image/png,image/jpeg,image/gif"
													class="form-control" id="FOOD_THUMB" name="file">
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
			
			var FOOD_KATE = $("#FOOD_KATE").val()
			var FOOD_CONTENT = $("#FOOD_CONTENT").val()
			var FOOD_THUMB = $("#FOOD_THUMB").val()

			var form = $('#foodWrite');
			var formData = new FormData(form[0]);

			formData.append("file", $('input[name=file]')[0].files[0]);
			
			if (FOOD_KATE == null || FOOD_KATE == '') {
				alert("카테고리를 입력하세요.");
				return 0;
			} else if (FOOD_CONTENT == null || FOOD_CONTENT == '') {
				alert("내용을 입력하세요.");
				return 0;
			} else if (FOOD_THUMB == null || FOOD_THUMB == '') {
				alert("파일을 첨부하세요.");
				return 0;
			} else if (confirm("등록하시겠습니까?") == true) {
				alert("등록되었습니다.");
				
			$.ajax({
				url : '/fire/food/WWrite',
				type : 'POST',
				data : formData,
				processData : false,
				contentType : false,
				beforeSend : function() {
					console.log('jQuery ajax form submit beforeSend');
				},
				success : function(data) {
					location.href="<c:url value='/amin'/>";
					console.log('jQuery ajax form submit success');	
				},
				error : function(data) {
					console.log('jQuery ajax form submit error' + data);
				},
				complete : function() {
					console.log('jQuery ajax form submit complete');
				}
			});	//end ajax
			} 	//end if문
		});
	});
</script>
</html>