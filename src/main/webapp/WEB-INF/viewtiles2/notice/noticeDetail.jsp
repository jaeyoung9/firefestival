<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<c:forEach items="${ndetail}" var="ndetail">
   <title>공지사항 - ${ndetail.NOTICE_TITLE}</title>
   </c:forEach>

</head>
<body>

<div style="text-align: center">
   <c:forEach items="${ndetail}" var="ndetail">
<div>         
   <img alt="${ndetail.NOTICE_ORIGINAL}" src="<%=request.getContextPath()%>/images/UP/${ndetail.NOTICE_NEW_IMG}"/><br>
				${ndetail.NOTICE_CONTENT}<br>

				<c:choose>
					<c:when test="${USER_ID == null }">

					</c:when>

					<c:when test="${USER_ID != null}">
						<c:if test="${AMIN_TIM eq 'Y'}">
							<button id="Up" name="Up" class="primary-btn header-btn text-capitalize mt-10">수정</button>
							<button id="De" name="De" class="primary-btn header-btn text-capitalize mt-10">삭제</button>
						</c:if>

					</c:when>
					<c:otherwise>

					</c:otherwise>
				</c:choose>

				<input type="hidden" id="NOTICE_INDEX" name="NOTICE_INDEX" value="${ndetail.NOTICE_INDEX}">
</div>
   </c:forEach>
   	<%@ include file="/WEB-INF/viewtiles2/include/include-body.jspf"%>
</div>
</body>
<script type="text/javascript">
				$("button[name='Up']").on("click", function(e) {
				e.preventDefault();
				fn_NoticeUp($(this)); 
			});
		

		 function fn_NoticeUp(obj) {
			var aaa = obj.parent().find("#NOTICE_INDEX").val();
			//alert(aaa);
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/notice/Up'/>");
			comSubmit.addParam("NOTICE_INDEX", obj.parent().find("#NOTICE_INDEX")
					.val()); 
			comSubmit.submit(); 
		} 

			
			$("button[name='De']").on("click", function(e) {
				e.preventDefault();
				fn_NoticeDe($(this)); 
			});
		

		 function fn_NoticeDe(obj) {
			var aaa = obj.parent().find("#NOTICE_INDEX").val();
			//alert(aaa);
			var comSubmit = new ComSubmit(); 
			comSubmit.setUrl("<c:url value='/notice/De'/>");
			 
			comSubmit.addParam("NOTICE_INDEX", obj.parent().find("#NOTICE_INDEX")
					.val());
			comSubmit.submit(); 
		} 

				
	</script>
</html>