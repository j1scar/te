<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c"  uri = "http://java.sun.com/jsp/jstl/core" %>
<%--
<% 	
	if(session != null) {	
		String id = (String)session.getAttribute("id");
		if(id != null && !id.equals("")) {
%>
			 <li><a href = "/Member/Logout">(로그아웃)</a></li>
			<li><a href = "/Member/info">My Page</a></li>
			<button type ="button" class = "btn btn-secondary" data-toggle="modal" data-target="#"><span class = "glyphicon glyphicon-user" aria-hidden="true"></span></button>
<%
			if( id.equals("admin@mfe.com")) {
%>
			<button type ="button" class = "btn btn-secondary" data-toggle="modal" data-target="#"><span class = "glyphicon glyphicon-cog" aria-hidden="true"></span></button>
		 <li><a href = "/Member/allUserInfo">모든 회원 정보</a></li>
<%				
			}
		} else {
%>				
			<button type ="button" class = "btn btn-secondary" data-toggle="modal" data-target="#login_Modal"><span class = "glyphicon glyphicon-user" aria-hidden="true"></span></button>
		
<%
		}
	} else {
		response.sendRedirect("main.net");
	}
%>	
 --%>
<c:if test="${!empty id}">
	<c:choose>
		<c:when test="${id=='admin@mfe.com'}">
			<button type ="button" class = "btn btn-secondary" data-toggle="modal" data-target="#"><span class = "glyphicon glyphicon-cog" aria-hidden="true"></span></button>
			<button type ="button" class = "btn btn-secondary" data-toggle="modal" data-target="#account_Modal"><span class = "glyphicon glyphicon-user" aria-hidden="true"></span></button>
		</c:when>
		<c:otherwise>
			<button type ="button" class = "btn btn-secondary" data-toggle="modal" data-target="#account_Modal"><span class = "glyphicon glyphicon-user" aria-hidden="true"></span></button>
		</c:otherwise>
	</c:choose>
</c:if>
<c:if test="${empty id}">
<button type ="button" class = "btn btn-secondary" data-toggle="modal" data-target="#login_Modal"><span class = "glyphicon glyphicon-user" aria-hidden="true"></span></button>
</c:if>


