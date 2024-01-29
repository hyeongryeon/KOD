<%@page import="java.util.ArrayList"%>
<%@page import="model.dto.WishListDTO"%>
<%@page import="model.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="kim" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<c:if test="${fn:length(datas) >= 2}">
		[ 삭 제 ]
	</c:if>

		<title>Electro - HTML Ecommerce Template</title>

 		<!-- Google font -->
 		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

 		<!-- Bootstrap -->
 		<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

 		<!-- Slick -->
 		<link type="text/css" rel="stylesheet" href="css/slick.css"/>
 		<link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

 		<!-- nouislider -->
 		<link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

 		<!-- Font Awesome Icon -->
 		<link rel="stylesheet" href="css/font-awesome.min.css">

 		<!-- Custom stlylesheet -->
 		<link type="text/css" rel="stylesheet" href="css/style.css"/>

		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

    </head>
	<body>
		<jsp:include page="util/header.jsp"></jsp:include>
		<jsp:include page="util/navigation.jsp"></jsp:include>
		
		
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script>
$(document).ready(function(){
	  $(".add-to-wishlist2").on("click", function(e){
	    e.preventDefault(); // 기본 클릭 이벤트를 중단하여 링크가 이동하는 것을 방지

	    console.log("위시리스트 버튼 클릭됨");
	    
	    var productID = $(this).find(".productID").text();
	    var heartIcon = $(this).find("#heartIcon");
	    console.log("productID", productID);
	    
	    $.ajax({
	      type: "POST",
	      url: "IsWishedAction",
	      data: {"productID": productID},
	      success: function(data){
	        console.log(data);
	        heartIcon.toggleClass('fa-heart-o fa-heart');
	        
	        var updatedWishListCnt = parseInt(data);
	        $(".wishListCnt").text(updatedWishListCnt);
	        console.log("updatedWishListCnt >> " + updatedWishListCnt);
	        
		    $.ajax({
			      type: "POST",
			      url: "wishTotalCntAction",
			      data: {"productID": productID},
			      success: function(data){
			        console.log(data);

			        var updatedwishTotalCnt = parseInt(data);
			        $(".wishTotalCnt").text(updatedwishTotalCnt);
			        console.log("updatedwishTotalCnt >> " + updatedwishTotalCnt);

			      },
			      error: function(error){
			        console.log("에러: " + error);
			      } 
			    });
	        
	      },
	      error: function(error){
	        console.log("에러: " + error);
	      } 
	    });
	    

	  });
	});

</script>

<script>
$(document).ready(function(){
	  $(".add-to-wishlist").on("click", function(e){
	    e.preventDefault(); // 기본 클릭 이벤트를 중단하여 링크가 이동하는 것을 방지

	    console.log("위시리스트 버튼 클릭됨");
	    
	    var productID = $(this).find(".productID").text();
	    var heartIcon = $(this).find("#heartIcon");
	    console.log("productID", productID);
	    
	    $.ajax({
	      type: "POST",
	      url: "IsWishedAction",
	      data: {"productID": productID},
	      success: function(data){
	        console.log(data);
	        heartIcon.toggleClass('fa-heart-o fa-heart');
	        
	        var updatedWishListCnt = parseInt(data);
	        $(".wishListCnt").text(updatedWishListCnt);
	        console.log("updatedWishListCnt >> " + updatedWishListCnt);
	        
	      },
	      error: function(error){
	        console.log("에러: " + error);
	      } 
	    });
	  });
	});

