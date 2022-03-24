<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<c:forEach items="${ndetail}" var="ndetail">
   <title>공지사항 - ${ndetail.NOTICE_TITLE}</title>
   </c:forEach>

</head>
<body>

<div style="text-align: center">
   <c:forEach items="${ndetail}" var="ndetail">
<div>         
   <img alt="${ndetail.NOTICE_ORIGINAL}" src="<%=request.getContextPath()%>/images/UP/${ndetail.NOTICE_NEW_IMG}"/><br>
    ${ndetail.NOTICE_CONTENT}
    <button id="Up" name="Up" class="btn btn-hover submitUp">수정</button>
    <input type="hidden" id="NOTICE_INDEX" name="NOTICE_INDEX" value="${ndetail.NOTICE_INDEX}">
    

   <button class="btn btn-hover">삭제</button>
</div>
   </c:forEach>
   	<%@ include file="/WEB-INF/viewtiles2/include/include-body.jspf"%>
</div>
</body>
<script type="text/javascript">
				$("button[name='Up']").on("click", function(e) { //제목
				e.preventDefault();
				fn_NoticeUp($(this)); //제목클릭하면 fn_openBoardDetail함수가 실행, 인자값으로 $(this)가 넘겨짐.
			}); //이를 jQuery객체를 뜻한다. (게시글 제목인 <a>태그를 의미)
		

		 function fn_NoticeUp(obj) {
			var aaa = obj.parent().find("#NOTICE_INDEX").val();
			alert(aaa);
			var comSubmit = new ComSubmit(); //폼에 동적으로 값을 추가하는 기능을 편하게 사용하기 위함인데, (ComSubmit객체 생성)
			comSubmit.setUrl("<c:url value='/notice/Up'/>");
			// obj.parent().find("#IDX").val()은 jQuery를 이용하여 <a>태그의 부모노드 내에서 IDX라는 값을 가진 태그를 찾아
			  // 그 태그의 값을 가져오도록 한 것이다. 
			comSubmit.addParam("NOTICE_INDEX", obj.parent().find("#NOTICE_INDEX")
					.val()); //이것을 addParam함수가 그 역할을 해주고,
			comSubmit.submit(); //서버로 전송될 키,값을 인자값으로 받는다.
		} 

				
	</script>
</html>