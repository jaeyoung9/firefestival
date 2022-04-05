<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>종료 이벤트</title>
<style>
td {
        text-align: center;
        }
</style>
</head>
<body>
	<div>
		<input type="hidden" id="EVENT_KATE" value="${EVENT_KATE}">
		<div class="wrap">
			<h1 class="card-title text-center">
				<strong>종료된 이벤트</strong>
			</h1>
			<table class="table table-hover">
				<tbody>
				<colgroup>
					<col width="1%" />
					<col width="1%" />
					<col width="1%" />
				</colgroup>
				<thead>
					<tr class="" style="text-align: center;">
						<th scope="col">이벤트 번호</th>
						<th scope="col">이벤트 제목</th>
						<th scope="col">이벤트 이미지</th>
					</tr>
				</thead>
				</tbody>
			</table>
		</div>
		<div class="pagination text-center" id="PAGE_NAVI"
			style="justify-content: center;"></div>
		<!-- 앞으로 페이징 태그가 그려질 부분 (밑에서 공통함수를 이용해 페이징 태그가 작성됨.) -->
		<input type="hidden" class="" id="PAGE_INDEX" name="PAGE_INDEX" />
		<!-- 현재 페이지 번호가 저장될 부분 -->
	</div>

	<!-- include를 하여 어떤 화면을 만들더라도 <body>태그 안쪽의 내용만 바뀌고, 나머지는 항상 똑같이 작성 -->
	<%@ include file="/WEB-INF/viewtiles2/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			fn_event(1);

			$("a[name='title']").on("click", function(e) {
				e.preventDefault();
				fn_EventDetail($(this));
			});
		});

		function fn_EventDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/event/Detail'/>");
			comSubmit.addParam("EVENT_INDEX", obj.parent().find("#EVENT_INDEX").val());
			comSubmit.submit();
		}

		function fn_event(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/event/End/Page'/>");
			comAjax.setCallback("fn_eventCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 6);
			comAjax.ajax();
		}

		function fn_eventCallback(data) {
			
			var total = data.TOTAL;
			var body = $("table>tbody");
			body.empty();

			if (total == 0) {
				var str = "<tr>" + "<td colspan='4'>조회된 결과가 없습니다.</td>"
				+ "</tr>";
				body.append(str);
			} else {
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_event"
				};
				gfn_renderPaging(params);

				var str = "";

				$.each(data.list, function(key, value) {
									str += "<tr style='text-align:center;'>"
											+ "<td>"
											+ "<a href='#this' name='title'>" + value.EVENT_INDEX + "</a>"
											+ "<input type='hidden' name='title' id='EVENT_INDEX' value=" + value.EVENT_INDEX + ">"
											+ "</td>"
											+ "<td>"
											+ "<a href='#this' name='title'>" + value.EVENT_TITLE + "</a>"
											+ "<input type='hidden' name='title' id='EVENT_INDEX' value=" + value.EVENT_INDEX + ">"
											+ "</td>"
											+ "<td>"
											+ "<a href='#this' name='title'>"
											+ "<input type='hidden' name='title' id='EVENT_INDEX' value=" + value.EVENT_INDEX + ">"
											+ "<img src='<%=request.getContextPath()%>/images/UP/"+ value.EVENT_THUMB + " ' height='200' width='300'/>"
											+ "</a>"
											+ "</td>"
											+ "<div class='dots'>"
											+ "<span>"
											+ "</span>"
											+ "<span>"
											+ "</span>"
											+ "<span>"
											+ "</span>"
											+ "</div>"
											+ "<input type='hidden' name='title' id='EVENT_INDEX' value=" + value.EVENT_INDEX + ">"
											+ "</tr>"

											+ "<hr>";

								});
				body.append(str);

				$("a[name='title']").on("click", function(e) { //제목
					e.preventDefault();
					fn_EventDetail($(this));
				});
			}
		}
	</script>
</body>
</html>