<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	나의 이름은 <%=name %> 입니다<br>
	학년은 <%=grade %>학년 입니다<br>
	
	<%! 
		// 멤버변수 위치와 상관없이 사용 ! 느낌표 붙은거
		String name = "김땡땡";
		int grade = 3;
	%>
	
<%-- 
	<%
		// 오류 지역변수라서 먼저 선언되어야 사용 가능
		String name2 = team + "이학생";
	%> 
--%>
	<%
 		String team ="더조은";
	%>

</body>
</html>