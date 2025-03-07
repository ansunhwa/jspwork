<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String siteName = request.getParameter("siteName");   
 	String siteTel = request.getParameter("siteTel");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="06_3.action_includeTag6.jsp">
		<jsp:param value="jsp 수업중" name="siteName"/>
		<jsp:param value="02-123-4567" name="siteTel"/>
	</jsp:include>
	<p/>
	
	include ActioTeg의 Body 입니다<br>
	<%=siteName %> <br>
	<%=siteTel %>
</body>
</html>