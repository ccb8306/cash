<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#avgRevenue').click(function(){
			if($('#statsOption').val() == '월별'){
				$(location).attr('href', '/admin/monthlyAvgIncoming.jsp')
			}
		})
	})
</script>
<div>
	<select id="statsOption">
		<option>월별</option>
		<option>연도별</option>
	</select>
</div>
<div>
	<ul class="nav nav-tabs">
  		<li class="nav-item"><a id="avgRevenue" class="nav-link">평균 수입</a></li>
  		<li class="nav-item"><a id="avgExpenditure" class="nav-link">평균 지출</a></li>
  		<li class="nav-item"><a id="avgProfit" class="nav-link">평균 수익</a></li>
  		<li class="nav-item"><a id="totalRevenue" class="nav-link">총 수입</a></li>
  		<li class="nav-item"><a id="totalExpenditure" class="nav-link">총 지출</a></li>
  		<li class="nav-item"><a id="totalProfit" class="nav-link">총 수익</a></li>
	</ul>
</div>