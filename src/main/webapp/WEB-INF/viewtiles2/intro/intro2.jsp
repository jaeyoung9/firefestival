<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>

<!DOCTYPE html>
<html lang="UTF-8" class="no-js">

<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="img/fav.png">
<!-- Author Meta -->
<meta name="author" content="colorlib">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>Portfolio Details</title>

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<!--
			CSS
			============================================= -->
<link rel="stylesheet" href="css/linearicons.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/main.css">
</head>

<body>

	<c:forEach items="${intro2}" var="intro2">
		<input type="hidden" id="MAIN_TITLE" value="${intro2.MAIN_TITLE}">
		<input type="hidden" id="MAIN_IMG" value="${intro2.MAIN_IMG}">
		<input type="hidden" id="MAIN_KATE" value="${intro2.MAIN_KATE}">
		<input type="hidden" id="MAIN_CONTENT" value="${intro2.MAIN_CONTENT}">

	
	<!--######## start banner Area ########-->
	<section class="banner-area relative" id="home">
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-black text-uppercase">오시는길</h1>
					<p class="text-black link-nav">
						
					
					</p>
				</div>
			</div>
		</div>
	</section>
	<!--######## End banner Area ########-->

	<!--######## Portfolio Details Area ########-->
	<section class="portfolio_details_area section-gap">
		<div class="container">
			<div class="portfolio_details_inner">
				<div class="row">
					<div class="col-md-6">
						<div class="left_img">
							<img class="img-fluid" src="<%=request.getContextPath()%>/images/UP/${intro2.MAIN_IMG}" alt="">
							
							<!--  <img 
							 
							 width="600px" height="400px"> -->
						 
						</div>
					</div>
					<div class="offset-md-1 col-md-5">
						<div class="portfolio_right_text mt-30">
							<h4>${intro2.MAIN_TITLE}</h4>
							<p>${intro2.MAIN_CONTENT}</p>
							<!-- <ul class="list">
								<li><span>Rating</span>: <i class="fa fa-star"></i><i
									class="fa fa-star"></i><i class="fa fa-star"></i><i
									class="fa fa-star"></i><i class="fa fa-star"></i></li>
								<li><span>Client</span>: colorlib</li>
								<li><span>Website</span>: colorlib.com</li>
								<li><span>Completed</span>: 17 Aug 2018</li>
							</ul>
							<ul class="list social_details">
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-behance"></i></a></li>
								<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
								<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
							</ul> -->
						</div>
					</div>
				</div>
				
			</div>
		</div>


	</section>

	<!--######## End Portfolio Details Area ########-->


	<script src="js/vendor/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
	<script src="js/easing.min.js"></script>
	<script src="js/hoverIntent.js"></script>
	<script src="js/superfish.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/isotope.pkgd.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="js/main.js"></script>
</c:forEach>
</body>
</html>