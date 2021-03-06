<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!doctype html>
<html class="no-js" lang="">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>GOODEE-BOOK test</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- favicon
		============================================ -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
    <!-- Google Fonts
		============================================ -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- owl.carousel CSS
		============================================ -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/owl.theme.css">
    <link rel="stylesheet" href="css/owl.transitions.css">
    <!-- meanmenu CSS
		============================================ -->
    <link rel="stylesheet" href="css/meanmenu/meanmenu.min.css">
    <!-- animate CSS
		============================================ -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- normalize CSS
		============================================ -->
    <link rel="stylesheet" href="css/normalize.css">
    <!-- mCustomScrollbar CSS
		============================================ -->
    <link rel="stylesheet" href="css/scrollbar/jquery.mCustomScrollbar.min.css">
    <!-- jvectormap CSS
		============================================ -->
    <link rel="stylesheet" href="css/jvectormap/jquery-jvectormap-2.0.3.css">
    <!-- notika icon CSS
		============================================ -->
    <link rel="stylesheet" href="css/notika-custom-icon.css">
    <!-- wave CSS
		============================================ -->
    <link rel="stylesheet" href="css/wave/waves.min.css">
    <!-- main CSS
		============================================ -->
    <link rel="stylesheet" href="css/main.css">
    <!-- style CSS
		============================================ -->
    <link rel="stylesheet" href="style.css">
    <!-- responsive CSS
		============================================ -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- modernizr JS
		============================================ -->
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
    <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
    <!-- Start Header Top Area -->
    <jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
    <!-- End Header Top Area -->
    <!-- Mobile Menu start -->
    <div class="mobile-menu-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <nav id="dropdown">
                            <ul class="mobile-menu-nav">
	                            <li><a href="${pageContext.request.contextPath}/IndexController"><i class="notika-icon notika-checked"></i> ALL</a>
		                        </li>
		                        <c:forEach var = "category" items = "${categoryList}" >
									<li>
										<a href = "${pageContext.request.contextPath}/IndexController?categoryName=${category.categoryName}">
											<i class="notika-icon notika-checked"></i>
											${category.categoryName}
										</a>
									</li>	
								</c:forEach>
                            </ul>
                        </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- Mobile Menu end -->
    <!-- Main Menu area start-->
    <div class="main-menu-area mg-tb-40">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <ul class="nav nav-tabs notika-menu-wrap menu-it-icon-pro">
                        <li><a href="${pageContext.request.contextPath}/IndexController"><i class="notika-icon notika-checked"></i> ALL</a>
                        </li>
                        <c:forEach var = "category" items = "${categoryList}" >
							<li>
								<a href = "${pageContext.request.contextPath}/IndexController?categoryName=${category.categoryName}">
									<i class="notika-icon notika-checked"></i>
									${category.categoryName.toUpperCase()}
								</a>
							</li>	
						</c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- Main Menu area End-->
    <!-- Start Status area -->
    <div>
        <div class="container">
        	<h3 style="text-align: center;">BEST E-BOOK</h3>
        	<br>
            <div class="row">
            	<c:forEach var = "map" items = "${bestOrdersList}">
					<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12" style="text-align: center;">
	                    <div><img src="${pageContext.request.contextPath}/img/default.jpg"></div>
	                    <div>
							<a href="${pageContext.request.contextPath}/EbookOneController?ebookNo=${map.ebookNo}">
								<span>${map.ebookTitle}</span>
							</a>
						</div>
	                    <div>???<span>${map.ebookPrice}</span></div>
                	</div>
				</c:forEach>
            </div>
        </div>
    </div>
    <hr>
    <!-- End Status area-->
    <!-- Start Sale Statistic area-->
    <div>
        <div class="container">
        	<h3 style="text-align: center;">
        		<c:if test="${searchWord == null}">
        			<c:if test="${categoryName == null}">
	        			EBOOK LIST (ALL)
	        		</c:if>
	        		<c:if test="${categoryName != null}">
	        			EBOOK LIST (${categoryName.toUpperCase()})
	        		</c:if>
        		</c:if>
        		<c:if test="${searchWord != null}">
        			EBOOK LIST (SEARCH RESULT : ${searchWord})
        		</c:if>
        	</h3>
        	<br>
            <div class="row">
            	<c:set var = "count" value = "0"/>
            	<c:forEach var = "ebook" items = "${ebookList}">
            		<c:set var = "count" value = "${count + 1}"/>
					<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12" style="text-align: center;">
	                    <div>
	                    	<a href="${pageContext.request.contextPath}/EbookOneController?ebookNo=${ebook.ebookNo}">
	                    		<img src="${pageContext.request.contextPath}/img/default.jpg">
	                    	</a>
	                    </div>
	                    <div>
							<a href="${pageContext.request.contextPath}/EbookOneController?ebookNo=${ebook.ebookNo}">
								<span>${ebook.ebookTitle}</span>
							</a>
						</div>
	                    <div>???<span>${ebook.ebookPrice}</span></div>
	                    <c:if test = "${count % 4 == 0}">
	                    	</div><div class="row">
	                    </c:if>
                	</div>
                	
				</c:forEach>
            </div>
        </div>
    </div>
	<br>
	<div class = "searchBox">
		<form action = "${pageContext.request.contextPath}/IndexController" method = "get">
			<div class="form-group todo-flex" style="width: 300px; margin: 0 auto;">
                <div class="nk-int-st">
                    <input type="text" id="todo-input-text" name="searchWord" class="form-control" placeholder="??? ????????? ??????????????????">
                </div>
                <div class="todo-send">
                    <button class="btn-primary btn-md btn-block btn notika-add-todo" type="submit" id="todo-btn-submit">??????</button>
                </div>
            </div>
		</form>
	</div>
	<br>
	<div class = "paging" style="text-align: center;">
		<ul class="pagination">
		<!-- ????????? ????????? ????????? -->
		<c:forEach var = "i" begin="1" end="10" step="1">
			<!-- ????????? ????????? ?????? (break?????? ??????????????? ??????????????? ???) -->
			<c:if test="${(pageRange * 10)+ i < (lastPage + 1)}">
				<!-- ?????? ??????????????? ????????? (???????????? ????????? ????????? ????????? ?????? ??????????????????.) -->
				<c:if test="${categoryName != null}">
					<!-- ???????????? ?????? -->
					<c:if test="${i == 1}">
						<!-- 1??????????????? ???????????? ??? ????????? -->
						<c:if test="${currentPage == 1}">
							<li class="page-item disabled"><a class="page-link">??????</a></li>
						</c:if>
						<!-- 1???????????? ???????????? ?????? ???????????? ?????? -->
						<c:if test="${currentPage != 1}">
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/IndexController?categoryName=${categoryName }&currentPage=${currentPage -1}">??????</a></li>
						</c:if>	
					</c:if>
					<!-- ????????? ???????????? -->
					<c:if test="${currentPage == (pageRange*10)+i}">
						<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/IndexController?categoryName=${categoryName }&currentPage=${(pageRange*10)+i}">${(pageRange*10)+i}</a></li>
					</c:if>
					<c:if test="${currentPage != (pageRange*10)+i}">
						<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/IndexController?categoryName=${categoryName }&currentPage=${(pageRange*10)+i}">${(pageRange*10)+i}</a></li>
					</c:if>
					
					
					<!-- ????????? ??????????????? ???????????? ?????? ?????? ????????????. -->
					<c:if test="${i == 10}">
						<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/IndexController?categoryName=${categoryName }&currentPage=${currentPage + 1}">??????</a></li>
					</c:if>		
				</c:if>
				<!-- ???????????? ????????? ????????? -->
				<c:if test="${categoryName == null}">
					<!-- ???????????? ???????????? -->
					<c:if test="${searchWord != null}">
						<c:if test="${i == 1}">
							<!-- 1??????????????? ???????????? ??? ????????? -->
							<c:if test="${currentPage == 1}">
								<li class="page-item disabled"><a class="page-link">??????</a></li>
							</c:if>
							<!-- 1???????????? ???????????? ?????? ???????????? ?????? -->
							<c:if test="${currentPage != 1}">
								<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/IndexController?searchWord=${searchWord }&currentPage=${currentPage -1}">??????</a></li>
							</c:if>	
						</c:if>
						<!-- ????????? ???????????? -->
						<c:if test="${currentPage == (pageRange*10)+i}">
							<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/IndexController?searchWord=${searchWord }&currentPage=${(pageRange*10)+i}">${(pageRange*10)+i}</a></li>
						</c:if>
						<c:if test="${currentPage != (pageRange*10)+i}">
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/IndexController?searchWord=${searchWord }&currentPage=${(pageRange*10)+i}">${(pageRange*10)+i}</a></li>
						</c:if>
						
						
						<!-- ????????? ??????????????? ???????????? ?????? ?????? ????????????. -->
						<c:if test="${i == 10}">
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/IndexController?searchWord=${searchWord }&currentPage=${currentPage +1}">??????</a></li>
						</c:if>	
						
					</c:if>
								
					<!-- ???????????? ?????? ?????? -->
					<c:if test="${searchWord == null}">
						<c:if test="${i == 1}">
							<!-- 1??????????????? ???????????? ??? ????????? -->
							<c:if test="${currentPage == 1}">
								<li class="page-item disabled"><a class="page-link">??????</a></li>
							</c:if>
							<!-- 1???????????? ???????????? ?????? ???????????? ?????? -->
							<c:if test="${currentPage != 1}">
								<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/IndexController?currentPage=${currentPage -1}">??????</a></li>
							</c:if>	
						</c:if>
						<!-- ????????? ???????????? -->
						<c:if test="${currentPage == (pageRange*10)+i}">
							<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/IndexController?currentPage=${(pageRange*10)+i}">${(pageRange*10)+i}</a></li>
						</c:if>
						<c:if test="${currentPage != (pageRange*10)+i}">
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/IndexController?currentPage=${(pageRange*10)+i}">${(pageRange*10)+i}</a></li>
						</c:if>				
						
						<!-- ????????? ??????????????? ???????????? ?????? ?????? ????????????. -->
						<c:if test="${i == 10}">
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/IndexController?currentPage=${currentPage +1}">??????</a></li>
						</c:if>	
					</c:if>
				</c:if>
			</c:if>
			<!-- ?????????????????? ?????? ??? -->
		</c:forEach>
		</ul>
	</div>
    <!-- End Realtime sts area-->
    <!-- Start Footer area-->
    <div class="footer-copyright-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="footer-copy-right">
                        <p>Copyright ?? 2018 
