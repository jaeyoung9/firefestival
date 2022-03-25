<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>


	<div>



	<div class="wrap">
		<table class="table table-hover">
			<tbody>
<colgroup>
			<col width="2%"/>
			<col width="10%"/>
			<col width="10%"/>
        </colgroup>
        <thead>
        	<tr class="" style="text-align:center;">
        		<th scope="col">번호</th>
        		<th scope="col">제목</th>
        		<th scope="col">작성일자</th>
        	</tr>
        </thead>
			</tbody>
		</table>
</div>

		<div class="pagination text-center" id="PAGE_NAVI" style="justify-content: center;"></div>
		<!-- 앞으로 페이징 태그가 그려질 부분 (밑에서 공통할수를 이용해 페이징 태그가 작성됨.) -->
		<input type="hidden" class="" id="PAGE_INDEX" name="PAGE_INDEX" />
		<!-- 현재 페이지 번호가 저장될 부분 -->
	</div>
	
	
	<!-- include를 하여 어떤 화면을 만들더라도 <body>태그 안쪽의 내용만 바뀌고, 나머지는 항상 똑같이 작성 -->
	<%@ include file="/WEB-INF/viewtiles2/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			fn_notice(1); 

			$("a[name='title']").on("click", function(e) { 
				e.preventDefault();
				fn_NoticeDetail($(this)); 
			});
		});

		 function fn_NoticeDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/notice/Detail'/>");
			comSubmit.addParam("NOTICE_INDEX", obj.parent().find("#NOTICE_INDEX")
					.val());
			comSubmit.submit(); 
		} 

		function fn_notice(pageNo) {
			var comAjax = new ComAjax(); 
			comAjax.setUrl("<c:url value='/notice/page'/>");
			comAjax.setCallback("fn_noticeCallbask"); 
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 6);
			comAjax.ajax();
		}

	
		function fn_noticeCallbask(data) {

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
					eventName : "fn_notice" 
				};
				gfn_renderPaging(params);

			
				var str = "";
				
				$
						.each(
								data.list,
								function(key, value) {
									str +=
										 "<tr style='text-align:center;'>"
										+ "<a href='#this' name='title'>"
                                        + "<td>"
                                        + "<a href='#this' name='title'>" + value.NOTICE_INDEX + "</a>"
                                        + "<input type='hidden' name='title' id='NOTICE_INDEX' value=" + value.NOTICE_INDEX + ">"
                                        + "</td>"
                                        + "<td>"
                                        + "<a href='#this' name='title'>" + value.NOTICE_TITLE+ "</a>"
                                        + "<input type='hidden' name='title' id='NOTICE_INDEX' value=" + value.NOTICE_INDEX + ">"
                                        + "</td>"
                                        + "<td>"
                                        + "<a href='#this' name='title'>" + value.NOTICE_DATE + "</a>"
                                        
                                        + "<input type='hidden' name='title' id='NOTICE_INDEX' value=" + value.NOTICE_INDEX + ">"
                                        + "</td>"
                                        + "</a>"
                                        + "<div class='dots'>"
                                        + "<span>"
                                        + "</span>"
                                        + "<span>"
                                        + "</span>"
                                        + "<span>"
                                        + "</span>"
                                       + "</div>" 
                                       + "<input type='hidden' name='title' id='NOTICE_INDEX' value=" + value.NOTICE_INDEX + ">"
                                        + "</tr>"
                                    
                                        + "<hr>";

								});
				body.append(str);

				
				$("a[name='title']").on("click", function(e) { //제목
					e.preventDefault();
					fn_NoticeDetail($(this));
				});
			}
		}
	</script>
</body>

</html>