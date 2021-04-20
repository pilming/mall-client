<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	<form method = "post" action = "${pageContext.request.contextPath}/InsertClientController">
		<table>
			<thead>
				<tr>
					<th>메일주소</th>
					<th>비밀번호</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<input type = "text" name = "clientMail" placeholder="example@exam.com" required="required">
					</td>
					<td>
						<input type = "password" name = "clientPw" required="required">
					</td>
				</tr>
			</tbody>
		</table>
		<button type = "submit">회원가입</button>
	</form>
	
</body>
</html>