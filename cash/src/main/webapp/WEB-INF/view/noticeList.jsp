<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="/resources/cash.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!-- 배경 -->
<div class="container-fluit main-bg">
	<img src="/resources/image/note.jpg" class="bg-img">
</div>
<!-- 메뉴 -->
<div class="container-fluit menu-bar">
	<jsp:include page="/WEB-INF/view/include/menu.jsp"></jsp:include>
</div>
<!-- 본문 -->
<div class="container-fluit main-content">
	<h1><br></h1>
	<!-- 공지사항 -->
	<div>
		<div class="row">
			<div><h2>공지사항</h2></div>
			<div style="margin-left:auto"><a href="/admin/addNotice" class="btn btn-outline-primary">공지사항 작성</a></div>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>no</th>
					<th style="width:60%">제목</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="n" items="${noticeList}">
					<tr>
						<td>${n.noticeId }</td>
						<td><a href="/admin/noticeOne?noticeId=${n.noticeId }">${n.noticeTitle }</a></td>
						<td>${n.noticeDate }</td>
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
					<li class="page-item"><a class="page-link" href="/admin/noticeList?currentPage=1">처음</a></li>
					<li class="page-item"><a class="page-link" href="/admin/noticeList?currentPage=${currentPage-1}">이전</a></li>
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
					<li class="page-item"><a class="page-link" href="/admin/noticeList?currentPage=${currentPage+1}">다음</a></li>
					<li class="page-item"><a class="page-link" href="/admin/noticeList?currentPage=${endPage}">맨끝</a></li>
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