<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script>
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar'); // new FullCalendar.Calendar(대상 DOM객체, {속성:속성값, 속성2:속성값2..}) 
	$(function() {

		var request = $.ajax({
			url : "/fire/event/calendar",
			method : "GET",
			dataType : "json"

		});

		request.done(function(data) {
			console.log(data);

			var calendarEl = document.getElementById('calendar');

			var calendar = new FullCalendar.Calendar(calendarEl, {
				local : 'ko',
				initialView : 'dayGridMonth',

				headerToolbar : {
					left : 'prev,next today',
					center : 'title',
					right : 'dayGridMonth,timeGridWeek,timeGridDay'
				},
				slotMinTime : '08:00', // Day 캘린더에서 시작 시간
				slotMaxTime : '20:00', // Day 캘린더에서 종료 시간
				dayMaxEvents : true,
				events : data,
				/* eventClick : function(data) {
					console.log('modal', data);
					$('#fullCalModal').modal('show');
					$('#title').html(data.event.title);
					$('#start').html(data.event.startStr);
					var endd = new Date(data.event.endStr);
					endd.setDate(endd.getDate() - 1);
					var end = endd.getFullYear()
							+ '-'
							+ (("00" + (endd.getMonth() + 1).toString())
									.slice(-2))
							+ '-'
							+ (("00" + (endd.getDate()).toString())
									.slice(-2));
					$('#end').html(end);
				}, */
				/* eventDidMount: function(data) {
					var tooltip = new Tolltip(data.el, {
						title: data.event.extendedProps.description,
						placement: 'top',
						trigger: 'hover',
						container: 'body'
					});
				} */
			});

			calendar.render();
		});
	});

});
</script>

</head>
<body>
<div class="mypagemain">
	<div class="mypagetop"><h1>마이페이지</h1>
	<a href="/fire/mypage/checkPwForm"><p>회원정보수정</p></a>
		
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
<div style="max-width: 1400px; margin: 60px" id='calendar'></div>
</body>
<%@ include file="/WEB-INF/viewtiles2/include/include-body.jspf"%>
</html>