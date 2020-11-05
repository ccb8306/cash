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
	<!-- 공지사항 상세보기 -->
	<div><h2>공지사항 상세보기</h2></div>
	<table class="table">
		<tr>
			<th>제목</th>
			<td>${notice.noticeTitle }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${notice.noticeDate }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${notice.noticeContent }</td>
		</tr>
	</table>
	<div class="row" style="float:right">
		<a class="btn btn-outline-success" style="width:100px" href="/admin/modifyNotice?noticeId=${notice.noticeId}">수정</a>
		<a class="btn btn-outline-danger" style="width:100px" href="/admin/removeNotice?noticeId=${notice.noticeId}">삭제</a>
	</div>
</div>
</body>
</html>