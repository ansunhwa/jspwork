<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String season = request.getParameter("season");
 	String fruit = request.getParameter("fruit");
 	
 	String id = (String)session.getAttribute("idKey"); /* object 객체를 String으로 변환 */
 	String sessionId = session.getId();  /* 서버에서 랜덤으로 id 부여 */
 	int intervalTime = session.getMaxInactiveInterval(); /* 몇분 후에 꺼질껀지 */
 	
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% if(id!= null) {   %>
	<h1>Session</h1>
		<%=id %> 님이 좋아하는 계절과 과일은 <%=season %>과 <%=fruit %> 입니다 <p/>
		세션 ID : <%=sessionId %> <p/>
		세션 유지 시간 : <%=intervalTime %> 초 <p/>
		
	<%
		session.invalidate(); //세션 끊어줌
		
	
	} else {
		out.print("세선시간이 경과하였거나 다른이유로 연결 할 수 없습니다");
	}
	%>
	
</body>
</html>