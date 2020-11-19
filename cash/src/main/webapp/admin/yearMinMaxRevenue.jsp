<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath}/resources/cash.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		let chartData = {
			type: 'bar', 
	        data: {
	           labels:[],
	           datasets:[{
	              label:'연도별 최소 수입',
	              backgroundColor: [],
	              borderColor: 'rgba(255, 255, 255, 0.5)',
	                 data:[],
	                 borderWidth: 1
	           },{
		              label:'연도별 최대 수입',
		              backgroundColor: [],
		              borderColor: 'rgba(255, 255, 255, 0.5)',
		                 data:[],
		                 borderWidth: 1
		           }]
	        },
        	options: {
				title: {
					display: true,
				},
				tooltips: {
					mode: 'index',
					intersect: false
				},
				responsive: true,
				scales: {
					xAxes: [{
						stacked: true,
					}],
					yAxes: [{
						stacked: true
					}]
				}
			}
		};
		
		$.ajax({
			url:'${pageContext.request.contextPath}/admin/yearMinMaxRevenue',
			type:'get',
			success:function(data){
				console.log(data);
				let ranColor1 = Math.floor(Math.random()*256);
				let ranColor2 = Math.floor(Math.random()*256);
				let ranColor3 = Math.floor(Math.random()*256);
				let ranColor11 = Math.floor(Math.random()*256);
				let ranColor22 = Math.floor(Math.random()*256);
				let ranColor33 = Math.floor(Math.random()*256);
				
				$(data).each(function(key, value) {
					chartData.data.labels.push(value.year);
					chartData.data.datasets[0].data.push(value.min);
					chartData.data.datasets[0].backgroundColor.push("rgba(" + ranColor1 +  ", "+ ranColor2 + ", " + ranColor3 + ", 0.4)");
					chartData.data.datasets[1].data.push(value.max);
					chartData.data.datasets[1].backgroundColor.push("rgba(" + ranColor11 +  ", "+ ranColor22 + ", " + ranColor33 + ", 0.4)");
				});
				
				var ctx = document.getElementById('chart').getContext('2d');
				var chart = new Chart(ctx, chartData);
			}
		});
	});
</script>
</head>
<body>
<!-- 배경 -->
<div class="container-fluit main-bg">
	<img src="${pageContext.request.contextPath}/resources/image/note.jpg" class="bg-img">
</div>
<!-- 메뉴 -->
<div class="container-fluit menu-bar" id="menubar">
	<jsp:include page="/WEB-INF/view/include/menu.jsp"></jsp:include>
</div>
<!-- 본문 -->
<div class="container-fluit main-content">
	<br>
	<div class="pastel-melon-250"><h2>통계</h2></div>
	<!-- 차트 메뉴 -->
	<div>
		<jsp:include page="/WEB-INF/view/include/chartMenu.jsp"></jsp:include>
	</div>
	
	<!-- 차트1 -->
	<div>
		<canvas id="chart"></canvas>
	</div>
	<!-- 테이블 -->
	<div>
	</div>
</div>
</body>
</html>