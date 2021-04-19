<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "mall.client.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<!-- 메뉴1 -->
	<!-- 메뉴2 -->
	<h1>index</h1>
	<%
		//controller에서 값 받아오기
		String searchWord = null;
		if(request.getAttribute("searchWord") != null) {
			searchWord = (String)(request.getAttribute("searchWord"));
		}
		List<Ebook> ebookList = (List<Ebook>)(request.getAttribute("ebookList")); //ebook리스트
		int pageRange = (Integer)(request.getAttribute("pageRange"));
		int lastPage = (Integer)(request.getAttribute("lastPage"));
		int rowPerPage = (Integer)(request.getAttribute("rowPerPage"));
		int currentPage = (Integer)(request.getAttribute("currentPage"));
		List<Category> categoryList = (List<Category>)(request.getAttribute("categoryList")); //카테고리 이름들 리스트(가중치도 들어있음)
		String categoryName = null;
		if(request.getAttribute("categoryName") != null) {
			categoryName =(String)(request.getAttribute("categoryName"));
		}
		List<Map<String, Object>> bestOdersList = (List<Map<String, Object>>)(request.getAttribute("bestOdersList"));
		
	%>
		<ul>
			<li><a href = "<%=request.getContextPath()%>/IndexController">전체보기</a></li>
	<%
		for(Category category : categoryList) {
	%>
			<li><a href = "<%=request.getContextPath()%>/IndexController?categoryName=<%=category.getCategoryName()%>"><%=category.getCategoryName()%></a></li>	
	<%
		}
	%>
		</ul>
	<!-- best ebook 상품 5개 출력 -->
	<h3>BEST Ebook</h3>
	<table border="1">
		<tr>
			<%
				for(Map map : bestOdersList) {
			%>
					<td>
						<div><img src="<%=request.getContextPath()%>/img/default.jpg"></div>
						
						<div>
							<a href="<%=request.getContextPath()%>/EbookOneController?ebookNo=<%=map.get("ebookNo")%>">
								<%=map.get("ebookTitle")%>
							</a>
						</div>
						<div>￦<%=map.get("ebookPrice")%></div>
					</td>
			<%				
				}
			%>
		</tr>
	
	</table>
	
	<!-- ebook 상품 출력 -->
	<h3>Ebook List</h3>
	<table border="1">
		<tr>
		<%
			int count = 0;
			for(Ebook ebook : ebookList) {
				count += 1;
		%>		
				<td>
					<div><img src="<%=request.getContextPath()%>/img/default.jpg"></div>
					
					<div>
						<a href="<%=request.getContextPath()%>/EbookOneController?ebookNo=<%=ebook.getEbookNo()%>">
							<%=ebook.getEbookTitle()%>
						</a>
					</div>
					<div>￦<%=ebook.getEbookPrice()%></div>
				</td>
		<%
				if(count%5==0) {
		%>
					</tr><tr>
		<%			
				}
			}
		%>
		</tr>
	</table>
	<br>
	<div class = "searchBox">
		<form action = "<%=request.getContextPath()%>/IndexController" method = "get">
			<input type = text name="searchWord" placeholder="책 제목을 입력해주세요"> <button type = submit> 검색</button>
		</form>
	</div>
	<br>
	<div class = "paging">
		
		<%
			for (int i = 1; i <= 10; i += 1) {
				if ((pageRange * 10) + i == lastPage + 1) {
					break;
				}
				
				//특정 카테고리가 있을때 (카테고리 정렬과 검색어 기능 같이 사용할수없게 함.)
				if(categoryName != null) {
					//이전 버튼 생성
					if(i == 1) {
						//첫페이지이면 이전버튼 비활성화
						if(currentPage == 1) {
			%>
							<button disabled="disabled">이전</button>
			<%
						} else { //첫페이지가 아니라면 이전버튼 활성화
			%>
							<a href="<%=request.getContextPath()%>/IndexController?categoryName=<%=categoryName%>&currentPage=<%=currentPage - 1%>"><button>이전</button></a>	
			<%				
						}
					}
			%>
					<!-- 페이징 숫자표현 -->
					<a href="<%=request.getContextPath()%>/IndexController?categoryName=<%=categoryName%>&currentPage=<%=(pageRange*10)+i%>"><button><%=(pageRange*10)+i%></button></a>
			<%
					//마지막페이지에선 여기까지 코드가 진행이 안되기때문에 다음버튼 생성 안됨.
					if(i == 10) {
			%>
						<a href="<%=request.getContextPath()%>/IndexController?categoryName=<%=categoryName%>&currentPage=<%=currentPage + 1%>"><button>다음</button></a>			
			<%				
					}						
				} else { //카테고리가 정해지지않았을때 (모든 책을 보여줄때)
					//검색어가 있을때
					if(searchWord != null) {
						if(i == 1) {
							//첫페이지이면 이전버튼 비활성화
							if(currentPage == 1) {
				%>
								<button disabled="disabled">이전</button>
				<%
							} else { //첫페이지가 아니라면 이전버튼 활성화
				%>
								<a href="<%=request.getContextPath()%>/IndexController?searchWord=<%=searchWord%>&currentPage=<%=currentPage - 1%>"><button>이전</button></a>	
				<%				
							}
						}
				%>
						<!-- 페이징 숫자표현 -->
						<a href="<%=request.getContextPath()%>/IndexController?searchWord=<%=searchWord%>&currentPage=<%=(pageRange*10)+i%>"><button><%=(pageRange*10)+i%></button></a>
				<%
						//마지막페이지에선 여기까지 코드가 진행이 안되기때문에 다음버튼 생성 안됨.
						if(i == 10) {
				%>
							<a href="<%=request.getContextPath()%>/IndexController?searchWord=<%=searchWord%>&currentPage=<%=currentPage + 1%>"><button>다음</button></a>			
				<%				
						}
					}else {//검색어가 없을때
						//이전 버튼 생성
						if(i == 1) {
							//첫페이지이면 이전버튼 비활성화
							if(currentPage == 1) {
				%>
								<button disabled="disabled">이전</button>
				<%
							} else { //첫페이지가 아니라면 이전버튼 활성화
				%>
								<a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=currentPage - 1%>"><button>이전</button></a>	
				<%				
							}
						}
				%>
						<!-- 페이징 숫자표현 -->
						<a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=(pageRange*10)+i%>"><button><%=(pageRange*10)+i%></button></a>
				<%
						//마지막페이지에선 여기까지 코드가 진행이 안되기때문에 다음버튼 생성 안됨.
						if(i == 10) {
				%>
							<a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=currentPage + 1%>"><button>다음</button></a>			
				<%				
						}	
					}
				}	
			}
		%>
	</div>
	
</body>
</html> 