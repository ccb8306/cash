<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addMember</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/resources/cash.css" rel="stylesheet" type="text/css" />
<script>
	$(document).ready(function(){
		$('#addMemberSubmitBtn').click(function(){
			if($('#id').val().length < 1){
				alert('아이디를 입력해 주세요.');
				return
			}else if($('#pw').val().length < 1){
				alert('비밀번호를 입력해 주세요.');
				return
			}
			// 비동기
			$.ajax({
				url: '/admin/idCheck',
				type: 'post',
				data: {id:$('#id').val()},
				success: function(data){
					if(data == false){
						alert('중복된 아이디 입니다.');
					}else{
						$('#addMemberForm').submit();
					}
				}
			})
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
	<h1><br></h1>
	
	<!-- 사용자 추가 -->
	<div style="width:300px; margin:0 auto; margin-top:10%">
		<div class="pastel-yellow-300"><h2>Add Member</h2></div>
	</div>
	<div class="container" style="width:50%">	
		<form id="addMemberForm" method="post" action="${pageContext.request.contextPath}/admin/addMember">
			<table class="table">
				<tr>
					<td>ID : </td><td><input class="form-control" type="text" name="id" id="id"></td>
				</tr>
				<tr>
					<td>PW : </td><td><input class="form-control" type="password" name="pw" id="pw"></td>
				</tr>
				<tr>
					<td colspan="2"><button type="button" class="btn btn-block btn-outline-warning" id="addMemberSubmitBtn">Add</button></td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>