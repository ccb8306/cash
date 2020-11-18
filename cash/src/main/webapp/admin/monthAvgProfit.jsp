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
		// 연도 리스트 가져오기
		$.ajax({
			url: '${pageContext.request.contextPath}/admin/yearList',
			type:'get',
			success: function(data1){
				let html = `<option value="-1">연도 선택</option>`;
								
				$(data1).each(function(key, value) {
					html += `<option value="` + value + `">`+ value +`</option>`;		
				});

				html += `</select>`;
				$('#yearList').html(html);
			}
		})	
		

		
		// 연도 변경시 해당 연도의 월별 결과 출력
		$('#yearList').change(function(){
			var randomScalingFactor = function() {
				return Math.round(Math.random() * 100);
			};
	
			var chartColors = window.chartColors;
			var color = Chart.helpers.color;
			let config = {
				data: {
					datasets: [{
						data: [],
						backgroundColor: [],
						label: '월별 평균 수익' // for legend
					}],
					labels: []
				},
				options: {
					responsive: true,
					legend: {
						position: 'right',
					},
					title: {
						display: true,
						text: '월별 평균 수익(수입 - 지출)'
					},
					scale: {
						ticks: {
							beginAtZero: true
						},
						reverse: false
					},
					animation: {
						animateRotate: false,
						animateScale: true
					}
				}
			};
	
		
			$.ajax({
				url:'${pageContext.request.contextPath}/admin/monthAvgProfit/' + $('#yearList option:selected').val(),
				type:'get',
				success:function(data){
					console.log(data);
					
					$(data).each(function(key, value) {
						$('#chartParent').empty();
						$('#chartParent').append('<canvas id="chart"></canvas>');
						let ranColor1 = Math.floor(Math.random()*256);
						let ranColor2 = Math.floor(Math.random()*256);
						let ranColor3 = Math.floor(Math.random()*256);
						config.data.labels.push(value.month+"월 : " + value.profit);
						config.data.datasets[0].data.push(value.profit);
						config.data.datasets[0].backgroundColor.push("rgba(" + ranColor1 +  ", "+ ranColor2 + ", " + ranColor3 + ", 0.4)");
					});
					var ctx = document.getElementById('chart');
					window.myPolarArea = Chart.PolarArea(ctx, config);
				}
			});
			
			
			window.onload = function() {
			};
	
			/*document.getElementById('randomizeData').addEventListener('click', function() {
				config.data.datasets.forEach(function(piece, i) {
					piece.data.forEach(function(value, j) {
						config.data.datasets[i].data[j] = randomScalingFactor();
					});
				});
				window.myPolarArea.update();
			});
	
			var colorNames = Object.keys(window.chartColors);
			document.getElementById('addData').addEventListener('click', function() {
				if (config.data.datasets.length > 0) {
					config.data.labels.push('data #' + config.data.labels.length);
					config.data.datasets.forEach(function(dataset) {
						var colorName = colorNames[config.data.labels.length % colorNames.length];
						dataset.backgroundColor.push(window.chartColors[colorName]);
						dataset.data.push(randomScalingFactor());
					});
					window.myPolarArea.update();
				}
			});
			document.getElementById('removeData').addEventListener('click', function() {
				config.data.labels.pop(); // remove the label first
				config.data.datasets.forEach(function(dataset) {
					dataset.backgroundColor.pop();
					dataset.data.pop();
				});
				window.myPolarArea.update();
			});*/
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
	
	<!-- 연도 선택 -->
	<div id="selectYear">
		<br>
		<select class="btn btn-outline-warning" id="yearList" name="yearList">
		</select>
	</div>
	<!-- 차트1 -->
	<br>
	<div id="chartParent"></div>
	<!-- 테이블 -->
	<div>
	</div>
</div>
</body>
</html>