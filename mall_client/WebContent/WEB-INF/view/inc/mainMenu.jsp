<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "mall.client.vo.*" %>
<%
	if(session.getAttribute("loginClient") == null) {
%>
		<!-- 로그아웃일때 -->
		<form action = "<%=request.getContextPath()%>/LoginController" method = "post">
			ID : <input type = "text" name = "clientMail">
			PW : <input type = "password" name = "clientPw">
			<button type = "submit">로그인</button>
		</form>
		<ul>
			<!-- InsertClientController -> /view/insertClient.jsp -->
			<li><a href = "<%=request.getContextPath()%>/InsertClientController">회원가입</a></li>
		</ul>
<%
	}else {
%>
		<!-- 로그인일때 -->
		<div>
			<div>
				<%=((Client)(session.getAttribute("loginClient"))).getClientMail()%>님 반갑습니다.
			</div>
			<ul>
				<li><a href="<%=request.getContextPath()%>/IndexController">홈으로</a></li>
				<li><a href = "<%=request.getContextPath()%>/CartListController">장바구니</a></li>
				<!-- OrdersListController - OrdersDao,selectOrdersListByClient() - OrdersList.jsp -->
				<li><a href = "<%=request.getContextPath()%>/OrdersListController">주문리스트</a></li>
				<!-- ClientOneController -> ClientDao.selectclientOne() -> /view/client/clientOne.jsp-->
				<li><a href = "<%=request.getContextPath()%>/ClientOneController">회원정보</a></li>
				<li><a href = "<%=request.getContextPath()%>/LogoutController">로그아웃</a></li>
			</ul>
		</div>
<%
	}
%>
