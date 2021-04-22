<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html>
<html>
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<h1>Ebook calendar</h1>
	<!-- n행 7열 -->
	<div>
		<a href ="${pageContext.request.contextPath}/EbookCalendarController?currentYear=${preYear}&currentMonth=${preMonth}">이전달</a>
		<span>${currentYear}년</span>
		<span>${currentMonth}월</span>
		<a href ="${pageContext.request.contextPath}/EbookCalendarController?currentYear=${nextYear}&currentMonth=${nextMonth}">다음달</a>
	</div>
	<table border="1">
		<thead>
			<tr>
				<th>일</th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th>토</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var = "i" begin="1" end="${endDay +(firstDayOfWeek -1)}" step ="1">
				<c:if test="${i - (firstDayOfWeek -1) <= 0}">
					<td>&nbsp;</td>
				</c:if>
				<c:if test="${i - (firstDayOfWeek -1) > 0}">
					<td>
						<div>${i - (firstDayOfWeek -1)}</div>
						<c:forEach var="map" items="${ebookListByMonth}">
							<c:if test="${(i-(firstDayOfWeek -1)) == map.d}">
								<div>
									<a href = "${pageContext.request.contextPath}/EbookOneController?ebookNo=${map.ebookNo}">
									<c:if test="${map.ebookTitle.length() > 10}">
                                    	${map.ebookTitle.substring(0, 10)}...
                                 	</c:if>
                                 	<c:if test="${map.ebookTitle.length() <= 10}">
                                    	${map.ebookTitle}
                                 	</c:if>
								</div>
							</c:if>
						</c:forEach>
					</td>
					
				</c:if>
				
				<c:if test="${i % 7 ==0 }">
					</tr><tr>
				</c:if>			
			</c:forEach>
			<!-- 반복문 후 빈칸이 있을경우 채우기 -->
			<c:if test="${(endDay +(firstDayOfWeek -1)) % 7 != 0}">
				<c:forEach begin="1" end="${7-((endDay +(firstDayOfWeek -1)) % 7)}" step="1">
					<td></td>
				</c:forEach>
			</c:if>
			
		</tbody>
		
	</table>
</body>
</html>