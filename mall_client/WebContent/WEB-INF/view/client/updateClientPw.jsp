<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- mainMenu -->
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<form action = "${pageContext.request.contextPath}/UpdateClientPwController" method = "post">
		<input type = "hidden" value = "${clientOne.clientMail}" name = "clientMail" >
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