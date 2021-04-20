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
	<!-- cartList -->
	<table border = "1">
		<thead>
			<tr>
				<td>아이디</td>
				<td>가입일자</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${clientOne.clientMail}</td>
				<td>${clientOne.clientDate}</td>
			</tr>
		</tbody>
	</table>
	<!-- UpdateClientPwController.doGet 포워딩 - updateClientPw.jsp-->
	<!-- UpdateClientPwController.doPost - ClientDao.updateCLientPw() - session.invalidate() - redirect:/IndexController -->
	<a href= "${pageContext.request.contextPath}/UpdateClientPwController"><button type = "button">비밀번호 수정</button></a>
	<!-- DeleteClientController - CartDao.deleteCartByClient(mail) ,ClientDao.deleteClient() - session.invalidate() - redirect:/IndexController -->
	<a href= "${pageContext.request.contextPath}/DeleteClientController"><button type = "button">회원탈퇴</button></a>
	

</body>
</html>