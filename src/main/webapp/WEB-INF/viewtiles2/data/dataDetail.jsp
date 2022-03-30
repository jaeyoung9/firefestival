<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:forEach items="${ddetail}" var="ddetail">
	<title>자료실 ${ddetail.DATA_TITLE}</title>
</c:forEach>
</head>
<body>
	<div style="text-align: center">
		<c:forEach items="${ddetail}" var="ddetail">
			<div>
				<img alt="${ddetail.DATA_IMG}"
					src="<%=request.getContextPath()%>/images/UP/${ddetail.DATA_THUMB}" /><br>
				${ddetail.DATA_CONTENT}<br>

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

				<input type="hidden" id="DATA_INDEX" name="DATA_INDEX" value="${ddetail.DATA_INDEX}">
			</div>
		</c:forEach>
		<%@ include file="/WEB-INF/viewtiles2/include/include-body.jspf"%>
	</div>
</body>
<script type="text/javascript">
	$("button[name='Update']").on("click", function(e) {
		e.preventDefault();
		fn_DataUpdate($(this));
	});

	function fn_DataUpdate(obj) {
		var aaa = obj.parent().find("#DATA_INDEX").val();
		//alert(aaa);
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/data/Update'/>");
		comSubmit.addParam("DATA_INDEX", obj.parent().find("#DATA_INDEX").val());
		comSubmit.submit();
	}

	$("button[name='Delete']").on("click", function(e) {
		e.preventDefault();
		fn_DataDelete($(this));
	});

	function fn_DataDelete(obj) {
		var aaa = obj.parent().find("#DATA_INDEX").val();
		//alert(aaa);
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/data/Delete'/>");
		comSubmit.addParam("DATA_INDEX", obj.parent().find("#DATA_INDEX").val());
		alert("삭제 완료");
		comSubmit.submit();
	}
</script>
</html>