<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String id = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="resources/js/ani_user.js"></script>
<link href="resources/css/style.css" rel="stylesheet">
</head>
<body>
	<header>
		<div class="logo">
			<img src="resources/img/logo.png" alt="로고">
		</div>
		<nav>
			<ul class="nav">
				<li><a href="">소개</a></li>
				<li><a href="vote/voteList.jsp">투표 프로그램</a></li>
				<%-- <% if(id == null) {%>                             <!-- id 가 null과 같으면 로그인 -->
				<li><a href="member/login.jsp">로그인</a></li>
				<%} else {%>                                    <!-- id 가 null과 같지않으면 로그아웃 -->
				<li><a href="member/logout.jsp">로그아웃</a></li>
				<%} %> --%>
		
	<c:choose>
		<c:when test="${ empty idkey }">
			<li><a href="member/login.jsp">로그인</a></li>
		</c:when>
		<c:otherwise>
			<li><a href="member/logout.jsp">로그아웃</a></li>
		</c:otherwise>
	</c:choose>	
		
		
		
		
		
		
<%-- 		<div float: right;>             <!-- 수정해보자 -->
			<% if(id != null) { %>
			<p>[ <%=id %>님 로그인 상태]</p>
			<%} %>
		</div> --%>
		
		<c:if test="${ not empty idkey}">			
				<p>[${idKey}님 로그인 상태]</p>	
		</c:if>
	
			</ul>
		</nav>

	</header>
	 <article id="content">
    <section id="imgslide">
            <img src="resources/img/slide1.jpg" alt="여행사진1">
            <img src="resources/img/slide2.jpg" alt="여행사진2">
            <img src="resources/img/slide3.jpg" alt="여행사진3">
    </section>
	</article>

</body>
</html>