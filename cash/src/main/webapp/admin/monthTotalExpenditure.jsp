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
		let chartData = {
			type: 'line', 
	        data: {
	           labels:[],
	           datasets:[{
	              label:'월별 총 지출',
				  fill: false,
				  pointRadius: 15,
				  pointHoverRadius: 20,
				  showLine: false,
	              backgroundColor: [],
	              borderColor: [],
	                 data:[],
	                 borderWidth: 1
	           }]
	        },
			options: {
				responsive: true,
				title: {
					display: true,
					text: '월별 총 지출'
				},
				legend: {
					display: false
				},
				elements: {
					point: {	
						pointStyle: 'rectRot'
					}
				}
			}
		};
		
		$.ajax({
			url:'${pageContext.request.contextPath}/admin/monthTotalExpenditure/' + $('#yearList option:selected').val(),
			type:'get',
			success:function(data){
				$('#chartParent').empty();
				$('#chartParent').append('<canvas id="chart"></canvas>');
				
				$(data).each(function(key, value) {
					let ranColor1 = Math.floor(Math.random()*256);
					let ranColor2 = Math.floor(Math.random()*256);
					let ranColor3 = Math.floor(Math.random()*256);
					chartData.data.labels.push(value.month+"월");
					chartData.data.datasets[0].data.push(value.expenditure);
					chartData.data.datasets[0].backgroundColor.push("rgba(" + ranColor1 +  ", "+ ranColor2 + ", " + ranColor3 + ", 0.3)");
					chartData.data.datasets[0].borderColor.push("rgb(" + ranColor1 +  ", "+ ranColor2 + ", " + ranColor3 + ")");
					
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
	</div>
	<!-- 차트1 -->
	<div id="chartParent"></div>
	<!-- 테이블 -->
	<div>
	</div>
</div>
</body>
</html>