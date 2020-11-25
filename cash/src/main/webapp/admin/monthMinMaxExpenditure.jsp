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
			let chartData = {
					type: 'line', 
			        data: {
			           labels:[],
			           datasets:[{
			              label:'월별 최소 지출',
			              backgroundColor: [],
			              borderColor: [],
			              data:[],
						  fill: 8
			           },{
			              label:'월별 최대 지출',
			              backgroundColor: [],
			              borderColor: [],
			              data:[],
						  fill: '+2'
				       }]
			        },
		        	options: {
		    			maintainAspectRatio: false,
		    			spanGaps: false,
		    			elements: {
		    				line: {
		    					tension: 0.000001
		    				}
		    			},
		    			scales: {
		    				yAxes: [{
		    					stacked: true
		    				}]
		    			},
		    			plugins: {
		    				filler: {
		    					propagate: false
		    				},
		    				'samples-filler-analyser': {
		    					target: 'chart-analyser'
		    				}
		    			}
					}
				};
				
				$.ajax({
					url:'${pageContext.request.contextPath}/admin/monthMinMaxExpenditure/' + $('#yearList option:selected').val(),
					type:'get',
					success:function(data){	
						$('#chartParent').empty();
						$('#chartParent').append('<canvas id="chart"></canvas>');
								
						console.log(data);
						let ranColor1 = Math.floor(Math.random()*256);
						let ranColor2 = Math.floor(Math.random()*256);
						let ranColor3 = Math.floor(Math.random()*256);
						let ranColor11 = Math.floor(Math.random()*256);
						let ranColor22 = Math.floor(Math.random()*256);
						let ranColor33 = Math.floor(Math.random()*256);
						
						$(data).each(function(key, value) {
							chartData.data.labels.push(value.month + '월');
							chartData.data.datasets[0].data.push(value.min);
							chartData.data.datasets[0].backgroundColor.push("rgba(" + ranColor1 +  ", "+ ranColor2 + ", " + ranColor3 + ", 0.8)");	
							chartData.data.datasets[0].borderColor.push("rgba(" + ranColor1 +  ", "+ ranColor2 + ", " + ranColor3 + ", 0.8)");
							chartData.data.datasets[1].data.push(value.max);
							chartData.data.datasets[1].backgroundColor.push("rgba(" + ranColor11 +  ", "+ ranColor22 + ", " + ranColor33 + ", 0.8)");
							chartData.data.datasets[1].borderColor.push("rgba(" + ranColor11 +  ", "+ ranColor22 + ", " + ranColor33 + ", 0.8)");

						});

						var ctx = document.getElementById('chart').getContext('2d');
						var chart = new Chart(ctx, chartData);
					}
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
	<div id="chartParent" style="height:600px"></div>
</div>
</body>
</html>