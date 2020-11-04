<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
<div class="container-fluit" style="position:absolute; top:2%; left:5%; width:90%">
	<img src="/resources/image/note.jpg" width="100%" height="1000px">
</div>
<!-- 메뉴 -->
<div class="container-fluit" style="position:absolute; top:20%; left:8%; width:90%">
	<jsp:include page="/WEB-INF/view/include/menu.jsp"></jsp:include>
</div>
<!-- 본문 -->
<div class="container-fluit" style="width:70%; position:relative; margin-top:10%; margin-left:15%">
	<h1><br></h1>
	<div>
		이번달 수입 합계 : ${sumIn }
	</div>
	<div>
		이번달 지출 합계 : ${sumOut }
	</div>
	<h3>
		<a href="/cashbookByMonth?currentYear=${currentYear}&currentMonth=${currentMonth-1}">[이전달]</a>
		${currentYear}년 ${currentMonth} 월
		<a href="/cashbookByMonth?currentYear=${currentYear}&currentMonth=${currentMonth+1}">[다음달]</a>
	</h3>
	
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
								<div id="day${i}">
									<a href="/cashbookByDay?currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${i-(firstDayOfWeek-1)}" style="color:black">${i-(firstDayOfWeek-1)}</a>
								</div>
								<c:forEach var="c" items="${cashList}">
									<c:if test="${i-(firstDayOfWeek-1) == c.day}">
										<div>[${c.cashbookKind }] : ${c.cashbookPrice }</div>
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