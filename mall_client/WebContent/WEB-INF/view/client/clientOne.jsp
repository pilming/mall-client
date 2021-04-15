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
	//클라이언트 리스트 받아오기
	Client clientOne = (Client)(request.getAttribute("clientOne"));
	//받아오 리스트 디버깅
	System.out.println(clientOne + "<------clientOne.jsp에서 clientOne");
%>
	<table border = "1">
		<thead>
			<tr>
				<td>아이디</td>
				<td>가입일자</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><%=clientOne.getClientMail() %></td>
				<td><%=clientOne.getClientDate() %></td>
			</tr>
		</tbody>
	</table>
	<!-- UpdateClientPwController.doGet 포워딩 - updateClientPw.jsp-->
	<!-- UpdateClientPwController.doPost - ClientDao.updateCLientPw() - session.invalidate() - redirect:/IndexController -->
	<a href= "<%=request.getContextPath()%>/UpdateClientPwController"><button type = "button">비밀번호 수정</button></a>
	<!-- DeleteClientController - CartDao.deleteCartByClient(mail) ,ClientDao.deleteClient() - session.invalidate() - redirect:/IndexController -->
	<a href= "<%=request.getContextPath()%>/DeleteClientController"><button type = "button">회원탈퇴</button></a>
	

</body>
</html>