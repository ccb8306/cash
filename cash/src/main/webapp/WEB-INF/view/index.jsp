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
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
</script>
</head>
<body>
<!-- 배경 -->
<div class="container-fluit main-bg">
	<img src="/resources/image/note.jpg" class="bg-img">
</div>
<!-- 메뉴 -->
<div class="container-fluit menu-bar" id="menubar">
	<jsp:include page="/WEB-INF/view/include/menu.jsp"></jsp:include>
</div>
<!-- 본문 -->
<div class="container-fluit main-content">
	<!-- 공지사항 -->
	<!--
	<br>
	<div>
		<div class="pastel-yellow-200"><h2><a class="color-black" href="/admin/noticeList/1">공지사항</a></h2></div>
		<table class="table">
			<thead>
				<tr>
					<th>no</th>
					<th style="width:60%">제목</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="n" items="${noticeList}">
					<tr>
						<td>${n.noticeId }</td>
						<td><a href="/admin/noticeOne/${n.noticeId }">${n.noticeTitle }</a></td>
						<td>${n.noticeDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	-->
	<div style="width:300px; margin:0 auto; margin-top:10%">
		<br>
		<div class="mt-100 align-center">
			<h2 class="pastel-yellow-300">최근 3개월 내역</h2>
		</div>
	</div>
	<div class="row">	
		<c:forEach var="io" items="${inOutList}">
			<div class="col-sm-4 ma">
				<table class="table bg-white">
					<thead style="background:#FFC1C1">
						<tr>
							<th style="text-align:center" colspan="2">${io["yyyy"]}년</th>
						</tr>
						<tr>
							<th style="text-align:center" colspan="2"><a href="/admin/cashbookByMonth/now/${io['yyyy']}/${io['mm']}">${io["mm"]}월</a></th>
						</tr>
					</thead>
					<tbody style="background:#FFFAF0;">
						<tr>
							<th>수입</th>
							<td><script>document.write(numberWithCommas(${io["수입"]}))</script></td>
						</tr>
						<tr>
							<th>지출</th>
							<td><script>document.write(numberWithCommas(${io["지출"]}))</script></td>
						</tr>
						<tr>
							<th>합계</th>
							<td><script>document.write(numberWithCommas(${io["합계"]}))</script></td>
						</tr>
					</tbody>
				</table>
			</div>
		</c:forEach>
	</div>
	
</div>
</body>
</html>