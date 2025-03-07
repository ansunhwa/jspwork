<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		int one;
		int two = 2;
		
		int plusMethod(int one, int two) {
			return one+two;
		}
		String msg;
	%>
	<!-- 여기는 html부분 -->
	one과 two의 합은 ? <%=plusMethod(3,5) %> <br>
	String msg의 값은 ? <%=msg %> <br>
	one의 값은 ? <%=one %>

</body>
</html>