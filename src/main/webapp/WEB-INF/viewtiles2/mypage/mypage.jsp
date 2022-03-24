<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="mypagemain">
	<div class="mypagetop"><h1>마이페이지</h1>
	<a href="../mypage/checkPwForm"><p>회원정보수정</p></a>
		
	</div>
	
	<input type="hidden" id="USER_ID" value="${USER_ID }">
	<div class="mypagereview">
	<c:forEach items="${myreview }" var="myreview">
	<div class="mypagereviewlist">
	${myreview.REVIEW_TITLE }<br><br>
	</div>
	</c:forEach>
	</div>
	
	<div class="mypageevent">
	<c:forEach items="${myevent }" var="myevent">
	<div class="mypageeventlist">
	${myevent.EVENT_TITLE }<br><br>
	</div>
	</c:forEach>
	</div>

</div>

</body>
</html>