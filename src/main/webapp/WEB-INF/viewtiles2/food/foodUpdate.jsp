<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FOOD 수정</title>
</head>
<body>
	<div style="justify-content: center">
		<form id="foodUpdate" action="/food/Update" method="POST"
			enctype="multipart/form-data">
			<c:forEach items="${FDetail}" var="fdetail">
				<input type="hidden" name="FOOD_INDEX" id="FOOD_INDEX"
					value="${fdetail.FOOD_INDEX}">
				<table>
					<tr>
						<td>
							<div class="form-group">
								<label class="form-label mt-4">글</label> <input type="text"
									class="form-control" name="FOOD_CONTENT" id="FOOD_CONTENT"
									value="${fdetail.FOOD_CONTENT}">
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="form-group">
								<label class="form-label mt-4">파일</label>
								<input type="file" class="form-control" id="FOOD_THUMB" name="file">
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<button type="button"
								class="primary-btn header-btn text-capitalize mt-10">등록</button>
							<button type="button"
								class="primary-btn header-btn text-capitalize mt-10" onclick="history.back();">취소</button>
						</td>
					</tr>
				</table>
			</c:forEach>
		</form>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {

			$('.submit').on('click', function() {
	
				var form = $('#foodUpdate');
				var formData = new FormData(form[0]);

				formData.append("file", $('input[name=file]')[0].files[0]);

				$.ajax({
					url : '/fire/food/UpUpdate',
					type : 'POST',
					data : formData,
					processData : false,
					contentType : false,
					beforeSend : function() {
						console.log(formData + 'jQeury ajax form submit beforeSend');
					},
					success : function(data) {
						console.log('jQeury ajax form submit success');
						alert("수정 완료.");
					},
					error : function(data) {
						console.log('jQeury ajax form submit error');
					},
					complete : function() {
						console.log('jQeury ajax form submit complete');
					}
				});	//end ajax
			});
		});
	</script>
</body>
</html>