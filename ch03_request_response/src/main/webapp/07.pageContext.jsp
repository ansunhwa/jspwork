<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	out.print("<h2>out.print() 메소드를 이용한 출력</h2>");

	pageContext.getOut().print("<h2>pageContext.getout.print() 메소드를 이용한 출력</h2>");
	/* 잘 사용하진 않아요 너무 길기도 하고 */
%>

</body>
</html>