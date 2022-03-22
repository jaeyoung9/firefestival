<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>


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

<script type="text/javascript">
	$(document).ready(function() {

		$('.btn-grnl-submit').on('click', function() {

			var form = $('#upload');

			var formData = new FormData(form[0]);

			formData.append("file", $('input[name=file]')[0].files[0]);

			$.ajax({
				url : '/fire/introWrite',
				type : 'POST',
				data : formData,
				processData : false,
				contentType : false,
				beforeSend : function() {
					console.log('jQeury ajax form submit beforeSend');
				},
				success : function(data) {
					console.log('jQeury ajax form submit success');
					alert("업로드완료");
					location.href = "/fire/introWritePage"
				},
				error : function(data) {
					console.log('jQeury ajax form submit error');
				},
				complete : function() {
					console.log('jQeury ajax form submit complete');
				}
			});//end ajax

		});
	});
</script>
<title>소개글 등록</title>

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

	<!--######## start banner Area ########-->
	<section class="banner-area relative" id="home">
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-6">
					<h1 class="text-black text-uppercase">소개글 등록하기</h1>

				</div>
			</div>
		</div>
	</section>
	<!--######## End banner Area ########-->

	<!--######## Portfolio Details Area ########-->
	<section class="portfolio_details_area section-gap">
		<div class="container">
			<div class="portfolio_details_inner">

				<div class="offset-md-1 col-md-8">
					<div class="portfolio_right_text mt-30">
						<form id="upload" action="/fire/introWrite" method="POST"
							enctype="multipart/form-data">

							<h4>제목</h4>
							<input type="text" maxlength="300" id="MAIN_TITLE"
								name="MAIN_TITLE" class="" required>
							<p>
								<textarea name="MAIN_CONTENT" id="MAIN_CONTENT" cols="50"
									maxlength="3000" rows="25" class="" required></textarea>

							</p>

							<ul class="list">
								<li><span>파일</span><input type="file" id="MAIN_IMG"
									name="file"></li>
									<li><span>카테고리</span>
								<input type="text" id="MAIN_KATE" name="MAIN_KATE" required maxlength="1">
									
					<!-- 				 <select id="MAIN_KATE">
						<option value="">구독</option>
						<option value="">일반</option>

					</select> -->
									
									</li>
								<li><span>등록</span>
									<button type="button" class="btn btn-primary btn-grnl-submit">소개글
										등록</button></li>

							</ul>
						</form>
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
</body>

</html>