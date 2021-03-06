<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>stats</title>

<link href="${pageContext.request.contextPath}/resources/cash.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		let chartData = {
			type: 'line', 
	        data: {
	           labels:[],
	           datasets:[{
	              label:['연도별 총 수입'],
	              backgroundColor: 'rgba(255,00,00, 0.5)',
	              borderColor: 'rgba(255, 00, 00, 0.5)',
	                 data:[],
	         		fill: false,
	                 borderWidth: 1
	           }]
			}
		};
		
		$.ajax({
			url:'${pageContext.request.contextPath}/admin/yearTotalRevenue',
			type:'get',
			success:function(data){
				console.log(data);
				
				$(data).each(function(key, value) {
					chartData.data.labels.push(value.year);
					chartData.data.datasets[0].data.push(value.revenue);
				});
				
				var ctx = document.getElementById('chart').getContext('2d');
				var chart = new Chart(ctx, chartData);
			}
		});
	});
</script>
<!-- 배경 이미지 사이즈 -->
<script src="${pageContext.request.contextPath}/resources/cash.js"></script>
</head>
<body>
<!-- 배경 -->
<div class="container-fluit main-bg" id="main-bg">
	<div><img src="${pageContext.request.contextPath}/resources/image/note1.png" class="bg-img" style="height:500px"></div>
	<div><img src="${pageContext.request.contextPath}/resources/image/note2.png" class="bg-img" id="bg-img2" style="height:500px"></div>
	<div><img src="${pageContext.request.contextPath}/resources/image/note3.png" class="bg-img" style="height:500px"></div>
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