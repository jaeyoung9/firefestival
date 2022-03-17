<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<script>

</script>

<style>

</style>

</head>
<body>
<!--######## start banner Area ########-->
	<section class="home-banner-area relative" id="home">
		<div class="container">
			<div class="row fullscreen d-flex align-items-center" style="background-image: url(images/fl.jpg);">
			
				<div class="banner-content col-lg-9 col-md-12">
		
					<h1>
						서울<br> 불꽃축제<br> <Br>
					</h1>
					<a href="#" class="primary-btn header-btn text-capitalize mt-10">보러가기!</a>
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
						<h1>소개글/오시는길</h1>
						<p>
						불꽃놀이를 통해 21세기 한국의 비전을 새롭게 제시하고, 범국민적 영원의 메시지를 담아 민족의 화합의지를 다지는 기쁨과 희망의 장으로 삼고자 기획된 행사로, 2000년 10월에 처음 개최되었다. 10월 초에 개최되며, (주)한화가 주관한다.<br>
						<br>서울특별시 영등포구 여의도 한강시민공원 일대에서 개최되는 국제적인 불꽃축제.
						</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="single-news card">
						<img class="card-top-img" src="images/news/map2.png" alt="Card image cap">
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">
									위치보기
								</a>
							</h4>
							<p class="card-text">
							매년 10월초에 서울특별시 영등포구 여의도 한강시민공원 일대에서 개최되는 국제적인 불꽃축제.</p>
						</div>
					</div>
				</div>
				<!-- <div class="col-lg-4 col-md-6">
					<div class="single-news card">
						<img class="card-top-img" src="images/news/n2.jpg" alt="Card image cap">
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">
									Headset No Longer Wired
								</a>
							</h4>
							<p class="card-text">It is a good idea to think of your PC as an office. It stores files, programs, pictures. This
								can be compared to an actual.</p>
						</div>
					</div>
				</div> -->
				<!-- <div class="col-lg-4 col-md-6">
					<div class="single-news card">
						<img class="card-top-img" src="images/news/n3.jpg" alt="Card image cap">
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">
									Life Advice Looking At Window
								</a>
							</h4>
							<p class="card-text">It is a good idea to think of your PC as an office. It stores files, programs, pictures. This
								can be compared to an actual.</p>
						</div>
					</div>
				</div> -->
			</div>
		</div>
	</section>
	<!--######## End Latest News Area ########-->


	<!-- <!--######## Start Recent Completed Project Area ########
	<section class="recent-completed-project section-gap">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="main-title text-center">
						<h1>Our Recent Completed Projects</h1>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua.
						</p>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="filters project-filter">
						<ul>
							<li class="active" data-filter=".all">All Categories</li>
							<li data-filter=".brand">Branding</li>
							<li data-filter=".img-man">Image Manipulation</li>
							<li data-filter=".creative">Creative Work</li>
							<li data-filter=".web">Web Design</li>
							<li data-filter=".print-mat">Print Material</li>
						</ul>
					</div>
					<div class="projects_inner row" id="lightgallery">
						<div class="col-lg-4 col-sm-6 web all" data-src="images/project/p1.jpg">
							<div class="projects_item">
								<img class="img-fluid w-100" src="images/project/p1.jpg" alt="">
								<div class="icon">
									<img class="img-fluid" src="images/icon.png" alt="">
								</div>
							</div>
							<div class="projects_text">
								<h4>
									<a href="portfolio-details.html">3D Helmet Design</a>
								</h4>
								<p>Client Project</p>
							</div>
						</div>
						<div class="col-lg-4 col-sm-6 brand all creative" data-src="images/project/p2.jpg">
							<div class="projects_item">
								<img class="img-fluid w-100" src="images/project/p2.jpg" alt="">
								<div class="icon">
									<img class="img-fluid" src="images/icon.png" alt="">
								</div>
							</div>
							<div class="projects_text">
								<h4>
									<a href="portfolio-details.html">2D Vinyl Design</a>
								</h4>
								<p>Client Project</p>
							</div>
						</div>
						<div class="col-lg-4 col-sm-6 all" data-src="images/project/p3.jpg">
							<div class="projects_item">
								<img class="img-fluid w-100" src="images/project/p3.jpg" alt="">
								<div class="icon">
									<img class="img-fluid" src="images/icon.png" alt="">
								</div>
							</div>
							<div class="projects_text">
								<h4>
									<a href="portfolio-details.html">Creative Poster Design</a>
								</h4>
								<p>Client Project</p>
							</div>
						</div>
						<div class="col-lg-4 col-sm-6 all print-mat" data-src="images/project/p4.jpg">
							<div class="projects_item">
								<img class="img-fluid w-100" src="images/project/p4.jpg" alt="">
								<div class="icon">
									<img class="img-fluid" src="images/icon.png" alt="">
								</div>
							</div>
							<div class="projects_text">
								<h4>
									<a href="portfolio-details.html">Embosed Logo Design</a>
								</h4>
								<p>Client Project</p>
							</div>
						</div>
						<div class="col-lg-4 col-sm-6 brand img-man all" data-src="images/project/p5.jpg">
							<div class="projects_item">
								<img class="img-fluid w-100" src="images/project/p5.jpg" alt="">
								<div class="icon">
									<img class="img-fluid" src="images/icon.png" alt="">
								</div>
							</div>
							<div class="projects_text">
								<h4>
									<a href="portfolio-details.html">3D Disposable Bottle</a>
								</h4>
								<p>Client Project</p>
							</div>
						</div>
						<div class="col-lg-4 col-sm-6 brand work img-man all" data-src="images/project/p6.jpg">
							<div class="projects_item">
								<img class="img-fluid w-100" src="images/project/p6.jpg" alt="">
								<div class="icon">
									<img class="img-fluid" src="images/icon.png" alt="">
								</div>
							</div>
							<div class="projects_text">
								<h4>
									<a href="portfolio-details.html">3D Logo Design</a>
								</h4>
								<p>Client Project</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	######## End Recent Completed Project Area ######## -->

	<!--######## Start testimonial Area ########-->
	<section class="testimonial-area section-gap">
		<div class="container">
			<div class="row">
				<div class="active-testimonial-carusel">
					<div class="single-testimonial item d-flex flex-row">
						<div class="thumb">
							<img class="img-fluid" src="images/elements/user1.png" alt="">
						</div>
						<div class="desc">
							<p>
								Accessories Here you can find the best computer accessory for your laptop, monitor, printer, scanner, speaker, projector,
								hardware.
							</p>
							<h4 mt-30>Mark Alviro Wiens</h4>
							<p class="mb-0">CEO at Google</p>
						</div>
					</div>
					<div class="single-testimonial item d-flex flex-row">
						<div class="thumb">
							<img class="img-fluid" src="images/elements/user2.png" alt="">
						</div>
						<div class="desc">
							<p>
								Accessories Here you can find the best computer accessory for your laptop, monitor, printer, scanner, speaker, projector,
								hardware.
							</p>
							<h4 mt-30>Lina Harrington</h4>
							<p class="mb-0">CEO at Google</p>
						</div>
					</div>
					<div class="single-testimonial item d-flex flex-row">
						<div class="thumb">
							<img class="img-fluid" src="images/elements/user1.png" alt="">
						</div>
						<div class="desc">
							<p>
								Accessories Here you can find the best computer accessory for your laptop, monitor, printer, scanner, speaker, projector,
								hardware.
							</p>
							<h4 mt-30>Mark Alviro Wiens</h4>
							<p class="mb-0">CEO at Google</p>
						</div>
					</div>
					<div class="single-testimonial item d-flex flex-row">
						<div class="thumb">
							<img class="img-fluid" src="images/elements/user2.png" alt="">
						</div>
						<div class="desc">
							<p>
								Accessories Here you can find the best computer accessory for your laptop, monitor, printer, scanner, speaker, projector,
								hardware.
							</p>
							<h4 mt-30>Lina Harrington</h4>
							<p class="mb-0">CEO at Google</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--######## End testimonial Area ########-->

