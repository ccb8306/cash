<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeOne</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/resources/cash.css" rel="stylesheet" type="text/css" />
<script>
	$(document).ready(function(){
		// 댓글 유효성 검사
		$('#addCommentBtn').click(function(){
			if($('#commentContent').val().length < 1){
				alert('내용을 입력해 주세요.');
				return
			}

			$('#addCommentForm').submit();
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
	<!-- 공지사항 상세보기 -->
	<div class="pastel-cloud-300"><h3>공지사항 상세보기</h3></div>
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
	
	<!-- 첨부파일 -->
	<table class="table">
		<thead class="thead-light">
			<tr>
				<th><h4>첨부파일</h4></th>
			</tr>
		</thead>
		<c:forEach var="nf" items="${notice.noticefileList }">
			<c:if test="${!empty nf.noticefileName }">
				<tr>
					<td><a href="${pageContext.request.contextPath}/upload/${nf.noticefileName}">${nf.noticefileName }</a></td>
				</tr>
			</c:if>
			<c:if test="${empty nf.noticefileName }">
				<tr><td>첨부파일이 없습니다.</td></tr>
			</c:if>
		</c:forEach>
	</table>
	
	<div class="row fl-r">
		<a class="btn btn-outline-success" style="width:100px" href="${pageContext.request.contextPath}/admin/modifyNotice/${notice.noticeId}">수정</a>
		<a class="btn btn-outline-danger" style="width:100px" href="${pageContext.request.contextPath}/admin/removeNotice/${notice.noticeId}">삭제</a>
	</div>
	
	<div class="mt-100"></div>
	<h5>댓글</h5>
	<!-- 댓글 -->
	<table class="table">
		<tr>
			<th>댓글ID</th>
			<th>내용</th>
			<th>작성일</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="nc" items="${notice.noticecommentList }">
			<c:if test="${!empty nc.commentContent }">
				<tr>
					<td style="width:10%">${nc.commentId }</td>
					<td>${nc.commentContent }</td>
					<td style="width:20%">${nc.commentDate }</td>
					<td style="width:10%"><a href="${pageContext.request.contextPath}/admin/removeNoticecomment/${nc.noticeId }/${nc.commentId }">삭제</a></td>
				</tr>
			</c:if>
			<c:if test="${empty nc.commentContent }">
				<tr><td>댓글이 없습니다.</td></tr>
			</c:if>
		</c:forEach>
	</table>
	<div class="mt-50"></div>
	<!-- 댓글 작성 -->
	<h5>댓글 작성</h5>
	<form id="addCommentForm" method="post" action="${pageContext.request.contextPath}/admin/addNoticecomment">
		<input type="hidden" name="noticeId" value="${notice.noticeId}">
		<table class="table">
			<tr>
				<th>내용</th>
				<td><textarea id="commentContent" name="commentContent" class="form-control"></textarea></td>
				<td><button id="addCommentBtn" type="button" class="btn btn-outline-dark">작성</button></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>