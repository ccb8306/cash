<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyCashbook</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/resources/cash.css" rel="stylesheet" type="text/css" />
<script>
	$(document).ready(function(){
		$('#modifyCashbookBtn').click(function(){
			if($('#cashbookPrice').val().length < 1){
				alert('금액을 입력해 주세요.');
				return
			} else if($('#cashbookContent').val().length < 1){
				alert('내용을 입력해 주세요.');
				return
			}
			
			$('#modifyCashbookForm').submit();
		});
	});
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
	<!-- 내용 수정 --><br>
	<div>
		<form id="modifyCashbookForm" method="post" action="${pageContext.request.contextPath}/admin/modifyCashbook">
			<input type="hidden" name="currentYear" value="${currentYear}">
			<input type="hidden" name="currentMonth" value="${currentMonth}">
			<input type="hidden" name="currentDay" value="${currentDay}">
			<input type="hidden" name="cashbookId" value="${cashbook.cashbookId}">
			<div class="pastel-peach-250"><h4>내역 수정하기</h4></div>
			<table class="table table-borderless">
				<tr>
					<td>
						종류 : 
						<select class="btn btn-outline-warning" id="cashbookKind" name="cashbookKind">
							<c:if test="${cashbook.cashbookKind == '수입'}">
								<option selected="selected">수입</option>
								<option>지출</option>
							</c:if>
							<c:if test="${cashbook.cashbookKind == '지출'}">
								<option>수입</option>
								<option selected="selected">지출</option>
							</c:if>
						</select>
					</td>
					<td>
						카테고리 : 
						<select class="btn btn-outline-warning" id="categoryName" name="categoryName">
							<c:forEach var="c" items="${categoryList }">
								<c:choose>
									<c:when test="${cashbook.categoryName ==  c.categoryName}">
										<option selected="selected" value="${c.categoryName }">${c.categoryName } : ${c.cashbookKind }</option>
									</c:when>
									<c:otherwise>
										<option value="${c.categoryName }">${c.categoryName } : ${c.cashbookKind }</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</td>
					<td>
						금액 : 
					</td>
					<td>
						<input class="form-control" type="text" name="cashbookPrice" id="cashbookPrice" value="${cashbook.cashbookPrice }">
					</td>
				</tr>
				<tr>
					<td colspan="3">내용 : <textarea class="form-control" style="width:100%;" name="cashbookContent" id="cashbookContent" rows="3" cols="100">${cashbook.cashbookContent }</textarea></td>
					<td><br><button style="width:100px; height:50px" class="btn btn-outline-warning" type="button" id="modifyCashbookBtn">수정</button></td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>