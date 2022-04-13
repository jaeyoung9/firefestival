<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<script>
	
</script>

<style>
</style>
<!-- 카카오 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b4fbc66e697d63a13daa41d2abceea27"></script>
</head>
<body>
	<!--######## start banner Area ########-->
	<section class="home-banner-area relative" id="home">
		<div class="container">
			<div class="row fullscreen d-flex align-items-center">
				<div class="banner-content col-lg-9 col-md-12">
					<h1>
						서울 <br> 불꽃축제 <br>
					</h1>
				<!-- 	<a href="#" class="primary-btn header-btn text-capitalize mt-10">보러가기!</a> -->
				</div>
			</div>
		</div>
	</section>
	<!--######## End banner Area ########-->

	<!--######## Start Latest News Area ########-->
	<section class="latest-news-area section-gap">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="main-title text-center">
						<h1>축제 소개</h1>
						<p>
							불꽃놀이를 통해 21세기 한국의 비전을 새롭게 제시하고, 범국민적 영원의 메시지를 담아 민족의 화합의지를 다지는
							기쁨과 희망의 장으로 삼고자 기획된 행사로, 2000년 10월에 처음 개최되었다. 10월 초에 개최되며, (주)한화가
							주관한다.<br> <br>서울특별시 영등포구 여의도 한강시민공원 일대에서 개최되는 국제적인
							불꽃축제.
						</p>
						<a href="<c:url value='/intro'/>"
							class="primary-btn header-btn text-capitalize mt-10">자세히 보기</a>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="single-news card">
						<div id="map" class="card-top-img"
							style="width: 350px; height: 270px;"></div>
						<script>
							var container = document.getElementById('map');
							var options = {
								center : new kakao.maps.LatLng(
										37.526173331250654, 126.93525620814331),
								level : 3
							};

							var map = new kakao.maps.Map(container, options);
						</script>
						<div class="card-body">
							<h4 class="card-title">
								<a href="/fire/intro2"> 위치보기 </a>
							</h4>
							<p class="card-text">매년 10월초에 서울특별시 영등포구 여의도 한강시민공원 일대에서 개최되는
								국제적인 불꽃축제.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	

	<section class="testimonial-area section-gap">
		<div class="container">
			<div class="row">
				<div class="active-testimonial-carusel">

					<div class="single-testimonial item d-flex flex-row">
						<div class="thumb">
							<img class="img-fluid" src="images/elements/java.png" alt="">
						</div>
						<div class="desc">
							<p>정주영, 민재영<br>김성법, 조영준<br>김형태, 안찬수<br>한창식, 이　솔<br><span></span><br><span></span><br></p>
							<h4 mt-30>예비 개발자들</h4>
							<p class="mb-0">In Seoul Firefestival</p>
						</div>
					</div>


					<div class="single-testimonial item d-flex flex-row">
						<div class="thumb">
							<img class="img-fluid" src="images/elements/skill.png" alt="">
						</div>
						<div class="desc">
							<p>
								FrameWork/PlatForm: Mybatis, Spring, Tiles<br> DBMS: Oracle
								11g<br> OS: Window 10<br> Server: Tomcat 9.0<br>
								개발언어: Java, Jsp, HTML5, CSS, Jquery, JavaScript, Ajax<br>
								개발 Tool: Eclipse
							</p>
							<h4 mt-30>개발환경</h4>
							<p class="mb-0">In Seoul Firefestival</p>
						</div>
					</div>

					<div class="single-testimonial item d-flex flex-row">
						<div class="thumb">
							<img class="img-fluid" src="images/elements/plan.jpg" alt="">
						</div>
						<div class="desc">
							<p>
								유스케이스 다이어그램.​<br> 요구 사항 명세서.<br>​스토리보드.​<br>
								DB설계.<br> ERDiagram.<br> 프로젝트 흐름도.
							</p>
							<h4 mt-30>Plan</h4>
							<p class="mb-0">In Seoul Firefestival</p>
						</div>
					</div>

				</div>
			</div>
	</section>
	


</body>
</html>