<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cashbookList</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/resources/cash.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!-- 배경 -->
<div class="container-fluit main-bg">
	<img src="${pageContext.request.contextPath}/resources/image/note.jpg" class="bg-img">
</div>
<!-- 메뉴 -->
<div class="container-fluit menu-bar">
	<jsp:include page="/WEB-INF/view/include/menu.jsp"></jsp:include>
</div>
<!-- 본문 -->
<div class="container-fluit main-content">
	<br>
	<div>
		<div class="pastel-orange-300"><h2>전체 리스트</h2></div>
	</div>
	<a href="${pageContext.request.contextPath}/admin/cashbookListExcel">[전체 리스트를 엑셀 파일로 다운로드]</a>
	<div>
		<table class="table">
			<thead>
				<tr>
					<th>id</th>
					<th>kind</th>
					<th>name</th>
					<th>price</th>
					<th>content</th>
					<th>cashbook_date</th>
					<th>create_date</th>
					<th>update_date</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="c" items="${cashbookList }">
					<tr>
						<td>${c.cashbookId }</td>
						<td>${c.cashbookKind }</td>
						<td>${c.categoryName }</td>
						<td>${c.cashbookPrice }</td>
						<td>${c.cashbookContent }</td>
						<td>${c.cashbookDate }</td>
						<td>${c.createDate }</td>
						<td>${c.updateDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<!-- 페이징 -->	
	<div style="margin-left:35%"> 
		<ul class="pagination">
			<!-- when : 현재 페이지가 1보다 클시 -->
			<!-- other : 현재 페이지가 1일 시 -->
			<c:choose>
				<c:when test="${currentPage > '1'}">
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/1">처음</a></li>
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/${currentPage-1}">이전</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled"><a class="page-link">처음</a></li>		
					<li class="page-item disabled"><a class="page-link">이전</a></li>		
				</c:otherwise>
			</c:choose>
			<!-- 현재 페이지 표시 -->
			<li class="page-item"><a class="page-link">${currentPage}</a></li>
			<!-- when : 현재 페이지가 마지막 페이지 보다 작을 시 -->
			<!-- other : 현재 페이지가 마지막 페이지 일 시 -->
			<c:choose>
				<c:when test="${currentPage < endPage}">
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/${currentPage+1}">다음</a></li>
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/${endPage}">맨끝</a></li>
				</c:when>
				<c:otherwise>		
					<li class="page-item disabled"><a class="page-link">다음</a></li>		
					<li class="page-item disabled"><a class="page-link">맨끝</a></li>		
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</div>
</body>
</html>