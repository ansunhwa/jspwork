<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
/*  	Cookie cookie = new Cookie("","");
 	response.addCookie(cookie); */
 	
 	response.addCookie(new Cookie("NAME","박나나"));  /* 한줄로 */
 	response.addCookie(new Cookie("GENDER","Male"));
 	response.addCookie(new Cookie("AGE","24"));  /* 숫자도 쌍따옴표 */
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<H2>쿠키 여러개 생성</H2>
	쿠키내용은 <a href="02.2.testCookies.jsp">클릭하세요</a>
</body>
</html>