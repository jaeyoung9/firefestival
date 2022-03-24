<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>

<!-- JS -->
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
							<a href="">
								<i class="fa fa-phone"></i>
								지누션-전화번호
							</a>
						</div>
					</div>
					<div class="col-lg-6 col-sm-6 col-8 header-top-right no-padding">
						<ul>
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
							<li><a href="#"><i class="fa fa-behance"></i></a></li>
						</ul>
						<ul>
							<c:choose>
							<c:when test="${USER_ID == null }">
							<li>
							<a href="<c:url value='/loginForm'/>">로그인</a>
							</li>
							<li>
								<a href="<c:url value='/joinForm'/>">회원가입</a>
							</li>
							</c:when>
							
							<c:when test="${USER_ID != null}">
							<c:if test="${AMIN_TIM eq 'Y'}">
							<li>
								<a href="#">관리자페이지</a>
							</li>
							</c:if>
							<li>
								<a><c:out value="${USER_ID} 님" /></a>
							</li>
							<li>
								<a href="<c:url value='/logout'/>">로그아웃</a>
							</li>
							
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
					<a href="<c:url value='/main'/>"><img src="<%=request.getContextPath() %>/images/logo.jpg" alt="" title="" /></a>
				</div>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li class="menu-active"><a href="<c:url value='/main'/>">home</a></li>
						<li><a href="<c:url value='/intro'/>">소개글/오시는길</a></li>
						<li><a href="about.html">자료실</a></li>
						<li><a href="<c:url value='/notice'/>">공지사항</a></li>
						<li class="menu-has-children"><a href="">먹거리/푸드트럭</a>
							<ul>
								<li><a href="blog-home.html">먹거리</a></li>
								<li><a href="blog-single.html">푸드트럭</a></li>
							</ul>
						</li>
						<li class="menu-has-children"><a href="">이벤트</a>
							<ul>
								<li><a href="portfolio-details.html">진행</a></li>
								<li><a href="elements.html">종료</a></li>
							</ul>
						</li>
						<li><a href="<c:url value='/reviewPage'/>">리뷰</a></li>
					</ul>
				</nav>
				<!--######## #nav-menu-container -->
			</div>
		</div>
	</header>
</body>
<script>

</script>