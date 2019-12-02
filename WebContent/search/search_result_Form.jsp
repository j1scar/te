<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Search Result</title>

</head>

<body class="subpage">
	<!-- Header -->
	<jsp:include page="../mainActivity/navbar.jsp"/>
	

	<!-- Div -->
	<div style="text-align: center; padding: 30px">
		<header style="font-size: 30px; padding: 10px">
			<strong>${search_word }</strong>의 검색 결과입니다
		</header>
	</div>

	<!-- 검색 필터 -->
	<!-- null일 경우 아무것도 안나타나게 해야함 -->
	<div style="text-align: center; padding: 30px;">
		<div class="search_filter">
			올림픽공원 올림픽홀
			<button id="search_btn"
				style="width: 30px; height: 30px; padding: 0px">
				<img src="images/pic01.jpg" width=30px height=30px>
			</button>
		</div>
	</div>


	<!-- 검색 결과 -->
	<div id="main">
		<div class="inner">
			<div class="thumbnails">
			
			<c:forEach var ="list" items="${list}">
				<div class="box">
					<img src="concert_images/${list.concert_image }" alt="" style="width: 93%; height: 200px;" />
					<div class="inner">
						<input type="hidden" name="concert_id" value="${list.concert_id}">
						<h3>${list.concert_name }</h3>
						<p>${list.concert_musician }</p>
						<table>
							<tr>
								<td>공연 일시</td>
								<td>${list.concert_day }&nbsp;${list.concert_open } - ${list.concert_close }</td>
							</tr>
							<tr>
								<td>공연 장소</td>
								<td>${list.local_id }</td>
							</tr>
							<tr>
								<td>공연 가격</td>
								<td>${list.concert_price }</td>
							</tr>
							<tr>
								<td>장르</td>
								<td>${list.genre_id }</td>
							</tr>
						</table>
						<a href="#" class="button fit" data-poptrox="youtube,800x400">상세보기</a>
					</div>
				</div>
			</c:forEach>
				


			</div>
		</div>
	</div>

</body>
</html>