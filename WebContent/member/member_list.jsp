<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix ="c"  uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page ="../mainActivity/navbar.jsp"/>
<title>회원 목록</title>
<style>
	.center-block {
		display : flex;
		justify-content:center; /* 가운데 정렬 */
	}
	.table {
		background-color : white !important;
	}
	th, td {
		color : black !important;
	}
	li .current {
		background: #bfbebe !important;
	}
	.search_member {
		margin-top : 5%;
		margin-left : 20%;
	}
	.size {
		width : 100%;
	}
	#viewcount {
		float : left;
		width : 15%;
		height : 40px;
	}
	#search_word {
		float : left;
		width : 40%;
		height : 40px;
		margin-left : 1%;
		
	}
	#search_btn {
		float : left;
		width : 15%;
		height : 40px;
		margin-left : 1%;
		
	}
	table caption{
		caption-side:top;
		text-align:center;  
		font-size : 30pt;
		font-weight:bold;
		color : white;
	}
</style>
<script>
$(function() {
	$(".del").click(function(event) {
		var answer = confirm("정말 삭제하시겠습니까?");
		if(!answer) {
			event.preventDefault();
		}
	});
	
	var sel = "${search_field}";
	$("#viewcount").val(sel).prop("selected", true);
	
	$('#search_btn').click(function() {
		if($("#search_word").val() == '') {
			alert("검색어를 입력하세요");
			return false;
		}
	});
	$("#viewcount").change(function() {
		selectedValue = $(this).val();
		$("#search_word").val('');
		if(selectedValue=='3') {
			$("#search_word").attr("placeholder", "여 또는 남을 입력하세요");
		}
	});
});

/*
function delchk() {
	if(confirm("삭제하시겠습니까?")) {
		location.href = "member_delete.net";
		return true;
	} else {
		return false;
	}
}
*/
</script>
</head>
<body>
<body>

<div class = "container"></div>
<form class = "search_member" action = "member_list.net">
	<div class = "input-group size select-wrapper">
		
		<select id = "viewcount" name = "search_field">
			<option value = "0" selected>아이디</option>
			<option value = "1">이름</option>
			<option value = "2">주소</option>
			<option value = "3">성별</option>
			
		</select>
		<input id = "search_word" name = "search_word" type="text" class = "form-control"
				placeholder = "Search" value="${search_word}">
		<button id = "search_btn" class= "btn btn-primary small" type="submit">검색</button>
	</div>
</form>


<%-- 회원이 있는 경우 --%>
<c:if test ="${listcount > 0 }">
	<table class = "table">
		<caption>회원 목록</caption>
		<tr>
			<th colspan = "2">MVC 회원 목록 - list</th>
			<th colspan = "1">
				<font size=3>회원 수 : ${listcount } (관리자포함)</font>
			</th>
		</tr>
		<tr>
			<th width = "10%"><div>번호</div></th>
			<th width = "40%"><div>아이디</div></th>
			<th width = "30%"><div>이름</div></th>
			<th width = "20%"><div>삭제</div></th>
		</tr>
	<c:set var ="num" value = "${listcount-(page-1)*3}"/>  <%-- listAction에 limit 변경시 곱하는 값도 같이 변경해야함 --%>
	<c:forEach var ="m" items="${totallist}">
		<tr>
			<td>
			<c:out value="${num }"/><%-- num 출력 --%>
			<c:set var = "num" value ="${num-1}"/> <%-- num = num-1 의미함 --%>
			</td>
			<td>
				<div>
					 <a href="member_info.net?id=${m.id }">
					 	${m.id}
					 </a>
				</div>
			</td>
			<td>
				<div>${m.name}</div>
			</td>
			<td>
				<c:if test="${m.id != 'admin@mfe.com'}">
					<a href="member_delete.net?id=${m.id}">삭제</a>
					<%-- onclick = "delchk(); 붙여도 가능 --%>
				</c:if>
			</td>
		</tr>
	</c:forEach>
	</table>
	
	<div class="center-block">
         <div class="row">
            <div class="col">
               <ul class="pagination">
                  <c:if test="${page <= 1 }">
                     <li class="page-item">
                     <a class="page-link" href="#">이전&nbsp;</a>
                     </li>
                  </c:if>
                  <c:if test="${page > 1 }">
                     <li class="page-item">
                     <a href="member_list.net?page=${page-1}&search_field=${search_field}&search_word=${search_word}"
                        class="page-link">이전</a>&nbsp;
                     </li>
                  </c:if>
                  
                  <c:forEach var="a" begin="${startpage }" end="${endpage }">
                     <c:if test="${a == page }">
                        <li class="page-item">
                           <a class="page-link current" href="#">${a }</a>
                        </li>
                     </c:if>
                     <c:if test="${a != page }">
                        <li class="page-item">
                           <a href="member_list.net?page=${a }&search_field=${search_field}&search_word=${search_word}"
                              class="page-link">${a }</a>
                        </li>
                     </c:if>
                  </c:forEach>
                  
                  <c:if test="${page >= maxpage }">
                     <li class="page-item">
                        <a class="page-link" href="#">&nbsp;다음</a>
                     </li>
                  </c:if>
                  <c:if test="${page < maxpage }">
                     <li class="page-item">
                        <a href="member_list.net?page=${page+1}&search_field=${search_field}&search_word=${search_word}"
                           class="page-link">&nbsp;다음</a>
                     </li>
                  </c:if>
               </ul>
            </div>
         </div>
      </div> 
</c:if>
<!--  회원이 없는 경우 -->
<c:if test ="${listcount == 0 }">
	<font size =5>등록된 회원이 없습니다.</font>
</c:if><br>
</body>
</html>