. All rights reserved. Template by <a href="https://colorlib.com">Colorlib</a>.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Footer area-->
    <!-- jquery
		============================================ -->
    <script src="js/vendor/jquery-1.12.4.min.js"></script>
    <!-- bootstrap JS
		============================================ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- wow JS
		============================================ -->
    <script src="js/wow.min.js"></script>
    <!-- price-slider JS
		============================================ -->
    <script src="js/jquery-price-slider.js"></script>
    <!-- owl.carousel JS
		============================================ -->
    <script src="js/owl.carousel.min.js"></script>
    <!-- scrollUp JS
		============================================ -->
    <script src="js/jquery.scrollUp.min.js"></script>
    <!-- meanmenu JS
		============================================ -->
    <script src="js/meanmenu/jquery.meanmenu.js"></script>
    <!-- mCustomScrollbar JS
		============================================ -->
    <script src="js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    <!-- jvectormap JS
		============================================ -->
    <script src="js/jvectormap/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="js/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script src="js/jvectormap/jvectormap-active.js"></script>
    <!-- sparkline JS
		============================================ -->
    <script src="js/sparkline/jquery.sparkline.min.js"></script>
    <script src="js/sparkline/sparkline-active.js"></script>
    <!-- sparkline JS
		============================================ -->
    <script src="js/flot/jquery.flot.js"></script>
    <script src="js/flot/jquery.flot.resize.js"></script>
    <script src="js/flot/curvedLines.js"></script>
    <script src="js/flot/flot-active.js"></script>
    <!-- knob JS
		============================================ -->
    <script src="js/knob/jquery.knob.js"></script>
    <script src="js/knob/jquery.appear.js"></script>
    <script src="js/knob/knob-active.js"></script>
    <!--  wave JS
		============================================ -->
    <script src="js/wave/waves.min.js"></script>
    <script src="js/wave/wave-active.js"></script>
    <!--  todo JS
		============================================ -->
    <script src="js/todo/jquery.todo.js"></script>
    <!-- plugins JS
		============================================ -->
    <script src="js/plugins.js"></script>
	<!--  Chat JS
		============================================ -->
    <!-- main JS
		============================================ -->
    <script src="js/main.js"></script>
</body>

</html>