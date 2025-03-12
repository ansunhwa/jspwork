<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="loginPro" class="ch07.LoginDB" />
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(loginPro.loginMethod(id, pw)) {  //변수넣어줌  //로그인이 잘 되면 쿠키생성
		Cookie cookie = new Cookie("idkey", id);
		response.addCookie(cookie);
%>
	<script type="text/javascript">
		alert("로그인 되었습니다");
		location.href = "04.3.cookieLoginOK.jsp";
	</script>


<% 
	} else {
%>
	<script type="text/javascript">
		alert("로그인안됨");
		location.gref = "04.1.cookielogin.jsp";
	</script>

<% 		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>