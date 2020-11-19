<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){		
		$('#categoryRevenue').click(function(){
			if($('#statsOption').val() == 'statsYear'){
				$(location).attr('href', '${pageContext.request.contextPath}/admin/yearCategoryRevenue.jsp?stats=year')
			}else if($('#statsOption').val() == 'statsMonth'){
				$(location).attr('href', '${pageContext.request.contextPath}/admin/monthCategoryRevenue.jsp?stats=month')
			}
		})

		$('#categoryExpenditure').click(function(){	
			if($('#statsOption').val() == 'statsYear'){
				$(location).attr('href', '${pageContext.request.contextPath}/admin/yearCategoryExpenditure.jsp?stats=year')
			}else if($('#statsOption').val() == 'statsMonth'){
				$(location).attr('href', '${pageContext.request.contextPath}/admin/monthCategoryExpenditure.jsp?stats=month')
			}
		})
	
		$('#minMaxRevenue').click(function(){
			if($('#statsOption').val() == 'statsYear'){
				$(location).attr('href', '${pageContext.request.contextPath}/admin/yearMinMaxRevenue.jsp?stats=year')
			}else if($('#statsOption').val() == 'statsMonth'){
				$(location).attr('href', '${pageContext.request.contextPath}/admin/monthMinMaxRevenue.jsp?stats=month')
			}
		})
		
		$('#minMaxExpenditure').click(function(){
			if($('#statsOption').val() == 'statsYear'){
				$(location).attr('href', '${pageContext.request.contextPath}/admin/yearMinMaxExpenditure.jsp?stats=year')
			}else if($('#statsOption').val() == 'statsMonth'){
				$(location).attr('href', '${pageContext.request.contextPath}/admin/monthMinMaxExpenditure.jsp?stats=month')
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
				$(location).attr('href', '${pageContext.request.contextPath}/admin/monthTotalExpenditure.jsp?stats=month')
			}
		})
		
		$('#totalProfit').click(function(){
			if($('#statsOption').val() == 'statsYear'){
				$(location).attr('href', '${pageContext.request.contextPath}/admin/yearTotalProfit.jsp?stats=year')
			}else if($('#statsOption').val() == 'statsMonth'){
				$(location).attr('href', '${pageContext.request.contextPath}/admin/monthTotalProfit.jsp?stats=month')
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
</div><br>
<div>
	<ul class="nav nav-tabs">
  		<li class="nav-item"><a id="categoryRevenue" class="nav-link">카테고리별 수입</a></li>
  		<li class="nav-item"><a id="categoryExpenditure" class="nav-link">카테고리별 지출</a></li>
  		<li class="nav-item"><a id="minMaxRevenue" class="nav-link">최소 최대 수입</a></li>
  		<li class="nav-item"><a id="minMaxExpenditure" class="nav-link">최소 최대 지출</a></li>
  		<li class="nav-item"><a id="totalRevenue" class="nav-link">총 수입</a></li>
  		<li class="nav-item"><a id="totalExpenditure" class="nav-link">총 지출</a></li>
  		<li class="nav-item"><a id="totalProfit" class="nav-link">총 수익</a></li>
	</ul>
</div>