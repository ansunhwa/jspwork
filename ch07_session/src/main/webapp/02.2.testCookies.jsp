<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% Cookie[] cookies = request.getCookies(); %>
<%!
	public String getCookieValue(Cookie[] cookies, String name) {  //메소드 만들기
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals(name))            //쿠키의 이름이 사용자가 넣은 이름과 같으면 쿠키값 반환
				return cookies[i].getValue();
		}
		return null;            //이름이 비어있거나 같지 않으면 null반환
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름 : <%=getCookieValue(cookies, "NAME") %><p/>
	성별 : <%=getCookieValue(cookies, "GENDER") %><p/>
	나이 : <%=getCookieValue(cookies, "AGE") %><p/>
<%--
 <%
	Cookie[] cookies = request.getCookies();   /* 쿠키가져올땐 변수에 담아서 */ 
	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			out.print("Cookie name : " + cookies[i].getName() + "<p/>");
			out.print("Cookie value : " + cookies[i].getValue() + "<p/>");
		}
	}
%>
 --%>

</body>
</html>