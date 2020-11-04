<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			$(location).attr('href', '/')
		});
		$("#cashBtn").click(function() {
			$(location).attr('href', '/cashbookByMonth')
		});
		$("#noticeBtn").click(function() {
		});
	});
</script>
<div>
	<div id="homeBtn" style="background-color:#FFFF99; width:5%; height:20%">
		H<br>O<br>M<br>E
	</div>
	
	<div id="cashBtn" style="background-color:#FFCCCC; width:5%; height:20%; margin-top:10px">
		가<br>계<br>부
	</div>
	
	<div id="noticeBtn" style="background-color:#FF9966; width:5%; height:20%; margin-top:10px">
		공<br>지<br>사<br>항
	</div>
</div>