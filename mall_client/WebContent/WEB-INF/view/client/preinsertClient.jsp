<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>ȸ������</h1>
	<form method = "post" action = "${pageContext.request.contextPath}/InsertClientController">
		<table>
			<thead>
				<tr>
					<th>�����ּ�</th>
					<th>��й�ȣ</th>
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
		<button type = "submit">ȸ������</button>
	</form>
	
</body>
</html>