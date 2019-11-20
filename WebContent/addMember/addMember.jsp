<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class ="container">
<form name = "joinform">
	<div class = "form-group">
	<label for = "id"><b>아이디</b></label>
	<input type="text" id = "id" name = "id" placeholder="Enter id" required maxLength="12">
	<span id="message"></span>
	</div>
	<div class = "form-group">
	<label for = "pass"><b>비밀번호</b></label>
	<input type="text" id = "pass" name = "pass" placeholder="Enter password" required>
	</div>
	<div class = "form-group">
	<label for = "name"><b>이름</b></label>
	<input type="text" id = "name" name = "name" placeholder="Enter name" required maxLength="15">
	</div>
	<div class = "form-group">
	<label for = "age"><b>나이</b></label>
	<input type="text" id = "age" name = "age" placeholder="Enter age" required maxLength="2">
	</div>
	
	<div class = "form-group">
		<label><b>성별</b></label>
		<input type="radio" name = "gender" value="남" checked><span>남자</span>
		<input type="radio" name = "gender" value="여" ><span>여자</span>
	</div>
	
	<label for = "email"><b>이메일 주소</b></label>
	<input type="text" id = "email" name = "email" placeholder="Enter email" required>
	<span id ="email_message"></span>
	
	<div class = "clearfix">
		<button type = "submit" class = "submitbtn">회원가입</button>
		<button type = "reset" class = "cancelbtn">다시작성</button>
	</div>
	</form>
	</div>
</body>
</html>