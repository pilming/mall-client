<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "mall.client.vo.*" %>
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
<%
	//카트 리스트 받아오기
	List<Map<String, Object>> cartList = (List<Map<String, Object>>)(request.getAttribute("cartList"));
	//받아오 리스트 디버깅
	System.out.println(cartList + "<------cartList.jsp에서 cartList");
%>
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
	<%
		//장바구니리스트 출력
		for(Map<String, Object> map : cartList) {
	%>
			<tr>
				<td><%=map.get("cartNo") %></td>
				<td><%=map.get("ebookNo") %></td>
				<td><%=map.get("ebookTitle") %></td>
				<td><%=map.get("cartDate") %></td>
				<!-- DeleteCartController - CartDao.deleteCart() - redirect:/ CartListController -->
				<td><a href = "<%=request.getContextPath()%>/DeleteCartController?ebookNo=<%=map.get("ebookNo")%>"><button type = "button">삭제</button></a></td>
				<!-- InsertOrdersController - insertOrders(), deleteCart(): ISSUE 트랜잭션처리 - redirect:/OrdersListController 주문리스트 -->
				<td><a href = "<%=request.getContextPath()%>/InsertOrdersController?ebookNo=<%=map.get("ebookNo")%>">주문</a></td>
			</tr>
	<%
		}
	%>
		</tbody>

	</table>
</body>
</html>