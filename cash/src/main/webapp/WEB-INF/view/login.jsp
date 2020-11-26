<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/resources/cash.css" rel="stylesheet" type="text/css" />
<script>
	$(document).ready(function(){
		$('#loginBtn').click(function(){
			// 비동기
			$.ajax({
				url: '${pageContext.request.contextPath}/admin/memberCk',
				type: 'get',
				data: {id:$('#id').val(), pw:$('#pw').val()},
				success: function(data){
					console.log(data);
					if(data == false){
						alert('아이디나 비밀번호가 다릅니다.');
						return;
					}else{
						$('#loginForm').submit();
						return;
					}
				}
			})	
		})
	})
</script>
</head>
<body>
<!-- 배경 -->
<div class="container-fluit main-bg" id="main-bg">
	<div><img src="${pageContext.request.contextPath}/resources/image/note1.png" class="bg-img" style="height:500px"></div>
	<div><img src="${pageContext.request.contextPath}/resources/image/note2.png" class="bg-img" id="bg-img2" style="height:500px"></div>
	<div><img src="${pageContext.request.contextPath}/resources/image/note3.png" class="bg-img" style="height:500px"></div>
</div>
<!-- 본문 -->
<div class="container-fluit main-content" id="main-content">
	<h1><br></h1>
	
	<!-- 로그인 -->
	<div style="text-align:center">
		<img src="${pageContext.request.contextPath}/resources/image/login.png" width="60%">
	</div>
	<div class="container" style="width:50%">	
		<form id="loginForm" method="post" action="${pageContext.request.contextPath}/login">
			<table class="table">
				<tr>
					<td>ID : </td><td><input class="form-control" type="text" name="id" id="id" value="goodee"></td>
				</tr>
				<tr>
					<td>PW : </td><td><input class="form-control" type="password" name="pw" id="pw" value="1234"></td>
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
<!-- 배경 이미지 사이즈 -->
<script src="${pageContext.request.contextPath}/resources/cash.js"></script>
</body>
</html>