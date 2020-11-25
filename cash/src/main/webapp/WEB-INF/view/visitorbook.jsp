<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>visitorbook</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/resources/cash.css" rel="stylesheet" type="text/css" />
<script>
	$(document).ready(function(){
		$('#addVisitorbookBtn').click(function(){
			if($('#visitorbookWriter').val().length < 1){
				alert('작성자를 입력해 주세요.');
				return
			}else if($('#visitorbookContent').val().length < 1){
				alert('내용을 입력해 주세요.');
				return
			}
			$('#addVisitorbookForm').submit();
		})
	})
</script>
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
	<!-- 방명록 -->
	<div>
		<div class="row">
			<div>
				<div class="pastel-sea-300"><h2>방명록</h2></div>
			</div>
		</div>
		<!-- 방명록 작성 -->
		<form id="addVisitorbookForm" action="${pageContext.request.contextPath}/admin/addVisitorbook" method="post">
			<table class="table table-borderless" style="border:1px solid #EAEAEA;">
				<tr>
					<th>작성자 : </th>
					<td><input type="text" class="form-control" name="visitorbookWriter" id="visitorbookWriter"></td>
					<td rowspan="2"><button type="button" id="addVisitorbookBtn" class="btn btn-outline-dark">작성</button></td>
				</tr>
				<tr>
					<th>내용 : </th>
					<td><textarea class="form-control" name="visitorbookContent" id="visitorbookContent"></textarea></td>
				</tr>
			</table>
		</form>
		<!-- 방명록 리스트 -->
		<table class="table">
			<c:forEach var="v" items="${visitorbookList}">
				<thead class="thead-light">
					<tr>
						<th>no.${v.visitorbookId }</th>
						<th class="fs-20">${v.visitorbookWriter }</th>
						<th class="align-right">Date.${v.visitorbookDate }</th>
					</tr>
				</thead>
				<tbody>			
					<tr>
						<td colspan="2">${v.visitorbookContent }</td>
						<td class="align-right"><a class="color-red" href="${pageContext.request.contextPath}/admin/removeVisitorbook/${v.visitorbookId }">삭제</a></td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>
			
	<!-- 페이징 -->	
	<div style="margin-left:35%"> 
		<ul class="pagination">
			<!-- when : 현재 페이지가 1보다 클시 -->
			<!-- other : 현재 페이지가 1일 시 -->
			<c:choose>
				<c:when test="${currentPage > '1'}">
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/visitorbook/1">처음</a></li>
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/visitorbook/${currentPage-1}">이전</a></li>
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
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/visitorbook/${currentPage+1}">다음</a></li>
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/visitorbook/${endPage}">맨끝</a></li>
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