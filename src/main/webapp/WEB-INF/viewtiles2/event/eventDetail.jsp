<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:forEach items="${edetail}" var="edetail">
	<title>이벤트 - ${edetail.EVENT_TITLE}</title>
</c:forEach>
<script type="text/javascript">
function eventApply() {
		$.ajax({
    	url : "<c:url value='/event/Apply'/>",
  	  	type : "POST",
  	  	dataType :"TEXT",
  	  	data : {
    		"EVENT_INDEX" : $("#EVENT_INDEX").val(),
    		"EVENT_TITLE" : $("#EVENT_TITLE").val(),
    		"USER_ID" : $("#USER_ID").val(),
    	},
    	// 정보 넘기기때 사용할 이름: $("jsp로받아올값").val() 관리자 USER_ID 는 fire
    	success : function (data) {
    		alert("신청이 완료되었습니다.");
    		history.go(-1);
   		}
	})
}
</script>
</head>
<body>
	<div style="text-align: center">
		<%-- 아이디 히든으로 숨김 --%>
		<input type="hidden" id="USER_ID" value="${USER_ID}">
		<c:forEach items="${edetail}" var="edetail">
			<div>
				<div>
					<h2>${edetail.EVENT_TITLE}</h2><br>
				</div>
				<div>
					<img alt="${edetail.EVENT_IMG}"
						src="<%=request.getContextPath()%>/images/UP/${edetail.EVENT_THUMB}" /><br><br><br>
				</div>
				<div>
					<h3>
						<textarea rows="25" cols="100" readonly="readonly">${edetail.EVENT_CONTENT}</textarea><br>
					</h3>
				</div>
				<c:choose>
					<c:when test="${USER_ID == null }">
						<button type="button" onclick="location.href='/fire/event' "
								class="primary-btn header-btn text-capitalize mt-10">목록보기</button>
					</c:when>
					<c:when test="${USER_ID != null and AMIN_TIM eq 'Y'}">
							<button id="Update" name="Update"
								class="primary-btn header-btn text-capitalize mt-10">수정</button>
							<button id="Delete" name="Delete"
								class="primary-btn header-btn text-capitalize mt-10">삭제</button>
							<button type="button" onclick="location.href='/fire/event' "
								class="primary-btn header-btn text-capitalize mt-10">목록보기</button>
					</c:when>
					<c:otherwise>
						<c:if test="${USER_ID != null}">
						<button type="button" class="primary-btn header-btn text-capitalize mt-10" id="apply"
						onclick="eventApply()">신청하기</button>
						<button type="button" onclick="location.href='/fire/event' "
								class="primary-btn header-btn text-capitalize mt-10">목록보기</button>
						</c:if>
					</c:otherwise>
				</c:choose>
				<input type="hidden" id="EVENT_INDEX" name="EVENT_INDEX" value="${edetail.EVENT_INDEX}">
				<input type="hidden" id="EVENT_TITLE" name="EVENT_TITLE" value="${edetail.EVENT_TITLE}">
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
		if (confirm("삭제하시겠습니까??") == true){			 
			alert("삭제되었습니다.");
			comSubmit.submit();
		}
	}
</script>
</html>