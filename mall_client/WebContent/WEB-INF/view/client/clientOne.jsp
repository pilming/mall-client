<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	Client clientOne = (Client)(request.getAttribute("clientOne"));
	//받아오 리스트 디버깅
	System.out.println(clientOne + "<------clientOne.jsp에서 clientOne");
%>
	<form action = "<%=request.getContextPath()%>/ClientOneController" method = "post">
		<input type = "hidden" value = "<%=clientOne.getClientMail()%>" name = "clientMail" >
		<table border = "1">
			<thead>
				<tr>
					<td>아이디</td>
					<td>현재비밀번호</td>
					<td>새로운비밀번호</td>
					<td>가입일자</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><%=clientOne.getClientMail() %></td>
					<td><input type = "password" placeholder="현재비밀번호를 입력하세요" name = "currentPw"></td>
					<td><input type = "password" placeholder="새로운 비밀번호를 입력하세요" name = "newPw"></td>
					<td><%=clientOne.getClientDate() %></td>
				</tr>
			</tbody>
		</table>
		<button type = "submit">비밀번호 변경</button>
	</form>
	

</body>
</html>