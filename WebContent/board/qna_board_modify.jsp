<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page ="../mainActivity/navbar.jsp"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class = "container">
<form action="BoardModifyAction.bo" method="post" name ="modifyform">
	<input type="hidden" name = "BOARD_NUM" value="${boarddata.BOARD_NUM}">
	<h1> MVC게시판-수정</h1>
	<div class="form-group">
		<label for="board_name">글쓴이</label>
		<input type="text" class="form-control" value="${boarddata.BOARD_NAME}" readOnly>
	</div>
	<div class="form-group">
		<label for="board_subject">제목</label>
		<input type="text" name="BOARD_SUBJECT" id="board_subject" maxlength="100"
			   class="form_control" value="${boarddata.BOARD_SUBJECT}">
	</div>
	<div class="form-group">
		<label for="board_content">내용</label>
		<textarea name = "BOARD_CONTENT" id="board_content"
				  class = "form-control" rows="15">${boarddata.BOARD_CONTENT}</textarea>
	</div>
	
	<!--  파일이 첨부되어 있으면 -->
	<c:if test="${!empty boarddata.BOARD_FILE}">
		<div class="form-group">
			<label for ="board_file">파일 첨부</label>
			<div class="form-control">&nbsp;&nbsp;${boarddata.BOARD_FILE }</div>
		</div>
	</c:if>
	
	<div class = "form-group">
		<label for="board_pass">비밀번호</label>
		<input name = "BOARD_PASS" id = "board_pass" type="password" maxlength="30"
			   class = "form-control" placeholder ="Enter board_pass" value="">
	</div>
	<div class="form-group">
		<button type="submit" class="btn btn-primary">수정</button>
		<button type="reset" class="btn btn-danger" onClick="history.go(-1)">취소</button>
	</div>
</form>
</div>
</body>
</html>