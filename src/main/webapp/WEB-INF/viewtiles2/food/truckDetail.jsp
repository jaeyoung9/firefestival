<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:forEach items="${fdetail}" var="fdetail">
	<title>TRUCK - ${fdetail.FOOD_CONTENT}</title>
</c:forEach>
</head>
<body>
	<div style="text-align: center">
		<c:forEach items="${fdetail}" var="fdetail">
			<div>
				<img alt="${fdetail.FOOD_IMG}"
					src="<%=request.getContextPath()%>/images/UP/${fdetail.FOOD_THUMB}" height="500" width="700" /><br>
				${fdetail.FOOD_CONTENT}<br>

				<c:choose>
					<c:when test="${USER_ID == null }">
						<button type="button"
								class="primary-btn header-btn text-capitalize mt-10" onclick="location.href='/fire/food'">목 록</button>
					</c:when>

					<c:when test="${USER_ID != null}">
						<c:if test="${AMIN_TIM eq 'Y'}">
							<button id="Update" name="Update"
								class="primary-btn header-btn text-capitalize mt-10">수 정</button>
							<button id="Delete" name="Delete"
								class="primary-btn header-btn text-capitalize mt-10">삭 제</button>
							<button type="button"
								class="primary-btn header-btn text-capitalize mt-10" onclick="location.href='/fire/truck'">목 록</button>
						</c:if>
					</c:when>
					<c:otherwise>

					</c:otherwise>
				</c:choose>

				<input type="hidden" id="FOOD_INDEX" name="FOOD_INDEX" value="${fdetail.FOOD_INDEX}">
			</div>
		</c:forEach>
		<%@ include file="/WEB-INF/viewtiles2/include/include-body.jspf"%>
	</div>
</body>
<script type="text/javascript">
	$("button[name='Update']").on("click", function(e) {
		e.preventDefault();
		fn_FoodUpdate($(this));
	});

	function fn_FoodUpdate(obj) {
		var aaa = obj.parent().find("#FOOD_INDEX").val();
		//alert(aaa);
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/food/Update'/>");
		comSubmit.addParam("FOOD_INDEX", obj.parent().find("#FOOD_INDEX").val());
		comSubmit.submit();
	}

	$("button[name='Delete']").on("click", function(e) {
		e.preventDefault();
		fn_FoodDelete($(this));
	});

	function fn_FoodDelete(obj) {
		var aaa = obj.parent().find("#FOOD_INDEX").val();
		//alert(aaa);
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/food/Delete'/>");
		comSubmit.addParam("FOOD_INDEX", obj.parent().find("#FOOD_INDEX").val());
		alert("삭제 완료");
		comSubmit.submit();
	}
</script>
</html>