<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script type="text/javascript">
	/*	
	 $(document).ready(function() {
	
	 $("a[name='title']").on("click", function(e) {
	 e.preventDefault();
	 fn_EventApply($(this));
	 });
	 });

	 function fn_EventApply(obj) {
	 var comSubmit = new ComSubmit();
	 comSubmit.setUrl("<c:url value='/event/Detail?EVENT_INDEX=${EVENT_INDEX}'/>");
	 comSubmit.addParam("EVENT_INDEX", obj.parent().find("#EVENT_INDEX").val());
	 comSubmit.submit();
	 } */
</script>



</head>
<body>
	<div class="mypagemain">
		<div class="mypagetop">
			<h1>
				<strong>마이페이지</strong>
			</h1>
			<br> <a href="/fire/mypage/checkPwForm"><h3>회원정보수정</h3></a><br>
			<a><h3 class="card-title text-left">이벤트 신청 내역</h3></a>
			<input type="hidden" name="USER_ID" id="USER_ID" value="${USER_ID}" />
			<div class="row" align="left">
				<div class="col-sm-15 col-md-10 col-lg-20" align="left" style="padding: 10px; margin: 5px;">
					<div class="card card-signin my-10" align="left">
						<div class="card-body" align="left" style="padding: 5px; margin: 5px;">
							<div align="left">
								<div>
									<c:forEach items="${userApplyList}" var="userApplyList">
										<div>
											<div>
												<td>
													<h4>
														신청한 이벤트 제목 : <a href="event/Detail?EVENT_INDEX=${userApplyList.EVENT_INDEX}">
															${userApplyList.EVENT_TITLE}</a>
													</h4>
												</td>
												<td>
													<h4>
														신청한 이벤트 당첨 여부 : <a>${userApplyList.EVENT_WIN}</a>
													</h4>
													<br>
												</td>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>

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
	<div style="max-width: 1400px; margin: 60px" id='calendar'></div>
</body>
<%@ include file="/WEB-INF/viewtiles2/include/include-body.jspf"%>
</html>