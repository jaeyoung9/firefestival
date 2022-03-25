<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기 결과</title>
</head>
<body>

<div>
		<div>
			
			<div style="text-align:center; margin-top: 15%; margin-bottom: 419px;">
				<H3>
				<c:if test="${empty list || list==''}">
				조회된 아이디가 없습니다.
				</c:if>
				</H3>
				
				<c:if test="${list != null && list != ''}">
					<c:forEach items="${list}" var="item" varStatus="i">
						<div>
							회원님의 아이디는 <c:out value="${item.USER_ID}" /> 입니다.
						</div>
					</c:forEach>
				</c:if>
			
				
				<p>
					<button class="w-btn w-btn-pink" type="submit" onclick="location.href='http://localhost:9000/fire/loginForm'">로그인</button>
					<button class="w-btn w-btn-pink" type="submit" onclick="location.href='http://localhost:9000/fire/main'">메인으로</button>
					<button class="w-btn w-btn-pink" type="submit" onclick="location.href='http://localhost:9000/fire/findPw'">비밀번호 찾기</button>
				</p>
			</div>
			
		</div>
	</div>

</body>
</html>