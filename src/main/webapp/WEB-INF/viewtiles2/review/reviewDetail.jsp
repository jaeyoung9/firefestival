<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:forEach items="${reviewDetail }" var="reviewDetail">
<title>리뷰상세 - ${reviewDetail.REVIEW_TITLE}</title>
</c:forEach>
</head>
<body>

<div class="bg-light">
<div class="container py-3" style="margin: 0 auto; width: 503px;">
	<div class="row align-items-center justify-content-between">
		
			<a class="navbar-brand h1 text-align:center" href="/fire/reviewDetail">
				<span class="text-dark h1">리뷰</span><span class="text-primary h1">상세</span>
			</a>
		</div>
				
   <c:forEach items="${reviewDetail}" var="reviewDetail">
<div>         
   <img alt="${reviewDetail.REVIEW_ORIGINAL}" src="<%=request.getContextPath()%>/images/UP/${reviewDetail.REVIEW_NEW_IMG}" width="473" height="373"/><br>
				
				<label class="form-label mt-4">내가 쓴 내용</label>
				<div class="card">
				${reviewDetail.REVIEW_CONTENT}<br>
				</div>
	
		<c:choose>
			<c:when test="${USER_ID eq reviewDetail.USER_ID}">
				<button id="reviewUpdate" name="reviewUpdate" class="primary-btn header-btn text-capitalize mt-10">리뷰수정</button>
				<button id="reviewDelete" name="reviewDelete" class="primary-btn header-btn text-capitalize mt-10">리뷰삭제</button>
				<button type="button"class="primary-btn header-btn text-capitalize mt-10" style="float:right;" onclick="location.href='/fire/review'">목 록</button>
			</c:when>
			<c:otherwise>
				<button type="button"class="primary-btn header-btn text-capitalize mt-10" style="float:right;" onclick="location.href='/fire/review'">목 록</button>
				<br>
				<br>
			</c:otherwise>
		</c:choose>
	
			
						
			<input type="hidden" id="USER_ID" name="USER_ID" value="${USER_ID}">
			<input type="hidden" id="REVIEW_INDEX" name="REVIEW_INDEX" value="${reviewDetail.REVIEW_INDEX}">
			
</div>
   </c:forEach>
   	<%@ include file="/WEB-INF/viewtiles2/include/include-body.jspf"%>
</div>
</div>
</body>
<script type="text/javascript">
				$("button[name='reviewUpdate']").on("click", function(e) {
				e.preventDefault();
				fn_ReviewUpdate($(this)); 
			});
		

		 function fn_ReviewUpdate(obj) {
			var aaa = obj.parent().find("#REVIEW_INDEX").val();
			//alert(aaa);
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/reviewUpdate'/>");
			comSubmit.addParam("REVIEW_INDEX", obj.parent().find("#REVIEW_INDEX").val());
			comSubmit.addParam("USER_ID", obj.parent().find("#USER_ID").val());
			comSubmit.submit(); 
		} 

			
			$("button[name='reviewDelete']").on("click", function(e) {
				e.preventDefault();
				fn_ReviewDelete($(this)); 
			});
		

		 function fn_ReviewDelete(obj) {
			var aaa = obj.parent().find("#REVIEW_INDEX").val();
			//alert(aaa);
			var comSubmit = new ComSubmit(); 
			comSubmit.setUrl("<c:url value='/reviewDelete'/>");
			 
			comSubmit.addParam("REVIEW_INDEX", obj.parent().find("#REVIEW_INDEX").val());
			comSubmit.submit(); 
		} 

				
	</script>
</html>