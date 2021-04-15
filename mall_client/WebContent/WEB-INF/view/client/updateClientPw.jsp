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
<%
	//클라이언트 리스트 받아오기
	Client clientOne = (Client)(request.getAttribute("clientOne"));
	//받아오 리스트 디버깅
	System.out.println(clientOne + "<------clientOne.jsp에서 clientOne");
%>
	<form action = "<%=request.getContextPath()%>/UpdateClientPwController" method = "post">
		<input type = "hidden" value = "<%=clientOne.getClientMail()%>" name = "clientMail" >
		<table border = "1">
			<tr>
				<td>현재비밀번호</td>
				<td><input type = "password" placeholder="현재비밀번호를 입력하세요" name = "currentPw"></td>
			</tr>
			
			<tr>
				<td>새로운비밀번호</td>
				<td><input type = "password" placeholder="새로운 비밀번호를 입력하세요" name = "newPw"></td>
			</tr>
		</table>
		<button type = "submit">비밀번호 변경</button>
	</form>
</body>
</html>