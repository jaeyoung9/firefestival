<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
/* 	document.addEventListener('DOMContentLoaded', function() {
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
					eventClick : function(data) {
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
					},
					eventDidMount: function(data) {
						var tooltip = new Tolltip(data.el, {
							title: data.event.extendedProps.description,
							placement: 'top',
							trigger: 'hover',
							container: 'body'
						});
					}
				});

				calendar.render();
			});
		});

	}); */
	 document.addEventListener('DOMContentLoaded', function() {
	        var calendarEl = document.getElementById('calendar');

	        var calendar = new FullCalendar.Calendar(calendarEl, {
	          plugins: [ 'dayGrid' ]
	        });

	        calendar.render();
	      });

	</script>
</head>
<body>

<div id='calendar'></div>
<!-- <div id="fullCalModal" class="modal fade">
						<div class="modal-dialog">
							<div class="modal-content">

								<div class="modal-header">
									<h4 class="modal-title">일정</h4>
								</div>

								<div class="modal-body">

									제목
									<h4 id="title"></h4>
									
									시작일
									<h4 id="start"></h4>
									마감일
									<h4 id="end"></h4>

								</div>
							</div>
						</div>
					</div> -->

</body>
</html>