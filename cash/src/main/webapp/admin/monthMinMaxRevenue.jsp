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
<script src="https://www.chartjs.org/samples/latest/utils.js"></script>
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
			var utils = Samples.utils;

			utils.srand(110);

			
			let data = {
				labels: [],
				datasets: [{	
		            label:'월별 최소 수입',
					backgroundColor : [],
					borderColor : [],
					data: []
				},{	
		            label:'월별최대 수입',
					backgroundColor : [],
					borderColor : [],
					data: []
				}]
			};
			
			$('#chartParent').empty();
			$('#chartParent').append('<canvas id="chart"></canvas>');
			
			$.ajax({
				url:'${pageContext.request.contextPath}/admin/monthMinMaxRevenue/' + $('#yearList option:selected').val(),
				type:'get',
				success:function(data1){
					console.log(data1);
					let ranColor1 = Math.floor(Math.random()*256);
					let ranColor2 = Math.floor(Math.random()*256);
					let ranColor3 = Math.floor(Math.random()*256);
					let ranColor11 = Math.floor(Math.random()*256);
					let ranColor22 = Math.floor(Math.random()*256);
					let ranColor33 = Math.floor(Math.random()*256);
					
					$(data1).each(function(key, value) {
						//var m = value.month + '월'
						data.datasets[0].data.push({
							x: value.month,
							y: value.min,
							v: utils.rand(0, 1000)
						});		
						data.datasets[0].backgroundColor.push("rgba(" + ranColor1 +  ", "+ ranColor2 + ", " + ranColor3 + ", 0.35)");
						data.datasets[0].borderColor.push("rgba(" + ranColor1 +  ", "+ ranColor2 + ", " + ranColor3 + ", 0.6)");
						
						data.datasets[1].data.push({
							x: value.month,
							y: value.max,
							v: utils.rand(0, 1000)
						});		
						data.datasets[1].backgroundColor.push("rgba(" + ranColor11 +  ", "+ ranColor22 + ", " + ranColor33 + ", 0.35)");
						data.datasets[1].borderColor.push("rgba(" + ranColor11 +  ", "+ ranColor22 + ", " + ranColor33 + ", 0.6)");

					});
					chart.update();
					
				}
			});


			var options = {
				aspectRatio: 1,

				elements: {
					point: {
						title: {
							display: true,
						},
						
						borderWidth: function(context) {
							return Math.min(Math.max(1, context.datasetIndex + 2), 10);
						},

						hoverBackgroundColor: 'transparent',

						hoverBorderColor: function(context) {
							return utils.color(context.datasetIndex);
						},

						hoverBorderWidth: function(context) {
							var value = context.dataset.data[context.dataIndex];
							return Math.round(8 * value.v / 1000);
						},

						radius: function(context) {
							var value = context.dataset.data[context.dataIndex];
							var size = context.chart.width;
							var base = Math.abs(value.v) / 1000;
							return (size / 24) * base;
						}
					}
				}
			};

			var chart = new Chart('chart', {
				type: 'bubble',
				data: data,
				options: options
			});

			
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
	<br>
	<div class="row">
		<select class="btn btn-outline-warning" id="yearList" name="yearList">
		</select>
	</div>
	<!-- 차트1 -->
	<br>
	<div id="chartParent" style="width:650px"></div>
</div>
</body>
</html>