</script>
	<%--
		WishListDTO productWishDetailData = (WishListDTO)request.getAttribute("productWishDetailData");
	--%>
		<!-- BREADCRUMB -->
		<div id="breadcrumb" class="section">
			<!-- container -->
			<div class="container">
				<kim:menu apple="10" />
			</div>
			<!-- /container -->
		</div>
		<!-- /BREADCRUMB -->

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- Product main img -->
					<div class="col-md-5 col-md-push-2">
						<div id="product-main-img">
							<div class="product-preview">
								<img src="${productWishDetailData.productImg}" alt="">
							</div>

							<!-- <div class="product-preview">
								<img src="./img/product03.png" alt="">
							</div>

							<div class="product-preview">
								<img src="./img/product06.png" alt="">
							</div>

							<div class="product-preview">
								<img src="./img/product08.png" alt="">
							</div> -->
						</div>
					</div>
					<!-- /Product main img -->

					<!-- Product thumb imgs -->
					<div class="col-md-2  col-md-pull-5">
						<div id="product-imgs">
							<div class="product-preview">
								<img src="${productWishDetailData.getProductImg()}" alt="">
							</div>

							<!-- <div class="product-preview">
								<img src="./img/product03.png" alt="">
							</div>

							<div class="product-preview">
								<img src="./img/product06.png" alt="">
							</div>

							<div class="product-preview">
								<img src="./img/product08.png" alt="">
							</div> -->
						</div>
					</div>
					<!-- /Product thumb imgs -->

					<!-- Product details -->
					<div class="col-md-5">
						<div class="product-details">
							<h2 class="product-name">${productWishDetailData.productName}</h2>
							<div>
								<div class="product-rating">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star-o"></i>
								</div>
								<a class="review-link" href="#">10 Review(s) | Add your review</a>
							</div>
							<div>
								<h3 class="product-price">${productWishDetailData.productPrice}<del class="product-old-price"></del></h3>
								<span class="product-available">In Stock</span>
							</div>
							<p>${productWishDetailData.productInfo}</p>

							<!-- <div class="product-options">
								<label>
									Size
									<select class="input-select">
										<option value="0">X</option>
									</select>
								</label>
								<label>
									Color
									<select class="input-select">
										<option value="0">Red</option>
									</select>
								</label>
							</div> -->
							<form method="POST" action="cartInsert.do">
							<div class="add-to-cart">
								
								<div class="qty-label">
									수량
									<div class="input-number">
									<input type="hidden" name ="productID" value="${productWishDetailData.productID}">
									<input type="hidden" name="productName" value="${productWishDetailData.productName}">
									<input type="hidden" name="productPrice" value="${productWishDetailData.productPrice}">
										<input name="purchaseCnt" type="number">
										<span class="qty-up">+</span>
										<span class="qty-down">-</span>
									</div>
								</div>
								<button class="add-to-cart-btn" type="submit"><i class="fa fa-shopping-cart"></i>장바구니 담기</button>
								<button class="buy-now add-to-cart-btn" type="submit"><i class="fa fa-shopping-cart"></i>구매하기</button>
							</div>
							</form>	
							<ul class="product-btns">
								<li>
								  <a href="#" class="add-to-wishlist2">
								  <c:if test="${productWishDetailData.isWished == 1}">
								    <i class="fa fa-heart" id="heartIcon"></i> add to wishList
								  </c:if>
								  <c:if test="${productWishDetailData.isWished != 1}">
								    <i class="fa fa-heart-o" id="heartIcon"></i> add to wishList
								  </c:if>
								    <span class="productID" style="display:none;">${productWishDetailData.productID}</span>
								  </a>
								</li>
								<%
									int wishTotalCnt = (int)request.getAttribute("wishTotalCnt");
								    Integer wishTotalCntObj = (Integer) request.getAttribute("wishTotalCnt");
								    wishTotalCnt = (wishTotalCntObj != null) ? wishTotalCntObj : wishTotalCnt;
								
								    String updatedWishTotalCntStr = (String) request.getAttribute("updatedWishListCnt");
								    int updatedWishTotalCnt = wishTotalCnt; // 기본값 설정
								
								    if (updatedWishTotalCntStr != null && !updatedWishTotalCntStr.isEmpty()) {
								        try {
								            updatedWishTotalCnt = Integer.parseInt(updatedWishTotalCntStr);
								        } catch (NumberFormatException e) {
								            e.printStackTrace(); // 또는 다른 로깅 방식을 사용할 수 있습니다.
								        }
								    }
								%>
								<Strong><span class="wishTotalCnt" style="padding-left: 10px"><%=wishTotalCnt %></span></Strong>
							</ul>

							<ul class="product-links">
								<li>Category:</li>
								<li><a href="#">${productWishDetailData.productCategory}</a></li>
							</ul>

							<ul class="product-links">
								<li>Share:</li>
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
								<li><a href="#"><i class="fa fa-envelope"></i></a></li>
							</ul>

						</div>
					</div>
					<!-- /Product details -->

					<!-- Product tab -->
					<div class="col-md-12">
						<div id="product-tab">
							<!-- product tab nav -->
							<ul class="tab-nav">
								<li class="active"><a data-toggle="tab" href="#tab1">Description</a></li>
								<li><a data-toggle="tab" href="#tab2">Details</a></li>
								<li><a data-toggle="tab" href="#tab3">Reviews (3)</a></li>
							</ul>
							<!-- /product tab nav -->

							<!-- product tab content -->
							<div class="tab-content">
								<!-- tab1  -->
								<div id="tab1" class="tab-pane fade in active">
									<div class="row">
										<div class="col-md-12">
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
										</div>
									</div>
								</div>
								<!-- /tab1  -->

								<!-- tab2  -->
								<div id="tab2" class="tab-pane fade in">
									<div class="row">
										<div class="col-md-12">
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
										</div>
									</div>
								</div>
								<!-- /tab2  -->

								<!-- tab3  -->
								<div id="tab3" class="tab-pane fade in">
									<div class="row">
										<!-- Rating -->
										<div class="col-md-3">
											<div id="rating">
												<div class="rating-avg">
													<span>4.5</span>
													<div class="rating-stars">
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star-o"></i>
													</div>
												</div>
												<ul class="rating">
													<li>
														<div class="rating-stars">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
														</div>
														<div class="rating-progress">
															<div style="width: 80%;"></div>
														</div>
														<span class="sum">3</span>
													</li>
													<li>
														<div class="rating-stars">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star-o"></i>
														</div>
														<div class="rating-progress">
															<div style="width: 60%;"></div>
														</div>
														<span class="sum">2</span>
													</li>
													<li>
														<div class="rating-stars">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star-o"></i>
															<i class="fa fa-star-o"></i>
														</div>
														<div class="rating-progress">
															<div></div>
														</div>
														<span class="sum">0</span>
													</li>
													<li>
														<div class="rating-stars">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star-o"></i>
															<i class="fa fa-star-o"></i>
															<i class="fa fa-star-o"></i>
														</div>
														<div class="rating-progress">
															<div></div>
														</div>
														<span class="sum">0</span>
													</li>
													<li>
														<div class="rating-stars">
															<i class="fa fa-star"></i>
															<i class="fa fa-star-o"></i>
															<i class="fa fa-star-o"></i>
															<i class="fa fa-star-o"></i>
															<i class="fa fa-star-o"></i>
														</div>
														<div class="rating-progress">
															<div></div>
														</div>
														<span class="sum">0</span>
													</li>
												</ul>
											</div>
										</div>
										<!-- /Rating -->

										<!-- Reviews -->
										<div class="col-md-6">
											<div id="reviews">
												<ul class="reviews">
													<li>
														<div class="review-heading">
															<h5 class="name">John</h5>
															<p class="date">27 DEC 2018, 8:0 PM</p>
															<div class="review-rating">
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star-o empty"></i>
															</div>
														</div>
														<div class="review-body">
															<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
														</div>
													</li>
													<li>
														<div class="review-heading">
															<h5 class="name">John</h5>
															<p class="date">27 DEC 2018, 8:0 PM</p>
															<div class="review-rating">
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star-o empty"></i>
															</div>
														</div>
														<div class="review-body">
															<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
														</div>
													</li>
													<li>
														<div class="review-heading">
															<h5 class="name">John</h5>
															<p class="date">27 DEC 2018, 8:0 PM</p>
															<div class="review-rating">
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star-o empty"></i>
															</div>
														</div>
														<div class="review-body">
															<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
														</div>
													</li>
												</ul>
												<ul class="reviews-pagination">
													<li class="active">1</li>
													<li><a href="#">2</a></li>
													<li><a href="#">3</a></li>
													<li><a href="#">4</a></li>
													<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
												</ul>
											</div>
										</div>
										<!-- /Reviews -->

										<!-- Review Form -->
										<div class="col-md-3">
											<div id="review-form">
												<form class="review-form">
													<input class="input" type="text" placeholder="Your Name">
													<input class="input" type="email" placeholder="Your Email">
													<textarea class="input" placeholder="Your Review"></textarea>
													<div class="input-rating">
														<span>Your Rating: </span>
														<div class="stars">
															<input id="star5" name="rating" value="5" type="radio"><label for="star5"></label>
															<input id="star4" name="rating" value="4" type="radio"><label for="star4"></label>
															<input id="star3" name="rating" value="3" type="radio"><label for="star3"></label>
															<input id="star2" name="rating" value="2" type="radio"><label for="star2"></label>
															<input id="star1" name="rating" value="1" type="radio"><label for="star1"></label>
														</div>
													</div>
													<button class="primary-btn">Submit</button>
												</form>
											</div>
										</div>
										<!-- /Review Form -->
									</div>
								</div>
								<!-- /tab3  -->
							</div>
							<!-- /product tab content  -->
						</div>
					</div>
					<!-- /product tab -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

		<!-- Section -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">


					<div class="col-md-12">
						<div class="section-title text-center">
							<h3 class="title">(로그인)한회원 연령에 따라 상품추천 && (비로그인)카테고리 관련 추천상품</h3>
						</div>
					</div>

					<%--ArrayList<WishListDTO> productWishDatas = (ArrayList<WishListDTO>)request.getAttribute("productWishDatas"); --%>
					
					<!-- Products tab & slick -->
					<div class="col-md-12">
						<div class="row">
							<div class="products-tabs">
								<!-- tab -->
								<div id="tab1" class="tab-pane active">
									<div class="products-slick" data-nav="#slick-nav-1">
										<c:forEach var="data" items="${productWishDatas}">						
										<!-- product -->
												<div class="col-md-4 col-xs-6" style="margin-top: 30px;">
													<div class="product">
														<div class="product-body">
															<div class="product-label" style="display: flex; justify-content: space-between; align-items: center;">
																<span class="new" style="color: #D10024;"><strong>NEW</strong></span>
																<div class="product-btns">
																	<button class="add-to-wishlist">
																		<div class="productID" hidden>${data.productID}</div>
																		<c:if test="${data.isWished == 1}">
																			<i class="fa fa-heart" id="heartIcon"></i><span class="tooltipp">위시리스트에 추가</span>
																		</c:if>
																		<c:if test="${data.isWished != 1}">
																			<i class="fa fa-heart-o" id="heartIcon"></i><span class="tooltipp">위시리스트에 추가</span>
																		</c:if>
																	</button>
																</div>
															</div>
														</div>
														<div class="product-img">
															<img src="${data.productCategory}" alt="">
														</div>
														<div class="product-body">
															<p class="product-category">${data.productImg}</p>
															<h3 class="product-name" style="height: 31px;">
																	<a href="productDetail.do?productID=${data.productID}">${data.productName}</a>
															</h3>
															<h4 class="product-price">${data.productPrice}<del class="product-old-price"></del></h4>
															<div class="product-rating">
																<%--평점 들어가는 라인 --%>
															</div>
														</div>
														<div class="add-to-cart">
															<button class="add-to-cart-btn">
																<i class="fa fa-shopping-cart"></i> add to cart
															</button>
														</div>
													</div>
												</div>
										</c:forEach>
										<!-- /product -->

										
									</div>
									<div id="slick-nav-1" class="products-slick-nav"></div>
								</div>
								<!-- /tab -->
							</div>
						</div>
					</div>
					<!-- Products tab & slick -->

				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /Section -->
		

		<!-- NEWSLETTER -->
		<div id="newsletter" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<div class="newsletter">
							<p>Sign Up for the <strong>NEWSLETTER</strong></p>
							<form>
								<input class="input" type="email" placeholder="Enter Your Email">
								<button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
							</form>
							<ul class="newsletter-follow">
								<li>
									<a href="#"><i class="fa fa-facebook"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-twitter"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-instagram"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-pinterest"></i></a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /NEWSLETTER -->

		<jsp:include page="util/footer.jsp"></jsp:include>

		<!-- jQuery Plugins -->
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/slick.min.js"></script>
		<script src="js/nouislider.min.js"></script>
		<script src="js/jquery.zoom.min.js"></script>
		<script src="js/main.js"></script>

	</body>
</html>
