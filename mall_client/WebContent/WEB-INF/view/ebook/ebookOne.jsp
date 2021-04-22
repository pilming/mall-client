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
	<!-- mainMenu -->
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>


	<table border = "1">
		<tr>
			<td>ebookNo</td>
			<td>${ebook.ebookNo}</td>
		</tr>
		<tr>
			<td>ebookISBN</td>
			<td>${ebook.ebookISBN}</td>
		</tr>
		<tr>
			<td>categoryName</td>
			<td>${ebook.categoryName}</td>
		</tr>
		
		<tr>
			<td>ebookTitle</td>
			<td>${ebook.ebookTitle}</td>
		</tr>
		
		<tr>
			<td>ebookAuthor</td>
			<td>${ebook.ebookAuthor}</td>
		</tr>
		<tr>
			<td>ebookCompany</td>
			<td>${ebook.ebookCompany}</td>
		</tr>
		<tr>
			<td>ebookPrice</td>
			<td>${ebook.ebookPrice}</td>
		</tr>
		<tr>
			<td>ebookSummary</td>
			<td>${ebook.ebookSummary}</td>
		</tr>
		<tr>
			<td>ebookImg</td>
			<td><img src="${pageContext.request.contextPath}/img/default.jpg"></td>
		</tr>
		<tr>
			<td>ebookDate</td>
			<td>${ebook.ebookDate}</td>
		</tr>
		<tr>
			<td>ebookState</td>
			<td>${ebook.ebookState}</td>
		</tr>


	</table>
	
	<!-- InsertCartController?ebookNo - CartDao.insertCart()- redirect: CartListController  -->
	<a href = "${pageContext.request.contextPath}/InsertCartController?ebookNo=${ebook.ebookNo}">
		<c:if test="${loginClient == null || ebook.ebookState.equals('품절') || ebook.ebookState.equals('절판') || ebook.ebookState.equals('구편절판') }">
			<button type = button disabled="disabled">장바구니추가</button>
		</c:if>
		<c:if test="${loginClient != null && ebook.ebookState.equals('판매중')}">
			<button type = button>장바구니추가</button>
		</c:if>
	</a>
</body>
</html>