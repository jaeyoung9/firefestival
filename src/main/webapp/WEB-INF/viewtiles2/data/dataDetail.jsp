<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:forEach items="${ddetail}" var="ddetail">
	<title>${ddetail.DATA_TITLE}</title>
</c:forEach>
</head>
<body>
	<div style="text-align: center">
		<c:forEach items="${ddetail}" var="ddetail">
			<div>
				<div>
					<h2>${ddetail.DATA_TITLE}</h2><br>
				</div>
				<div>
					<img alt="${ddetail.DATA_IMG}"
						src="<%=request.getContextPath()%>/images/UP/${ddetail.DATA_THUMB}" /><br>
				</div>
				<div>
					<h3>${ddetail.DATA_CONTENT}</h3><br>
				</div>
				<c:choose>
					<c:when test="${USER_ID == null }">
						<button type="button" onclick="location.href='/fire/data' "
								class="primary-btn header-btn text-capitalize mt-10">목록보기</button>
					</c:when>
					<c:when test="${USER_ID != null and AMIN_TIM eq 'Y'}">
							<button id="Update" name="Update"
								class="primary-btn header-btn text-capitalize mt-10">수정</button>
							<button id="Delete" name="Delete"
								class="primary-btn header-btn text-capitalize mt-10">삭제</button>
							<button type="button" onclick="location.href='/fire/data' "
								class="primary-btn header-btn text-capitalize mt-10">목록보기</button>
					</c:when>
					<c:otherwise>
						<c:if test="${USER_ID != null}">
						<button type="button" onclick="location.href='/fire/data' "
								class="primary-btn header-btn text-capitalize mt-10">목록보기</button>
						</c:if>
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
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/data/Delete'/>");
		comSubmit.addParam("DATA_INDEX", obj.parent().find("#DATA_INDEX").val());
		if (confirm("삭제하시겠습니까??") == true){			 
			alert("삭제되었습니다.");
			comSubmit.submit();
		}
	}
</script>
</html>