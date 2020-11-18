<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){		
		$('#avgRevenue').click(function(){
			if($('#statsOption').val() == 'statsYear'){
				$(location).attr('href', '${pageContext.request.contextPath}/admin/yearAvgRevenue.jsp?stats=year')
			}else if($('#statsOption').val() == 'statsMonth'){
				$(location).attr('href', '${pageContext.request.contextPath}/admin/monthAvgRevenue.jsp?stats=month')
			}
		})

		$('#avgExpenditure').click(function(){
			if($('#statsOption').val() == 'statsYear'){
				$(location).attr('href', '${pageContext.request.contextPath}/admin/yearAvgExpenditure.jsp?stats=year')
			}else if($('#statsOption').val() == 'statsMonth'){
				$(location).attr('href', '${pageContext.request.contextPath}/admin/monthAvgExpenditure.jsp?stats=month')
			}
		})
	
		$('#avgProfit').click(function(){
			if($('#statsOption').val() == 'statsYear'){
				$(location).attr('href', '${pageContext.request.contextPath}/admin/yearAvgProfit.jsp?stats=year')
			}else if($('#statsOption').val() == 'statsMonth'){
				$(location).attr('href', '${pageContext.request.contextPath}/admin/monthAvgProfit.jsp?stats=month')
			}
		})
		
		$('#totalRevenue').click(function(){
			if($('#statsOption').val() == 'statsYear'){
				$(location).attr('href', '${pageContext.request.contextPath}/admin/yearTotalRevenue.jsp?stats=year')
			}else if($('#statsOption').val() == 'statsMonth'){
				$(location).attr('href', '${pageContext.request.contextPath}/admin/monthTotalRevenue.jsp?stats=month')
			}
		})
		
		$('#totalExpenditure').click(function(){
			if($('#statsOption').val() == 'statsYear'){
				$(location).attr('href', '${pageContext.request.contextPath}/admin/yearTotalExpenditure.jsp?stats=year')
			}else if($('#statsOption').val() == 'statsMonth'){
			}
		})
		
		$('#totalProfit').click(function(){
			if($('#statsOption').val() == 'statsYear'){
				$(location).attr('href', '${pageContext.request.contextPath}/admin/yearTotalProfit.jsp?stats=year')
			}else if($('#statsOption').val() == 'statsMonth'){
			}
		})

	})
</script>
<div>
	<select class="btn btn-outline-warning" id="statsOption">
			<c:if test="${param.stats == 'year'}">
				<option id="statsYear" value="statsYear" selected="selected">연도별</option>
				<option id="statsMonth" value="statsMonth">월별</option>
			</c:if>
			<c:if test="${param.stats == 'month'}">
				<option id="statsYear" value="statsYear">연도별</option>
				<option id="statsMonth" value="statsMonth" selected="selected">월별</option>
			</c:if>
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