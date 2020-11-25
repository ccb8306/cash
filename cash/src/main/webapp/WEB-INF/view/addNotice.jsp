<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addNotice</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/resources/cash.css" rel="stylesheet" type="text/css" />
</head>
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
		
		// 공지사항 작성 버튼
		$('#addNoticeBtn').click(function(){
			// 제목, 내용 유효성 검사
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
			
			// 정상적일 때 submit
			$('#addNoticeForm').submit();
		})
	})
</script>
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
	<!-- 공지사항 추가 폼 -->
	<div class="pastel-cloud-300"><h3>공지사항 작성</h3></div>
	<form id="addNoticeForm" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/admin/addNotice">
		<table class="table">
			<tr>
				<th>제목</th>
				<td><input type="text" id="noticeTitle" name="noticeTitle" class="form-control"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea class="form-control btn-block w100p" name="noticeContent" id="noticeContent" rows="12" cols="100"></textarea></td>
			</tr>
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
		<button class="btn btn-outline-primary" type="button" id="addNoticeBtn">작성</button>
	</form>
</div>
</body>
</html>