<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>ȸ������</h1>
	<form method = "post" action = "<%=request.getContextPath()%>/InsertClientController">
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
	</form>
	
</body>
</html>