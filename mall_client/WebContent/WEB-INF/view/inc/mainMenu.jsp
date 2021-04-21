<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>

<c:if test="${loginClient == null }">
	<div class="header-top-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <div class = "logo">
                        <a href="${pageContext.request.contextPath}/IndexController"><img src="${pageContext.request.contextPath}/img/logo.png" style="width: 200px; height: 60px; padding-top: 8px;"></a>
                    </div>
                </div>
                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                    <!-- 로그인 메뉴 -->
                    <div class="header-top-menu">
                    	<ul class = "nav navbar-nav notika-top-nav">
                    		<li class = "nav-item">
                    			<a class = "nav-link" href = "${pageContext.request.contextPath}/LoginController">Login</a>
                    		</li>
                    		<li class = "nav-item">
                    			<a class = "nav-link" href = "${pageContext.request.contextPath}/InsertClientController">SignUp</a>
                    		</li>
                    	</ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:if>

<c:if test="${loginClient != null }"> 
	<!-- 로그인일때 -->
		<div class="header-top-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <div class = "logo">
                        <a href="${pageContext.request.contextPath}/IndexController"><img src="${pageContext.request.contextPath}/img/logo.png" style="width: 200px; height: 60px; padding-top: 8px;"></a>
                    </div>
                </div>
                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                    <!-- 로그인 메뉴 -->
                    <div class="header-top-menu">
                    	<ul class = "nav navbar-nav notika-top-nav">
                    		<li class = "nav-item">
                    			<div style="margin: 20px 0px 20px 30px;">
                    				${loginClient.clientMail}님 반갑습니다.
                    			</div>	
                    		</li>
                    		<li class = "nav-item">
                    			<a class = "nav-link" href = "${pageContext.request.contextPath}/LogoutController">Logout</a>
                    		</li>
                    		<li class = "nav-item">
                    			<a class = "nav-link" href = "${pageContext.request.contextPath}/ClientOneController">MyPage</a>
                    		</li>
                    		<li class = "nav-item">
                    			<a class = "nav-link" href = "${pageContext.request.contextPath}/OrdersListController">Order</a>
                    		</li>
                    		<li class = "nav-item">
                    			<a class = "nav-link" href = "${pageContext.request.contextPath}/CartListController">Cart</a>
                    		</li>
                    		<li class = "nav-item">
                    			<a class = "nav-link" href = "${pageContext.request.contextPath}/EbookCalendarController">ebook달력</a>
                    		</li>
                    		
                    	</ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:if>