<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- mainMenu -->
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<!-- cartList -->
	<table border = "1">
		<thead>
			<tr>
				<th>cart_no</th>
				<th>ebook_no</th>
				<th>ebook_title</th>
				<th>cart_date</th>
				<th>삭제</th>
				<th>주문</th>
			</tr>
		</thead>
		<tbody>	
		<c:forEach var="m" items="${cartList }">
			<tr>
				<td>${m.cartNo}</td>
				<td>${m.ebookNo}</td>
				<td>${m.ebookTitle}</td>
				<td>${m.cartDate.substring(0,11)}</td>
				<!-- DeleteCartController - CartDao.deleteCart() - redirect:/ CartListController -->
				<td><a href = "${pageContext.request.contextPath}/DeleteCartController?ebookNo=${m.ebookNo}"><button type = "button">삭제</button></a></td>
				<!-- InsertOrdersController - insertOrders(), deleteCart(): ISSUE 트랜잭션처리 - redirect:/OrdersListController 주문리스트 -->
				<td><a href = "${pageContext.request.contextPath}/InsertOrdersController?ebookNo=${m.ebookNo}">주문</a></td>
			</tr>
		</c:forEach>
		</tbody>

	</table>
</body>
</html>