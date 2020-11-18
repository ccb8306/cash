<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/resources/cash.css" rel="stylesheet" type="text/css" />
<script>
	$(document).ready(function(){
		for(let i = 1; i <= ${lastDay+(firstDayOfWeek-1)}; i++){
			if(i%7 == 1){
				$('#day' + i).css('color', '#FF0000');
			}else if(i%7 == 0){
				$('#day' + i).css('color', '#0000FF');
			}
		}
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
	<h1><br></h1>
	
	<div style="width:250px; margin:0 auto">
		<div class="ml-a pastel-peach-250">
			<div class="row">
			<div class=""><h3><a class="color-red" href="${pageContext.request.contextPath}/admin/cashbookByMonth/pre/${currentYear}/${currentMonth}"><i class='fas fa-minus' style='font-size:35px;color:red'></i></a></h3></div>
			<div class="ml-a"><h3>&nbsp; ${currentYear}년 ${currentMonth} 월 &nbsp;</h3></div>
			<div class="ml-a"><h3><a class="color-red" href="${pageContext.request.contextPath}/admin/cashbookByMonth/next/${currentYear}/${currentMonth}"><i class='fas fa-plus' style='font-size:35px;color:red'></i></a></h3></div>
			</div>
		</div>
	</div>
	<div class="pastel-yellow-250">
		<div>
			이번달 수입 합계 : <script>document.write(Number(${sumIn}).toLocaleString());</script>
		</div>
		<div>
			 이번달 지출 합계 : <script>document.write(Number(${sumOut}).toLocaleString());</script>
		</div>
	</div>
	<div>
		<table class="table">
			<thead>
				<tr>
					<th style="color:#FF0000">일</th>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th style="color:#0000FF">토</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:forEach var="i" begin="1" end="${lastDay+(firstDayOfWeek-1)}" step="1">
						<c:if test="${i-(firstDayOfWeek-1) < 1}">
							<td>&nbsp;</td>
						</c:if>
						
										
						<c:if test="${i-(firstDayOfWeek-1) > 0}">
							<td style="width:14%;">
								<div>
									<a id="day${i}" href="${pageContext.request.contextPath}/admin/cashbookByDay/now/${currentYear}/${currentMonth}/${i-(firstDayOfWeek-1)}" style="color:black">${i-(firstDayOfWeek-1)}</a>
								</div>
								<c:forEach var="c" items="${cashList}">
									<c:if test="${i-(firstDayOfWeek-1) == c.day}">
										<div id="div${i}"> ${c.cashbookKind }
										<script>
											document.write(Number(${c.cashbookPrice}).toLocaleString());
										</script>
										</div>
									
									</c:if>
								</c:forEach>
							</td>
						</c:if>
						<c:if test="${i%7 == 0}">
							</tr><tr>
						</c:if>
					</c:forEach>
					
					<c:if test="${(lastDay+(firstDayOfWeek-1)) % 7 != 0}">
						<c:forEach begin="1" end="${7- ((lastDay+(firstDayOfWeek-1)) % 7)}" step="1">
							<td>&nbsp;</td>
						</c:forEach>
					</c:if>
				</tr>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>