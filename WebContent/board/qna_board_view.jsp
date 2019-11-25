<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix ="c"  uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page ="header.jsp"/>
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
span{width:20px;}
</style>
</head>
<body>
<div class="container">
	<table class= "table table-bordered">
		<tr>
			<th colspan="2">MVC 게시판-view페이지</th>
		</tr>
		<tr>
			<td><div>글쓴이</div></td>
			<td><div>${boarddata.BOARD_NAME}</div></td>
		</tr>
		<tr>
			<td><div>제목</div></td>
			<td><div>${boarddata.BOARD_SUBJECT}</div></td>
		</tr>
		<tr>
			<td><div>내용</div></td>
			<td><textarea class = "form-control" rows="5" readOnly style = "width:102%">${boarddata.BOARD_CONTENT}</textarea></td>
		</tr>
		
		<tr>
			<td><div>첨부파일</div></td>
			<td><c:if test="${!empty boarddata.BOARD_FILE}">
				<span class = "glyphicon glyphicon-save" aria-hidden="true"></span><a href="BoardFIleDown.bo?filename=${boarddata.BOARD_FILE}">
						${boarddata.BOARD_FILE}</a></c:if>
			</td>
		</tr>
	
		<tr>
			<td colspan ="2" class="center">
				<a href = "BoardReplyView.bo?num=${boarddata.BOARD_NUM}">
					<button class="btn btn-primary">답변</button>
				</a>
			<c:if test="${boarddata.BOARD_NAME == id || id == 'admin'}">	
				<a href="BoardModifyView.bo?num=${boarddata.BOARD_NUM}">
					<button class = "btn btn-info">수정</button>
				</a>
				
				<a href ="BoardDelete.bo?num=${boarddata.BOARD_NUM}">
					<button class= " btn btn-danger">삭제</button>
				</a>
			</c:if>	
				<a href="BoardList.bo">
					<button class="btn btn-primary">목록</button>
				</a>
			</td>
		</tr>
	</table>
		
</div>
</body>
</html>