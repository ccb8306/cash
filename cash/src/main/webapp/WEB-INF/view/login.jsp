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
		$('#loginBtn').click(function(){
			$('#loginForm').submit();
		})
	})
</script>
</head>
<body>
<!-- 배경 -->
<div class="container-fluit main-bg">
	<img src="/resources/image/note.jpg" class="bg-img">
</div>
<!-- 본문 -->
<div class="container-fluit main-content">
	<h1><br></h1>
	
	<!-- 로그인 -->
	<div style="text-align:center">
		<img src="/resources/image/login.png" width="60%">
	</div>
	<div class="container" style="width:50%">	
		<form id="loginForm" method="post" action="/login">
			<table class="table" style="font-size:5px">
				<tr>
					<td>ID : </td><td><input class="form-control" type="text" name="id" id="id"></td>
				</tr>
				<tr>
					<td>PW : </td><td><input class="form-control" type="password" name="pw" id="pw"></td>
				</tr>
			</table>
			<button type="button" class="btn btn-block btn-outline-warning" id="loginBtn">Login</button>
		</form>
	</div>
	<!-- 공지사항 -->
	<div class="container" style="margin-top:40px; width:60%; height:100px">
		<h5>공지사항</h5>
		<div style="height:100px">
			<table class="table">
				<thead>
					<tr>
						<th class="fs-10">no</th>
						<th class="fs-10" style="width:50%">제목</th>
						<th class="fs-10">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="n" items="${noticeList}">
						<tr>
							<td class="fs-10">${n.noticeId }</td>
							<td class="fs-10">${n.noticeTitle }</td>
							<td class="fs-10">${n.noticeDate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>