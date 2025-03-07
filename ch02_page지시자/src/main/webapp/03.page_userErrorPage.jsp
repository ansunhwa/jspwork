<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage = "error.jsp" %>
                          <!-- 에러가 나면 이 페이지를 보여주세요 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int one = 1, zero = 0;
	%>
	<h1>Directiv Ex</h1>
	<p>one과 zero의 사칙연산</p>
	one + zero = <%=one + zero %></p>
	one - zero = <%=one - zero %></p>
	one * zero = <%=one * zero %></p>
	one / zero = <%=one / zero %></p>  
	<!-- 500오류 내부오류 zero로 (0)으로 나눌 수 없기 때문에 -->

</body>
</html>