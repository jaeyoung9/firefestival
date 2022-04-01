<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진 갤러리</title>
<style>
td {text-align: center;}
</style>
</head>
<body>
	<div>
		<input type="hidden" id="DATA_KATE" value="${DATA_KATE}">
		<input type="hidden" id="DATA_INDEX" value="${DATA_INDEX}">
		<div class="wrap">
			<h1 class="card-title text-center">			
<p style="background: linear-gradient(to right, #A7A3FF,#FFA7A3, #671cc4, #5673bd); -webkit-background-clip: text; -webkit-text-fill-color: transparent; padding: 0.5em; font-weight: 600;">사진 갤러리</p>
			
			</h1>
			<table class="table table-hover">
				
				<colgroup>
				
					<col width="30%" />
					<col width="30%" />
				</colgroup>
				<thead>
					<tr class="" style="text-align: center;">
				
						<th scope="col">제목</th>
						<th scope="col">사진</th>
					</tr>
				</thead>
				<tbody>
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
			fn_data(1);

			$("a[name='title']").on("click", function(e) {
				e.preventDefault();
				fn_DataDetail($(this));
			});
		});

		function fn_DataDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/data/Detail'/>");
			comSubmit.addParam("DATA_INDEX", obj.parent().find("#DATA_INDEX").val());
			comSubmit.submit();
		}

		function fn_data(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/data/page'/>");
			comAjax.setCallback("fn_dataCallbask");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 6);
			comAjax.ajax();
		}

		function fn_dataCallbask(data) {
			
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
					eventName : "fn_data"
				};
				gfn_renderPaging(params);

				var str = "";

				$.each(data.list, function(key, value) {
									str += "<tr style='text-align:center;'>"
											+ "<a href='#this' name='title'>"
											+ "<td>"
											+ "<a href='#this' name='title'>" + value.DATA_TITLE + "</a>"
											+ "<input type='hidden' name='title' id='DATA_INDEX' value=" + value.DATA_INDEX + ">"
											+ "</td>"
											+ "<td>"
											+ "<a href='#this' name='title'>"
											+ "<input type='hidden' name='title' id='DATA_INDEX' value=" + value.DATA_INDEX + ">"
											+ "<img src='<%=request.getContextPath()%>/images/UP/"+ value.DATA_THUMB + " ' height='200' width='300'/>"
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
											+ "<input type='hidden' name='title' id='DATA_INDEX' value=" + value.DATA_INDEX + ">"
											+ "</tr>"

											+ "<hr>";

								});
				body.append(str);
			}
				$("a[name='title']").on("click", function(e) { //제목
					e.preventDefault();
					fn_DataDetail($(this));
				});
			
		}
	</script>
</body>
</html>