<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<script>
	$(document).ready(function() {
		if('${type}' == 1){
			$("#homeBtn").css( 'width', '7%' );
		}else if('${type}' == 2){
			$("#cashBtn").css( 'width', '7%' );
		}else if('${type}' == 3){
			$("#cashbookListBtn").css( 'width', '7%' );
		}else if('${type}' == 4){
			$("#noticeBtn").css( 'width', '7%' );
		}else if('${type}' == 5){
			$("#addMemberBtn").css( 'width', '7%' ); // 사용자 추가
		}else if('${type}' == 6){
			$("#visitorbookBtn").css( 'width', '7%' ); // 방명록
		}else{
			$("#cashStatsBtn").css( 'width', '7%' ); // 통계
		}
			
		$("#homeBtn").click(function() {
			$(location).attr('href', '${pageContext.request.contextPath}/admin/index')
		});
		$("#cashBtn").click(function() {
			$(location).attr('href', '${pageContext.request.contextPath}/admin/cashbookByMonth/now/-1/-1')
		});
		$("#cashbookListBtn").click(function() {
			$(location).attr('href', '${pageContext.request.contextPath}/admin/cashbookList/1')
		});
		$("#noticeBtn").click(function() {
			$(location).attr('href', '${pageContext.request.contextPath}/admin/noticeList/1')
		});
		$("#cashStatsBtn").click(function() {
			$(location).attr('href', '${pageContext.request.contextPath}/admin/yearCategoryRevenue.jsp?stats=year')
		});
		$("#addMemberBtn").click(function() {
			$(location).attr('href', '${pageContext.request.contextPath}/admin/addMember')
		});
		$("#visitorbookBtn").click(function() {
			$(location).attr('href', '${pageContext.request.contextPath}/admin/visitorbook/1')
		});
		$("#loginoutBtn").click(function() {
			$(location).attr('href', '${pageContext.request.contextPath}/admin/logout')
		});
	});
</script>
<div>
	<div id="homeBtn" class="menu-content" style="background-color:#FFFF99; width:5%; height:20%">
		<p class="ml-10">H<br>O<br>M<br>E</p>
	</div>
	
	<div id="cashBtn" class="menu-content" style="background-color:#FFCCCC; width:5%; height:20%; margin-top:10px">
		<p class="ml-10">가<br>계<br>부</p>
	</div>
	
	<div id="cashbookListBtn" class="menu-content" style="background-color:#FFCC66; width:5%; height:20%; margin-top:10px">
		<p class="ml-10">리<br>스<br>트</p>
	</div>
	
	<div id="noticeBtn" class="menu-content" style="background-color:#99FFFF; width:5%; height:20%; margin-top:10px">
		<p class="ml-10">공<br>지<br>사<br>항</p>
	</div>
	
	<div id="cashStatsBtn" class="menu-content" style="background-color:#99FF99; width:5%; height:20%; margin-top:10px">
		<p class="ml-10">통<br><br>계</p>
	</div>
	
	<div id="addMemberBtn" class="menu-content" style="background-color:#E8D9FF; width:5%; height:20%; margin-top:10px">
		<p class="ml-10">사&nbsp;&nbsp;&nbsp;추<br>용&nbsp;&nbsp;&nbsp;가<br>자</p>
	</div>
	
	<div id="visitorbookBtn" class="menu-content" style="background-color:#D9E5FF; width:5%; height:20%; margin-top:10px">
		<p class="ml-10">방<br>명<br>록</p>
	</div>
	
	<div id="loginoutBtn" class="menu-content" style="background-color:#FF9966; width:5%; height:20%; margin-top:10px">
		<p class="ml-10">로<br>그<br>아<br>읏</p>
	</div>
</div>