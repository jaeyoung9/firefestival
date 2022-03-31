<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 회원관리</title>
</head>
<body>
	

	<div class="wrap">
		<table class="table table-hover">
			<tbody>
<colgroup>
			<col width="2%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="7%"/>
			<col width="7%"/>
			<col width="7%"/>
			<col width="7%"/>
        </colgroup>
        <thead>
        <tr><th><span></span></th>
        <th><span></span></th>
        <th><span></span></th>
        <th><span></span></th>
        <th><span></span></th>
        <th><span></span></th>
        <form id="form_Search">
        	<th><input type="text" class="form-control is-valid" id="keyword" name="keyword" value="" maxlength="16" placeholder="회원ID"></th>
       		<th><button class="nw-btn primary-btn header-btn text-capitalize mt-10 search">회원조회　　<span class="lnr lnr-arrow-right"></span></button></th>
        </form>
       
        	</tr>
        	<tr class="" style="text-align:center;">
        		<th scope="col">번호</th>
        		<th scope="col">ID</th>
        		<th scope="col">PW</th>
        		<th scope="col">닉네임</th>
        		<th scope="col">블라인드</th>
        		<th scope="col">이벤트</th>
        		<th scope="col">관리자여부</th>
        		<th scope="col">회원탈퇴</th>
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

	$(document).ready(function(){
				
		$('.search').on('click', function() {
			$.ajax({
				url : '/fire/member/keyword',
				Type : "POST",
				dataType : "JSON",
				data : $("#form_Search").serializeArray(),
				success : function(data){
					keyword(data);
				}, error : function(e){
					console.log(e);
				}
				
			});
		});
	});
	
	function keyword(data){
		var body = $("table>tbody");
		body.empty();
		
		$.each(data, function(key, value){
			if(key == "list"){
				var str = "";
				$.each(value, function(key, value){
				//	console.log(value.USER_ID);
				 alert(value.USER_ID);
					str +=
						 "<tr style='text-align:center;'>"
						+ "<a href='#this' name='title'>"
                        + "<td>"
                        + "<a href='#this' name='title'>" + value.USER_NUM + "</a>"
                        + "<input type='hidden' name='title' id='USER_NUM' value=" + value.USER_NUM + ">"
                        + "</td>"
                        + "<td>"
                        + "<a href='#this' name='title'>" + value.USER_ID + "</a>"
                        + "<input type='hidden' name='title' id='USER_NUM' value=" + value.USER_NUM + ">"
                        + "</td>"
                        + "<td>"
                        + "<a href='#this' name='title'>" + value.USER_PW + "</a>"
                        + "<input type='hidden' name='title' id='USER_NUM' value=" + value.USER_NUM + ">"
                        + "</td>"
                        + "<td>"
                        + "<a href='#this' name='title'>" + value.USER_NIC + "</a>"
                        + "<input type='hidden' name='title' id='USER_NUM' value=" + value.USER_NUM + ">"
                        + "</td>"
                        + "<td>"
                        + "<a href='#this' name='title'>" + value.USER_BLIND + "</a>"
                        + "<input type='hidden' name='title' id='USER_NUM' value=" + value.USER_NUM + ">"
                        + "</td>"
                        + "<td>"
                        + "<a href='#this' name='title'>" + value.USER_EVENT + "</a>"
                        + "<input type='hidden' name='title' id='USER_NUM' value=" + value.USER_NUM + ">"
                        + "</td>"
                        + "<td>"
                        + "<a href='#this' name='title'>" + value.AMIN_TIM + "</a>"
                        + "<input type='hidden' name='title' id='USER_NUM' value=" + value.USER_NUM + ">"
                        + "</td>"
                        + "<td>"
                        + "<a href='#this' name='title'>" + value.DEL_GB + "</a>"
                        + "<input type='hidden' name='title' id='USER_NUM' value=" + value.USER_NUM + ">"
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
                       + "<input type='hidden' name='title' id='USER_NUM' value=" + value.USER_NUM + ">"
                        + "</tr>"
                        + "<hr>";
				});
				body.append(str);
			}
		});
		
		}
	</script>
	<script type="text/javascript">
	 	$(document).ready(function() {
			fn_member(1); 

		});
 
		 
		function fn_member(pageNo) {
			var comAjax = new ComAjax(); 
			comAjax.setUrl("<c:url value='/member/page'/>");
			comAjax.setCallback("fn_memberCallbask"); 
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 6);
			comAjax.ajax();
		}

	
		function fn_memberCallbask(data) {

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
					eventName : "fn_member" 
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
                                        + "<a href='#this' name='title'>" + value.USER_NUM + "</a>"
                                        + "<input type='hidden' name='title' id='USER_NUM' value=" + value.USER_NUM + ">"
                                        + "</td>"
                                        + "<td>"
                                        + "<a href='#this' name='title'>" + value.USER_ID + "</a>"
                                        + "<input type='hidden' name='title' id='USER_NUM' value=" + value.USER_NUM + ">"
                                        + "</td>"
                                        + "<td>"
                                        + "<a href='#this' name='title'>" + value.USER_PW + "</a>"
                                        + "<input type='hidden' name='title' id='USER_NUM' value=" + value.USER_NUM + ">"
                                        + "</td>"
                                        + "<td>"
                                        + "<a href='#this' name='title'>" + value.USER_NIC + "</a>"
                                        + "<input type='hidden' name='title' id='USER_NUM' value=" + value.USER_NUM + ">"
                                        + "</td>"
                                        + "<td>"
                                        + "<a href='#this' name='title'>" + value.USER_BLIND + "</a>"
                                        + "<input type='hidden' name='title' id='USER_NUM' value=" + value.USER_NUM + ">"
                                        + "</td>"
                                        + "<td>"
                                        + "<a href='#this' name='title'>" + value.USER_EVENT + "</a>"
                                        + "<input type='hidden' name='title' id='USER_NUM' value=" + value.USER_NUM + ">"
                                        + "</td>"
                                        + "<td>"
                                        + "<a href='#this' name='title'>" + value.AMIN_TIM + "</a>"
                                        + "<input type='hidden' name='title' id='USER_NUM' value=" + value.USER_NUM + ">"
                                        + "</td>"
                                        + "<td>"
                                        + "<a href='#this' name='title'>" + value.DEL_GB + "</a>"
                                        + "<input type='hidden' name='title' id='USER_NUM' value=" + value.USER_NUM + ">"
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
                                       + "<input type='hidden' name='title' id='USER_NUM' value=" + value.USER_NUM + ">"
                                        + "</tr>"
                                    
                                        + "<hr>";

								});
				body.append(str);

			}
		}
	</script>
	
</body>

</html>