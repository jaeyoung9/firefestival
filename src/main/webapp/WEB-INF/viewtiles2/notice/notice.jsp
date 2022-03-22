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
		<table>
			<tbody>



			</tbody>
		</table>
</div>

		<div class="PAGE_NAVI" id="PAGE_NAVI"></div>
		<!-- 앞으로 페이징 태그가 그려질 부분 (밑에서 공통할수를 이용해 페이징 태그가 작성됨.) -->
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
		<!-- 현재 페이지 번호가 저장될 부분 -->
	</div>
	
	
	<!-- include를 하여 어떤 화면을 만들더라도 <body>태그 안쪽의 내용만 바뀌고, 나머지는 항상 똑같이 작성 -->
	<%@ include file="/WEB-INF/viewtiles2/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			fn_notice(1); //최초에 화면이 호출되면 1페이지의 내용을 조회하는 것을 의미.

			$("a[name='title']").on("click", function(e) { //제목
				e.preventDefault();
				fn_NoticeDetail($(this)); //제목클릭하면 fn_openBoardDetail함수가 실행, 인자값으로 $(this)가 넘겨짐.
			}); //이를 jQuery객체를 뜻한다. (게시글 제목인 <a>태그를 의미)
		});

		 function fn_NoticeDetail(obj) {
			var comSubmit = new ComSubmit(); //폼에 동적으로 값을 추가하는 기능을 편하게 사용하기 위함인데, (ComSubmit객체 생성)
			comSubmit.setUrl("<c:url value='/notice/Detail'/>");
			// obj.parent().find("#IDX").val()은 jQuery를 이용하여 <a>태그의 부모노드 내에서 IDX라는 값을 가진 태그를 찾아
			  // 그 태그의 값을 가져오도록 한 것이다. 
			comSubmit.addParam("NOTICE_INDEX", obj.parent().find("#NOTICE_INDEX")
					.val()); //이것을 addParam함수가 그 역할을 해주고,
			comSubmit.submit(); //서버로 전송될 키,값을 인자값으로 받는다.
		} 

		function fn_notice(pageNo) { //파라미터로 pageNo를 받는다. (pageNo는 호출하고자 하는 페이지 번호를 의미)
			var comAjax = new ComAjax(); //coomon.js파일에 ComAjax를 사용.
			comAjax.setUrl("<c:url value='/notice/page'/>");
			comAjax.setCallback("fn_noticeCallbask"); //ajax요청이 완료된 후 호출될 함수의 이름을 지정
			comAjax.addParam("PAGE_INDEX", pageNo); //현재 페이지 번호
			comAjax.addParam("PAGE_ROW", 6); //한페이지에 보여줄 행(데이터)의 수
			comAjax.ajax();
		}

		//ajax호출이 되고 난 후 실행되는 콜백함수로 여기서는 화면을 다시 그리는 역할을 수행.
		function fn_noticeCallbask(data) { //(data)는 서버에 전송된 json형식의 결과값이다.

			var total = data.TOTAL;
			var body = $("table>tbody");
			body.empty();
			//기존 c:otherwise태그 부분
			if (total == 0) { //만약 조회된 결과가 0일 경우(데이터가 없을경우), 조회된 결과가 없기 때문에
				var str = "<tr>" + "<td colspan='4'>조회된 결과가 없습니다.</td>"
						+ "</tr>"; //이 문구가 표시된다.
				body.append(str);
			} else { //조회된 결과가 0이 아닐경우(데이터가 존재할 경우)
				var params = { /* common.js파일에서 만든 gfn_renderPaging함수를 수행하기 위해서 파라미터를 만드는 과정이고
															       var변수명={} 선언을 하면 Object가 만들어지고, 거기에 각각 key와 value형식으로 값을 추가한다.*/
					divId : "PAGE_NAVI", //( divId는 key, "PAGE_NAVI"는 value형식이다.")
					pageIndex : "PAGE_INDEX", //( pageIndex는 key, "PAGE_INDEX"는 value형식이다.")
					totalCount : total, //( totalCount는 key, "total"는 value형식이다.")
					eventName : "fn_notice" //( eventName는 key, "fn_selectBoardList"는 value형식이다.")
				};
				gfn_renderPaging(params); //gfn_rederPageing함수를 호출하면 object의 값을 이용하여 페이징 태그를 만든다.

				/* 기존 c:forEach태그 부분 */
				var str = "";
				//data.list가 서버에서 보내준 데이터, 이를 이용해서 jQuery의 .each함수를 사용하여 HTML태그를 만들어준다.
				$
						.each(
								data.list,
								function(key, value) {
									str += "<div class='tile'>"
                                       
                                        + "<a href='#this' name='title'>" 
                                        + "<input type='hidden' name='title' id='GOODS_INDEX' value=" + value.NOTICE_INDEX + ">"
                                        + " <img src='../images/UP/"+value.NOTICE_NEW_IMG +"'height='300' width='450'/>"
                                        + "</a>"
                                        + "<div class='text'>"
                                        + "<p class='animate-text'>"
                                        + "<a href='#this' name='title'>" + value.NOTICE_TITLE + "</a>"
                                        + "<input type='hidden' name='title' id='NOTICE_INDEX' value=" + value.NOTICE_INDEX + ">"
                                        + "</p>"
                                        
                                        + "<p class='animate-text'>"
                                        + "<a href='#this' name='title'>" + value.NOTICE_CONTENT+ "</a>"
                                        + "<input type='hidden' name='title' id='NOTICE_INDEX' value=" + value.NOTICE_INDEX + ">"
                                        + "</p>"
                                        + "<p class='animate-text'>"
                                        + "<a href='#this' name='title'>" + value.NOTICE_TIME + "</a>"
                                        + "<input type='hidden' name='title' id='NOTICE_INDEX' value=" + value.NOTICE_INDEX + ">"
                                        + "</p>"
                                        + "<div class='dots'>"
                                        + "<span>"
                                        + "</span>"
                                        + "<span>"
                                        + "</span>"
                                        + "<span>"
                                        + "</span>"
                                       + "</div>"
                                        + "</div>"
                                        + "</div>";

								});
				body.append(str);

				//새롭게 추가된 각각의 목록의 제목에 상세보기로 이동할 수 있도록 click이벤트를 바인딩 함.
				$("a[name='title']").on("click", function(e) { //제목
					e.preventDefault();
					fn_NoticeDetail($(this));
				});
			}
		}
	</script>
</body>
</html>