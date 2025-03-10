<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="5kb" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Out객체</title>
</head>
<body>
	<h1>Out 객체</h1>
	<%
		int totalBuffer = out.getBufferSize();
		int remaining = out.getRemaining();
		int useBuffer = totalBuffer - remaining;
	%>
	현재 페이지의 Buffer 상태 <p/>
	총 Buffer 크기 : <%=totalBuffer %>byte<p/>
	<!-- 기본은 8kb 지금은 5kb로 설정한 상태-->
	남은 Buffer 크기 : <%=remaining%> <p/>
	현재 사용한 Buffer 크기 : <%=useBuffer %>  
	<!-- out.jsp 전체의 총 사용량 -->
	
	
	
	
</body>
</html>