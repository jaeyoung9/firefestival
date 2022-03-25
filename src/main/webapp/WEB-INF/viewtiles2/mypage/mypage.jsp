<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
<div class="mypagemain">
	<div class="mypagetop"><h1>마이페이지</h1>
	<a href="<c:url value='/mypage/checkPwForm'/>"><p>회원정보수정</p></a>
		
	</div>
	
	<%-- <input type="hidden" id="USER_ID" value="${USER_ID }">
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

</div> --%>

<h2>리뷰 게시판</h2>
	<table class="myreview">
		<colgroup>
			<col width="10%" />
			<col width="*%" />
			<col width="15%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">리뷰</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="row">
						<tr>
							<td>${row.REVIEW_TITLE }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>

		</tbody>
	</table>
<%-- <h2>이벤트 게시판</h2>
	<table class="myevent">
		<colgroup>
			<col width="10%" />
			<col width="*%" />
			<col width="15%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">이벤트</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list1) > 0}">
					<c:forEach items="${list1 }" var="row">
						<tr>
							<td>${row.EVENT_TITLE }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>

		</tbody>
	</table> --%>

</body>
<%@ include file="/WEB-INF/viewtiles2/include/include-body.jspf"%>
</html>