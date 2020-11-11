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
	<br>
	<div>
		<div class="pastel-yellow-300"><h2>전체 리스트</h2></div>
	</div>
	<a href="/admin/cashbookListExcel">[전체 리스트를 엑셀 파일로 다운로드]</a>
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
</body>
</html>