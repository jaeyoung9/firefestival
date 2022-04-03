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
	<div class="container">
		<div class="row">
			<div class="col-sm-15 col-md-10 col-lg-50 mx-auto">
				<div class="card card-signin my-10">
					<div class="card-body">
						<div align="center">
							<h1 class="card-title text-center">
								<strong>FOOD 수정</strong>
							</h1>
							<form id="foodUpdate" action="/food/Update" method="POST"
								enctype="multipart/form-data">
								<c:forEach items="${FDetail}" var="fdetail">
									<input type="hidden" name="FOOD_INDEX" id="FOOD_INDEX"
										value="${fdetail.FOOD_INDEX}">
									<table>
										<tr>
											<td>
												<div class="form-group">
													<label class="form-label mt-4">FOOD 카테고리(F/T)</label>
													<input type="text" class="form-control"
														name="FOOD_KATE" id="FOOD_KATE"
														value="${fdetail.FOOD_KATE}" maxlength="1">
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="form-group">
													<label class="form-label mt-4">내용</label>
													<textarea rows="25" cols="100" name="FOOD_CONTENT" class="form-control" id="FOOD_CONTENT"
														maxlength="1333" placeholder="최대 1333자 입력 가능">${fdetail.FOOD_CONTENT}</textarea>
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
				
				var EVENT_CONTENT = $("#FOOD_CONTENT").val()
				var EVENT_THUMB = $("#FOOD_THUMB").val()
				
				var form = $('#foodUpdate');
				var formData = new FormData(form[0]);

				formData.append("file", $('input[name=file]')[0].files[0]);
	
				if (FOOD_CONTENT == null || FOOD_CONTENT == '') {
					alert("내용을 입력하세요.");
					return 0;
				} else if (FOOD_THUMB == null ||FOOD_THUMB == '') {
					alert("파일을 첨부하세요.");
					return 0;
				} else if (confirm("수정하시겠습니까??") == true) {
					alert("수정되었습니다.");
				$.ajax({
					url : '/fire/food/UUpdate',
					type : 'POST',
					data : formData,
					processData : false,
					contentType : false,
					beforeSend : function() {
						console.log(formData + 'jQeury ajax form submit beforeSend');
					},
					success : function(data) {
						location.href="<c:url value='/food'/>";
						console.log('jQeury ajax form submit success');
					},
					error : function(data) {
						console.log('jQeury ajax form submit error');
					},
					complete : function() {
						console.log('jQeury ajax form submit complete');
					}
				});	// end ajax
				}	// end if문
			});
		});
	</script>
</body>
</html>