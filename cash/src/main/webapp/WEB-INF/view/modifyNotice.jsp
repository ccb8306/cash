<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		$('#modifyNoticeBtn').click(function(){
			if($('#noticeTitle').val().lenth < 1){
				alert('제목을 입력해 주세요.');
				return;
			} else if($('#noticeContent').val().length < 1){
				alert('내용을 입력해 주세요.');
				return;
			}

			$('#modifyNoticeForm').submit();
		})
	})
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
	<!-- 공지사항 수정 -->
	<div><h2>공지사항 수정</h2></div>
	<form id="modifyNoticeForm" method="post" action="modifyNotice">
		<input type="hidden" value="${notice.noticeId}" name="noticeId">
		<table class="table">
			<tr>
				<th>제목</th>
				<td><input class="form-control" type="text" id="noticeTitle" name="noticeTitle" value="${notice.noticeTitle }"></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><input class="form-control" type="readOnly" value="${notice.noticeDate }" name="noticeDate"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea id="noticeContent" name="noticeContent" rows="12" cols="100" class="form-control btn-block" style="width:100%;">${notice.noticeContent }</textarea></td>
			</tr>
		</table>
		<div class="row" style="float:right">
			<button class="btn btn-outline-success" type="button" name="modifyNoticeBtn" id="modifyNoticeBtn">수정 완료</button>
		</div>
	</form>
</div>
</body>
</html>