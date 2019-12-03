<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page ="../mainActivity/navbar.jsp"/>
<meta charset="UTF-8">
<title>예매티켓관리</title>
<style>
	h2 {
		text-align : center;
	}
	.container {
		margin : auto;
		margin-top : 3%;
		width : 70%;
		height : 70%;
	}
	caption {
		font-size : 15px;
	}
	.center-block {
	display: flex;
	justify-content: center; /*가운데정렬*/
	}
	font {
		color : white;
	}
</style>
<script>
	$(document).ready(function(){
		$("#delete").click(function(){
			var answer = confirm('정말 취소하시겠습니까?');
			console.log(answer); //취소를 클릭한 경우 - false
			if(!answer){	//취소를 클릭한 경우
				event.preventDefault();
			}
		})
	})
</script>
</head>
<body>
	<div class="container">
		<h2>예매 티켓 관리</h2>
		<!-- 게시글이 있는 경우 -->
		<c:if test="${listcount > 0}">
			<table class="table table-striped">
				<caption>예매내역</caption>
				<thead>
					<tr>
						<th>예매번호</th>
						<th>예매일</th>
						<th>공연명</th>
						<th>관람일시</th>
						<th>매수</th>
						<th>티켓번호</th>
						<th>예매취소</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="num"  value="${listcount-(page-1)*10}" />
					<c:forEach var="b"  items="${booklist}">

					<tr>
						
						<td>
							<c:out value="${num}" />  
							<c:set var="num"  value="${num-1}" /> 
						</td>
						<td>
							<div>${b.book_id}</div>
						</td>
						<td>
							<div>${b.book_date}</div>
						</td>
						<td>
							<div>${b.concert_id}</div>	<!-- 콘서트 제목으로 바꾸기 -->
						</td>
						<td>
							<div>${b.book_date}</div>	<!-- 콘서트 날짜로 바꾸기 -->
						</td>
						<td>
							<div>${b.book_amount}</div>
						</td>
						<td>
							<div>${b.book_eticket}</div>
						</td>
						<td>
							<div><a href="book_delete.bk?book_id=${b.book_id}" id="delete">삭제</a></div>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
		
		<!-- 게시글이 없는 경우 -->
		<c:if test="${listcount == 0}">
		
			<font size=5>예매내역이 없습니다.</font>
		</c:if>
	</div>
	
	<div class="center-block">
		<div class="row">
			<div class="col">
				<ul class="pagination">
					<c:if test="${page<=1}">
						<li class="page-item">
						<a class="page-link"  href="#">이전&nbsp;</a>
						</li>
					</c:if>
					<c:if test="${page > 1}">
						<li class="page-item">
							<a href="BookList.bk?page=${page-1}" class="page-link">이전</a>&nbsp;
						</li>
					</c:if>
					
					<c:forEach var="a" begin="${startpage}" end="${endpage}">
						<c:if test="${a==page}">
							<li class="page-item">
								<a class="page-link" href="#">${a}</a>
							</li>
						</c:if>
						<c:if test="${a != page}">
							<li class="page-item">
								<a href="BookList.bk?page=${a }" class="page-link">${a}</a>
							</li>
						</c:if>
					</c:forEach>
					
					<c:if test="${page>=maxpage}">
						<li class="page-item">
							<a class="page-link" href="#">&nbsp;다음</a>
						</li>
					</c:if>
					<c:if test="${page<maxpage}">
						<li class="page-item">
							<a href="BookList.bk?page=${page+1}"  class="page-link">&nbsp;다음</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	
</body>
</html>