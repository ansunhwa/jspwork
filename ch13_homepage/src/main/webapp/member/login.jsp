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
</head>
<body>
<%-- <% if(id != null) { %>
	<b><%=id %>님 환영합니다</b>
	<a href="logout.jsp">로그아웃</a> &emsp;
	<a href="../index.jsp">홈으로</a>
<%} else { %>
<!-- 로그인폼 -->
<form action="loginProc.jsp" method="post">
	<table border="1" align="center">
		<tr>
			<td align="center" colspan="2"><h4>로그인</h4></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input name="id"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input name="pwd"></td>
		</tr>
		<td colspan="2">
		<input type="submit" value="로그인">
		<input type="button" value="회원가입" onclick="location.href='member.jsp'">
		<input type="button" onclick="location.href='../index.jsp'" value="홈으로">
	</table>
</form>
<%} %> --%>

 <c:choose>
 	<c:when test="${!empty idKey }">
 		<b><%=id %>님 환영합니다</b>
		<a href="logout.jsp">로그아웃</a> &emsp;
		<a href="../index.jsp">홈으로</a>
 	</c:when>
 	<c:otherwise>
 		<form action="loginProc.jsp" method="post">
	<table border="1" align="center">
		<tr>
			<td align="center" colspan="2"><h4>로그인</h4></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input name="id"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input name="pwd"></td>
		</tr>
		<td colspan="2">
		<input type="submit" value="로그인">
		<input type="button" value="회원가입" onclick="location.href='member.jsp'">
		<input type="button" onclick="location.href='../index.jsp'" value="홈으로">
	</table>
</form>
 	</c:otherwise>
 
 </c:choose>

</body>
</html>