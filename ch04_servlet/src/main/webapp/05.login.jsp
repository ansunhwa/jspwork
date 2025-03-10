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
	String id = (String)session.getAttribute("idKey");
	if(id !=null) {  //null이 아니면 실행문 보여주고
%>
	<%=id %>님 반갑습니다 <p/>
	<a href="05.logout.jsp">로그아웃</a>

<% 		
	} else {  //null이면 form을 보여주고
%>
	<form action="LoginServlet" method="post">
		ID : <input name="id">
		PW : <input type="password" name="pwd">
		<input type="submit" value="전송">
	</form>
	
<%   }   %>
	
	

</body>
</html>