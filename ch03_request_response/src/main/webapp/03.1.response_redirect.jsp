<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Reponse Ex1</h1>
	<h3>sendFedirect 예제입니다</h3>
	<%
		//response.sendRedirect("03.2.response.jsp");
		response.sendRedirect("http://www.naver.com");  
		//뒤로가기 비활성화 됨 - 곧바로 내가 지정한 곳에 가기 때문
	%>

</body>
</html>