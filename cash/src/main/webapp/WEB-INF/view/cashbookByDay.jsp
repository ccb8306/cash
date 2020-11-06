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
<script>
	$(document).ready(function(){
		$('#addCashbookBtn').click(function(){
			if($('#cashbookPrice').val().length < 1){
				alert('금액을 입력해 주세요.');
				return
			} else if($('#cashbookContent').val().length < 1){
				alert('내용을 입력해 주세요.');
				return
			}
			
			$('#addCashbookForm').submit();
		});
	});
</script>
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
	<div>
		<a href="/admin/cashbookByDay?target=pre&currentYear=${currentYear }&currentMonth=${currentMonth }&currentDay=${currentDay }">이전</a>
		${currentYear }년 ${currentMonth }월 ${currentDay }일
		<a href="/admin/cashbookByDay?target=next&currentYear=${currentYear }&currentMonth=${currentMonth }&currentDay=${currentDay }">다음</a>		
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
						<td><a class="btn btn-outline-success" href="/admin/modifyCashbook?cashbookId=${c.cashbookId}&currentYear=${currentYear }&currentMonth=${currentMonth }&currentDay=${currentDay }">수정</a></td>
						<td><a class="btn btn-outline-danger" href="/admin/removeCashbook?cashbookId=${c.cashbookId}&currentYear=${currentYear }&currentMonth=${currentMonth }&currentDay=${currentDay }">삭제</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 내용 추가 -->
	<div style="margin-top:50px">
		<form id="addCashbookForm" method="post" action="/admin/addCashbook">
			<input type="hidden" name="cashbookDate" value="${currentYear }-${currentMonth }-${currentDay }">
			<table class="table table-borderless">
				<thead class="thead-light">
					<tr>
						<th colspan="4">내역 추가하기</th>
					</tr>
				</thead>
				<tr>
					<td>
						종류 : 
						<select class="btn btn-outline-warning" id="cashbookKind" name="cashbookKind">
							<option>수입</option>
							<option>지출</option>
						</select>
					</td>
					<td>
						카테고리 : 
						<select class="btn btn-outline-warning" id="categoryName" name="categoryName">
							<c:forEach var="c" items="${categoryList }">
								<option value="${c.categoryName }">${c.categoryName } : ${c.categoryInfo }</option>
							</c:forEach>
						</select>
					</td>
					<td>
						금액 : 
					</td>
					<td>
						<input class="form-control" type="text" name="cashbookPrice" id="cashbookPrice">
					</td>
				</tr>
				<tr>
					<td colspan="3">내용 : <textarea class="form-control" style="width:100%;" name="cashbookContent" id="cashbookContent" rows="3" cols="100"></textarea></td>
					<td><button class="btn btn-outline-warning"  id="addCashbookBtn">추가</button></td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>