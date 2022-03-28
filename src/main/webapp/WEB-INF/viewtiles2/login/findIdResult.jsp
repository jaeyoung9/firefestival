<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기 결과</title>
<style>
.fpw {
	width: 30%;
	height: 100vh;
	display: block;
	justify-content: center;
	align-items: left;
	box-sizing: border-box;
	text-align: left;
	margin: auto;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<!--  -->
						<div align="left">
							<h4 class="card-title text-center">
								<strong>아이디찾기 결과</strong>
							</h4>

						</div>
						<div class="fid" style="font-size: 40px;"></div>



					</div>

<div>
		<div>
			
			
				<H3>
				<c:if test="${empty list || list==''}">
				<div align = "center">
				<h5>조회된 아이디가 없습니다.</h5>
				&nbsp;&nbsp;
				</div>
				</c:if>
				</H3>
				
				<c:if test="${list != null && list != ''}">
					<c:forEach items="${list}" var="item" varStatus="i">
						<div align = "center">
						<h4 class = "card-title text-center">
							<strong>회원님의 아이디는 <c:out value="${item.USER_ID}" /></strong> 입니다.</h4>
						</div>
					</c:forEach>
				</c:if>
			
				<div align = "center">
				<div>
				<a href="<c:url value='/findId/'/>">아이디 찾기</a>
				<span>|</span>
				<a href="<c:url value='/findPw/'/>">비밀번호 찾기</a>
				<span>|</span>
				<a href="<c:url value='/loginForm/'/>">로그인</a>
				</div>
				
			</div>
			
		</div>
	</div>
</div>
</div>
</div>
</div>

</body>
</html>