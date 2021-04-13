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
			</tr>
	<%
		}
	%>
		</tbody>

	</table>
</body>
</html>