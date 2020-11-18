<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/resources/cash.css" rel="stylesheet" type="text/css" />
</head>
<script>
	$(document).ready(function(){
		$('#addNoticeBtn').click(function(){
			if($('#noticeTitle').val().lenth < 1){
				alert('제목을 입력해 주세요.');
				return;
			} else if($('#noticeContent').val().length < 1){
				alert('내용을 입력해 주세요.');
				return;
			}

			$('#addNoticeForm').submit();
		})
	})
</script>
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
	<!-- 공지사항 추가 폼 -->
	<div class="pastel-cloud-300"><h3>공지사항 작성</h3></div>
	<form id="addNoticeForm" method="post" action="${pageContext.request.contextPath}/admin/addNotice">
		<table class="table">
			<tr>
				<th>제목</th>
				<td><input type="text" id="noticeTitle" name="noticeTitle" class="form-control"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea class="form-control btn-block w100p" name="noticeContent" id="noticeContent" rows="12" cols="100"></textarea></td>
			</tr>
		</table>
		<button class="btn btn-outline-primary" type="button" id="addNoticeBtn">작성</button>
	</form>
</div>
</body>
</html>