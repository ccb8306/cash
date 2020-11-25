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
		})
		
		
		$('#categoryList').change(function(){
			let chartData = {
				type: 'horizontalBar', 
		        data: {
		           labels:[],
		           datasets:[{
		              label:'연도별 - 카테고리별 지출',
		              backgroundColor: [],
		              borderColor: 'rgba(255, 255, 255, 0.5)',
		                 data:[],
		                 borderWidth: 1
		           }]
		        }
			};
			
			$.ajax({
				url:'${pageContext.request.contextPath}/admin/yearCategoryExpenditure/' + $('#categoryList option:selected').val(),
				type:'get',
				success:function(data){
					$('#chartParent').empty();
					$('#chartParent').append('<canvas id="chart"></canvas>');
					
					console.log(data);
					let ranColor1 = Math.floor(Math.random()*256);
					let ranColor2 = Math.floor(Math.random()*256);
					let ranColor3 = Math.floor(Math.random()*256);
					
					$(data).each(function(key, value) {
						chartData.data.labels.push(value.year);
						chartData.data.datasets[0].data.push(value.expenditure);
						chartData.data.datasets[0].backgroundColor.push("rgba(" + ranColor1 +  ", "+ ranColor2 + ", " + ranColor3 + ", 0.4)");
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
	
	<!-- 카테고리 선택 -->
	<div id="selectYear">
		<br>
		<select class="btn btn-outline-warning" id="categoryList" name="categoryList">
		</select>
	</div>
	
	<!-- 차트1 -->
	<div id="chartParent"></div>
</div>
</body>
</html>