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
			<table class="table">
				<tr>
					<td>ID : </td><td><input class="form-control" type="text" name="id" id="id"></td>
				</tr>
				<tr>
					<td>PW : </td><td><input class="form-control" type="password" name="pw" id="pw"></td>
				</tr>
				<tr>
					<td colspan="2"><button type="button" class="btn btn-block btn-outline-warning" id="loginBtn">Login</button></td>
				</tr>
			</table>
			
		</form>
	</div>
	<!-- 공지사항 -->
	<div class="container login-notice">
		<div class="pastel-yellow-200"><h4>Notice</h4></div>
		<div>
			<table class="table">
				<thead>
					<tr>
						<th class="fs-15">No</th>
						<th class="fs-15" style="width:50%">Title</th>
						<th class="fs-15">Date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="n" items="${noticeList}">
						<tr>
							<td class="fs-15">${n.noticeId }</td>
							<td class="fs-15">${n.noticeTitle }</td>
							<td class="fs-15">${n.noticeDate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>