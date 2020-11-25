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
		});
		
		// 카테고리 리스트 가져오기
		$.ajax({
			url: '${pageContext.request.contextPath}/admin/categoryList/지출',
			type:'get',
			success: function(data1){
				let html = `<option value="-1">카테고리 선택</option>`;
								
				$(data1).each(function(key, value) {
					html += `<option value="` + value.categoryName + `">`+ value.categoryName +`</option>`;		
				});
				$('#categoryList').html(html);
			}
		});
		// 연도 변경시
		$('#yearList').change(function(){
			console.log($('#yearList option:selected').val());
			if($('#categoryList option:selected').val() != '-1'){
				console.log($('#categoryList option:selected').val());
				result();
			}
			return;
		});
		// 카테고리 변경시
		
		$('#categoryList').change(function(){
			console.log($('#categoryList option:selected').val());
			if($('#yearList option:selected').val() != '-1'){
				console.log($('#yearList option:selected').val());
				result();
			}
			return;
		});
		
		// 연도 변경시 해당 연도의 월별 결과 출력
		function result(){
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
						label: '월별 카테고리별 지출' // for legend
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
						text: '월별 카테고리별 지출'
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
				url:'${pageContext.request.contextPath}/admin/monthCategoryExpenditure/' + $('#yearList option:selected').val() + '/' + $('#categoryList option:selected').val(),
				type:'get',
				success:function(data){
					$('#chartParent').empty();
					$('#chartParent').append('<canvas id="chart"></canvas>');
					console.log(data);
					
					$(data).each(function(key, value) {
						let ranColor1 = Math.floor(Math.random()*256);
						let ranColor2 = Math.floor(Math.random()*256);
						let ranColor3 = Math.floor(Math.random()*256);
						config.data.labels.push(value.month+"월");
						config.data.datasets[0].data.push(value.expenditure);
						config.data.datasets[0].backgroundColor.push("rgba(" + ranColor1 +  ", "+ ranColor2 + ", " + ranColor3 + ", 0.4)");
					});
					var ctx = document.getElementById('chart');
					window.myPolarArea = Chart.PolarArea(ctx, config);
				}
			});
			
	
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
	
	<!-- 연도, 카테고리 선택 -->
	<br>
	<div class="row">
		<select class="btn btn-outline-warning" id="yearList" name="yearList">
		</select>
		
		<select class="btn btn-outline-warning" id="categoryList" name="categoryList">
		</select>
	</div>
	<!-- 차트1 -->
	<br>
	<div id="chartParent"></div>
</div>
</body>
</html>