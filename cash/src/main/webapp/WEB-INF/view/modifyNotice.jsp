<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyNotice</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/resources/cash.css" rel="stylesheet" type="text/css" />
<script>
	$(document).ready(function(){
		// 파일 추가 버튼
		$('#addFileBtn').click(function(){
			// 파일 10개 제한
			if($('#fileInput').children().length >= 10){
				alert('최대 10개만 가능합니다.');
				return;
			}

			let html =`<div><input type="file" name="noticefileList" class="noticefileList"></div>`;
			$('#fileInput').append(html);

		})
		
		// 파일 삭제 버튼
		$('#delFileBtn').click(function(){
			// 마지막 파일을 삭제함
			$('#fileInput').children().last().remove();
		})
		
		$('#modifyNoticeBtn').click(function(){
			if($('#noticeTitle').val().lenth < 1){
				alert('제목을 입력해 주세요.');
				return;
			} else if($('#noticeContent').val().length < 1){
				alert('내용을 입력해 주세요.');
				return;
			}
			
			// 첨부 파일 유효성 검사
			let submitCk = true;
			$('.noticefileList').each(function(index, item){
				// 파일 비어있을시 && submitCk가 true일때(경고창 한번만 출력하기 위함)
				if($(item).val() == '' && submitCk){
					alert('파일이 비어있습니다!');
					submitCk = false;
					return;
				}
			})

			$('#modifyNoticeForm').submit();
		})

		// 파일 한개 삭제 -- 비동기 요청
		$('.removeNoticefileBtn').on('click', function(){
			var fileId = $(this).val();
			$.ajax({
				url: '${pageContext.request.contextPath}/admin/removeNoticefileOne/' + fileId,
				type:'get',
				success: function(){
					$(document).ready(function(){
						$('#' + fileId).remove();
					})
				}
			})
		});
		
	})

</script>
</head>
<body>
<!-- 배경 -->
<div class="container-fluit main-bg">
	<img src="${pageContext.request.contextPath}/resources/image/note.jpg" class="bg-img">
</div>
<!-- 메뉴 -->
<div class="container-fluit menu-bar">
	<jsp:include page="/WEB-INF/view/include/menu.jsp"></jsp:include>
</div>
<!-- 본문 -->
<div class="container-fluit main-content">
	<br>
	<!-- 공지사항 수정 -->
	<div class="pastel-cloud-300"><h3>공지사항 수정</h3></div>
	<form id="modifyNoticeForm" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/admin/modifyNotice">
		<input type="hidden" value="${notice.noticeId}" name="noticeId">
		<table class="table">
			<tr>
				<th>제목</th>
				<td><input class="form-control" type="text" id="noticeTitle" name="noticeTitle" value="${notice.noticeTitle }"></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><input class="form-control" type="readOnly" value="${notice.noticeDate }" name="noticeDate"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea id="noticeContent" name="noticeContent" rows="12" cols="100" class="form-control btn-block w100p">${notice.noticeContent }</textarea></td>
			</tr>
		</table>
		
		<!-- 기존 첨부파일 -->
		<table class="table">
			<thead class="thead-light">
				<tr>
					<th>첨부파일</th>
				</tr>
			</thead>
			<c:forEach var="nf" items="${notice.noticefileList }">
				<c:if test="${!empty nf.noticefileName }">
					<tr id="${nf.noticefileId }">
						<td>
							<a href="${pageContext.request.contextPath}/upload/${nf.noticefileName}">${nf.noticefileName }</a>
							<button type="button" class="removeNoticefileBtn btn btn-outline-danger" value="${nf.noticefileId }">삭제</button>
						</td>
					</tr>
				</c:if>
				<c:if test="${empty nf.noticefileName }">
					<tr><td>첨부파일이 없습니다.</td></tr>
				</c:if>
			</c:forEach>
		</table>
		
		<!-- 새로운 첨부파일 -->
		<table class="table">	
			<tr>
				<th>첨부파일 : </th>
				<td>
					<div>
						<button type="button" id="addFileBtn" class="btn btn-outline-primary">파일추가</button>
						<button type="button" id="delFileBtn" class="btn btn-outline-danger">파일삭제</button>
					</div>
					<div id="fileInput">
					</div>
				</td>
			</tr>
		</table>
		<div class="row" style="float:right">
			<button class="btn btn-outline-success" type="button" name="modifyNoticeBtn" id="modifyNoticeBtn">수정 완료</button>
		</div>
	</form>
</div>
</body>
</html>