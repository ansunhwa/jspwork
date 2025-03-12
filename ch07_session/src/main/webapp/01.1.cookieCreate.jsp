<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 쿠키의 값에 띄어쓰기, 특수기호 안됨
	Cookie cookie = new Cookie("myCookie", "Apple");  /* 쿠키이름 / 값 */
	cookie.setMaxAge(60);   /* 쿠키가 유지되는 시간 */
	cookie.setValue("banana");  /* 값 새로 넣기 */
	response.addCookie(cookie);/* 값지정X, 생성 후 바로 담아서 보냄 */	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Cookie 사용하여 연결 유지</h2>
	쿠키를 만듭니다<p/>
	쿠키 내용은 <a href="01.2.testCookie.jsp">클릭하세요</a>
	<!-- 아무 설정도 넣지 않을꺼라면 여기서 넘김 -->
	

</body>
</html>