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
	// 연도 리스트 가져오기
	$.ajax({
		url: '${pageContext.request.contextPath}/admin/yearList',
		type:'get',
		success: function(data1){
			let html = `<option value="-1">연도 선택</option>`;
							
			$(data1).each(function(key, value) {
				html += `<option value="` + value + `">`+ value +`</option>`;		
			});
			$('#yearList').html(html);
		}
	})
	
	// 연도 변경시 해당 연도의 월별 결과 출력
	$('#yearList').change(function(){

		var chartData = {
				type: 'line',
				data: {
					labels: [],
					datasets: [{
						label:'월별 총 수익(수입 - 지출)',
						data: [],
						backgroundColor: [],
						borderColor: [],
						fill: false,
						borderDash: [7, 7],
						pointRadius: [6, 7, 8, 9, 10, 11, 12, 13,14,15,16,17],
						pointHoverRadius: 10,
						hoverBorderColor : []
					}]
				},
				options: {
					responsive: true,
					legend: {
						position: 'bottom',
					},
					hover: {
						mode: 'index'
					},
					scales: {
						xAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: 'Month'
							}
						}],
						yAxes: [{
							display: true,
							scaleLabel: {
								display: true,
								labelString: 'Value'
							}
						}]
					}
				}
			};

			window.onload = function() {
				var ctx = document.getElementById('canvas').getContext('2d');
				window.myLine = new Chart(ctx, config);
			};

		
		$.ajax({
			url:'${pageContext.request.contextPath}/admin/monthTotalProfit/' + $('#yearList option:selected').val(),
			type:'get',
			success:function(data){
				$('#chartParent').empty();
				$('#chartParent').append('<canvas id="chart"></canvas>');

				let ranColor1 = Math.floor(Math.random()*256);
				let ranColor2 = Math.floor(Math.random()*256);
				let ranColor3 = Math.floor(Math.random()*256);
				
				$(data).each(function(key, value) {
					chartData.data.labels.push(value.month+"월");
					chartData.data.datasets[0].data.push(value.profit);
					chartData.data.datasets[0].backgroundColor.push("rgba(" + ranColor1 +  ", "+ ranColor2 + ", " + ranColor3 + ", 0.3)");
					chartData.data.datasets[0].borderColor.push("rgba(" + ranColor1 +  ", "+ ranColor2 + ", " + ranColor3 + ", 0.8)");
					
				});
				
				var ctx = document.getElementById('chart').getContext('2d');
				var chart = new Chart(ctx, chartData);
			}
		});
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
	
	<!-- 연도 선택 -->
	<div id="selectYear">
		<br>
		<select class="btn btn-outline-warning" id="yearList" name="yearList">
		</select>
	</div><br>
	<!-- 차트1 -->
	<div id="chartParent"></div>
	<!-- 테이블 -->
	<div>
	</div>
</div>
</body>
</html>