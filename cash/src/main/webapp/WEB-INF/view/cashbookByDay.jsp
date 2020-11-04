<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script>
	$(document).ready(function(){
		$('addCashbookBtn').click(function{
			$('addCashbookForm').submit();
		});
	});
</script>
</head>
<body>
<!-- 배경 -->
<div class="container-fluit" style="position:absolute; top:2%; left:5%; width:90%">
	<img src="/resources/image/note.jpg" width="100%" height="1000px">
</div>
<!-- 메뉴 -->
<div class="container-fluit" style="position:absolute; top:20%; left:8%; width:90%">
	<jsp:include page="/WEB-INF/view/include/menu.jsp"></jsp:include>
</div>
<!-- 본문 -->
<div class="container-fluit" style="width:70%; position:relative; margin-top:10%; margin-left:15%">
	<h1><br></h1>
	<div>
		${currentYear }년 ${currentMonth }월 ${currentDay }일
	</div>
	<div>
		<table class="table">
			<thead>
				<tr>
					<th>ID</th>
					<th>Kind</th>
					<th>Category</th>
					<th>Price</th>
					<th>Content</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="c" items="${cashbookList}">
					<tr>
						<td>${c.cashbookId}</td>
						<td>${c.cashbookKind}</td>
						<td>${c.categoryName}</td>
						<td>${c.cashbookPrice}</td>
						<td>${c.cashbookContent}</td>
						<td><a href=""></a></td>
						<td><a href=""></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 내용 추가 -->
	<div style="margin-top:50px">
		<form id="addCashbookForm" method="post" action="/addCashbook">
			<input type="hidden" name="cashbookDate" value="${currentYear }-${currentMonth }-${currentDay }">
			<table class="table">
				<thead class="thead-light">
					<tr>
						<th colspan="3">내역 추가하기</th>
					</tr>
				</thead>
				<tr>
					<td>
						종류 : 
						<select id="cashbookKind" name="cashbookKind">
							<option>수입</option>
							<option>지출</option>
						</select>
					</td>
					<td>
						카테고리 : 
						<select id="categoryName" name="categoryName">
							<c:forEach var="c" items="${categoryList }">
								<option value="${c.categoryName }">${c.categoryName } : ${c.categoryInfo }</option>
							</c:forEach>
						</select>
					</td>
					<td>
						금액 : <input type="text" name="cashbookPrice" id="cashbookPrice">
					</td>
				</tr>
				<tr>
					<td colspan="2">내용 : <textarea name="cashbookContent" id="cashbookContent" rows="3" cols="100"></textarea></td>
					<td><button id="addCashbookBtn">추가</button></td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>