<!-- 	######## Start Latest Blog Area ########
	<section class="latest-blog-area section-gap">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="main-title text-center">
						<h1>Latest From Our Blog</h1>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua.
						</p>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-3 col-md-6 single-blog">
					<div class="thumb">
						<img class="img-fluid w-100" src="images/b1.jpg" alt="">
					</div>
					<p class="date">10 Jan 2018</p>
					<h4>
						<a href="#">Cooking Perfect Fried Rice in minutes</a>
					</h4>
					<p>
						inappropriate behavior ipsum dolor sit amet, consectetur.
					</p>
					<div class="meta-bottom d-flex justify-content-between">
						<p><span class="lnr lnr-heart"></span> 15 Likes</p>
						<p><span class="lnr lnr-bubble"></span> 02 Comments</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 single-blog">
					<div class="thumb">
						<img class="img-fluid w-100" src="images/b2.jpg" alt="">
					</div>
					<p class="date">10 Jan 2018</p>
					<h4>
						<a href="#">Secret of making Heart Shaped eggs</a>
					</h4>
					<p>
						inappropriate behavior ipsum dolor sit amet, consectetur.
					</p>
					<div class="meta-bottom d-flex justify-content-between">
						<p><span class="lnr lnr-heart"></span> 15 Likes</p>
						<p><span class="lnr lnr-bubble"></span> 02 Comments</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 single-blog">
					<div class="thumb">
						<img class="img-fluid w-100" src="images/b3.jpg" alt="">
					</div>
					<p class="date">10 Jan 2018</p>
					<h4>
						<a href="#">How to check steak if it is tender or not</a>
					</h4>
					<p>
						inappropriate behavior ipsum dolor sit amet, consectetur.
					</p>
					<div class="meta-bottom d-flex justify-content-between">
						<p><span class="lnr lnr-heart"></span> 15 Likes</p>
						<p><span class="lnr lnr-bubble"></span> 02 Comments</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 single-blog">
					<div class="thumb">
						<img class="img-fluid w-100" src="images/b4.jpg" alt="">
					</div>
					<p class="date">10 Jan 2018</p>
					<h4>
						<a href="#">Addiction When Gambling Becomes A Problem</a>
					</h4>
					<p>
						inappropriate behavior ipsum dolor sit amet, consectetur.
					</p>
					<div class="meta-bottom d-flex justify-content-between">
						<p><span class="lnr lnr-heart"></span> 15 Likes</p>
						<p><span class="lnr lnr-bubble"></span> 02 Comments</p>
					</div>
				</div>
			</div>
		</div>
	</section> -->


</body>
</html>