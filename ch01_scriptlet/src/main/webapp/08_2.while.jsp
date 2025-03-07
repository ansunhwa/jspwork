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
		String msg = request.getParameter("msg");
		int count = Integer.parseInt(request.getParameter("count"));   //getparameter->String만 가능
		
		
		int c = 0;
		/*
		while(c < count) {
			out.print(msg + "<br>");
			c++;
		} 
		*/
		
		while(c < count) {
	%>
		<%=msg %> <br>
	<% 		
			c++;
		}
	%>
</body>
</html>