<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:forEach items="${edetail}" var="edetail">
	<title>이벤트 - ${edetail.EVENT_TITLE}</title>
</c:forEach>
</head>
<body>
	<div style="text-align: center">
		<c:forEach items="${edetail}" var="edetail">
			<div>
				<img alt="${edetail.EVENT_IMG}"
					src="<%=request.getContextPath()%>/images/UP/${edetail.EVENT_THUMB}" /><br>
				${edetail.EVENT_CONTENT}<br>

				<c:choose>
					<c:when test="${USER_ID == null }">

					</c:when>

					<c:when test="${USER_ID != null}">
						<c:if test="${AMIN_TIM eq 'Y'}">
							<button id="Update" name="Update"
								class="primary-btn header-btn text-capitalize mt-10">수정</button>
							<button id="Delete" name="Delete"
								class="primary-btn header-btn text-capitalize mt-10">삭제</button>
						</c:if>
					</c:when>
					<c:otherwise>

					</c:otherwise>
				</c:choose>

				<input type="hidden" id="EVENT_INDEX" name="EVENT_INDEX" value="${edetail.EVENT_INDEX}">
			</div>
		</c:forEach>
		<%@ include file="/WEB-INF/viewtiles2/include/include-body.jspf"%>
	</div>
</body>
<script type="text/javascript">
	$("button[name='Update']").on("click", function(e) {
		e.preventDefault();
		fn_EventUpdate($(this));
	});

	function fn_EventUpdate(obj) {
		var aaa = obj.parent().find("#EVENT_INDEX").val();
		//alert(aaa);
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/event/Update'/>");
		comSubmit.addParam("EVENT_INDEX", obj.parent().find("#EVENT_INDEX").val());
		comSubmit.submit();
	}

	$("button[name='Delete']").on("click", function(e) {
		e.preventDefault();
		fn_EventDelete($(this));
	});

	function fn_EventDelete(obj) {
		var aaa = obj.parent().find("#EVENT_INDEX").val();
		//alert(aaa);
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/event/Delete'/>");
		comSubmit.addParam("EVENT_INDEX", obj.parent().find("#EVENT_INDEX").val());
		alert("삭제 완료");
		comSubmit.submit();
	}
</script>
</html>