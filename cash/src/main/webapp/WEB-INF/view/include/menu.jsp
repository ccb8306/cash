<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<script>
	$(document).ready(function() {
		if('${type}' == 1){
			$("#homeBtn").css( 'width', '7%' );
		}else if('${type}' == 2){
			$("#cashBtn").css( 'width', '7%' );
		}else if('${type}' == 3){
			$("#noticeBtn").css( 'width', '7%' );
		}
			
		$("#homeBtn").click(function() {
			$(location).attr('href', '/admin/index')
		});
		$("#cashBtn").click(function() {
			$(location).attr('href', '/admin/cashbookByMonth')
		});
		$("#noticeBtn").click(function() {
			$(location).attr('href', '/admin/noticeList')
		});
		$("#loginoutBtn").click(function() {
			$(location).attr('href', '/admin/logout')
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
	
	<div id="noticeBtn" class="menu-content" style="background-color:#99FFFF; width:5%; height:20%; margin-top:10px">
		<p class="ml-10">공<br>지<br>사<br>항</p>
	</div>
	<div id="loginoutBtn" class="menu-content" style="background-color:#FF9966; width:5%; height:20%; margin-top:10px">
		<p class="ml-10">로<br>그<br>아<br>읏</p>
	</div>
</div>