<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<style>
</style>
<body>
	<header id="header" id="home">
		<div class="header-top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-sm-6 col-4 no-padding">
						<div class="header-top-left">
							<a href=""> <i class="fa fa-phone"></i> 지누션-전화번호
							</a>
						</div>
					</div>
					<div class="col-lg-6 col-sm-6 col-8 header-top-right no-padding">
						<ul>
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
							<li><a href="https://colorlib.com/"><i
									class="fa fa-bootstrap"></i></a></li>
							<li><a href="https://github.com/jaeyoung9/firefestival"><i
									class="fa fa-github"></i></a></li>
						</ul>
						<ul>
							<c:choose>
								<c:when test="${USER_ID == null }">
									<li><a href="<c:url value='/loginForm'/>"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock-fill" viewBox="0 0 16 16">
  <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2z"/>
</svg>로그인</a></li>
									<li><a href="<c:url value='/joinForm'/>"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
</svg>회원가입</a></li>
								</c:when>

								<c:when test="${USER_ID != null}">
									<c:if test="${AMIN_TIM eq 'Y'}">
										<li><a href="<c:url value='/amin'/>">관리자페이지</a></li>
									</c:if>
									<li>
										<%-- <a><c:out value="${USER_ID} 님" /></a> --%> <img
										src="<%=request.getContextPath() %>/images/UP/${USER_NEW_IMG}"
										width="40" height="40" alt="" title="" /> <a
										href="<c:url value='/mypage?USER_ID=${USER_ID }'/>">${USER_ID }님</a>
									</li>
									<li><a href="<c:url value='/logout'/>">로그아웃</a></li>

								</c:when>
								<c:otherwise>

								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<hr>
		<div class="container main-menu">
			<div class="row align-items-center justify-content-between d-flex">
				<div id="logo">
					<a href="<c:url value='/main'/>"><img
						src="<%=request.getContextPath()%>/images/logo.jpg" alt=""
						title="" /></a>
				</div>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<c:choose>
							<c:when test="${USER_ID == null }">
								<li class="menu-active"><a href="<c:url value='/main'/>">home</a></li>

								<li class="menu-has-children"><a href="">소개글/오시는길</a>
									<ul>
										<li><a href="<c:url value='/intro'/>">소개글</a></li>
										<li><a href="<c:url value='/intro2'/>">오시는길</a></li>
									</ul></li>




								<li><a href="<c:url value='/data'/>">자료실</a></li>
								<li><a href="<c:url value='/notice'/>">공지사항</a></li>
								<li class="menu-has-children"><a href="">먹거리/푸드트럭</a>
									<ul>
										<li><a href="blog-home.html">먹거리</a></li>
										<li><a href="blog-single.html">푸드트럭</a></li>
									</ul></li>
								<li class="menu-has-children"><a href="">이벤트</a>
									<ul>
										<li><a href="<c:url value='/event'/>">진행</a></li>
										<li><a href="<c:url value='/event'/>">종료</a></li>
									</ul></li>

							</c:when>
							<c:otherwise>

								<li class="menu-active"><a href="<c:url value='/main'/>">home</a></li>
								<li class="menu-has-children"><a href="">소개글/오시는길</a>
									<ul>
										<li><a href="<c:url value='/intro'/>">소개글</a></li>
										<li><a href="<c:url value='/intro2'/>">오시는길</a></li>
									</ul></li>

								<li><a href="<c:url value='/data'/>">자료실</a></li>
								<li><a href="<c:url value='/notice'/>">공지사항</a></li>
								<li class="menu-has-children"><a href="">먹거리/푸드트럭</a>
									<ul>
										<li><a href="blog-home.html">먹거리</a></li>
										<li><a href="blog-single.html">푸드트럭</a></li>
									</ul></li>
								<li class="menu-has-children"><a href="">이벤트</a>
									<ul>
										<li><a href="<c:url value='/event'/>">진행</a></li>
										<li><a href="<c:url value='/event'/>">종료</a></li>
									</ul></li>
								<li><a href="<c:url value='/review'/>">리뷰</a></li>

							</c:otherwise>
						</c:choose>


					</ul>
				</nav>
				<!--######## #nav-menu-container -->
			</div>
		</div>
	</header>
</body>
<script>
	
</script>