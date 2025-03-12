<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<% 
String id="";
	Cookie[] cookies = request.getCookies();
	for(int i=0; i<cookies.length; i++) {
		if(cookies[i].getName().equals("idkey")) {
			id = cookies[i].getValue();   //로그인이 되야 쿠키 안에 들어갈 수 있음
		}
	}
	
	if(!id.equals("")) {  // 로그인 된 사람이면(비어있지 않으면)
%>
	<script>
		alert("로그인 되어 있습니다");
		location.href="04.3.cookieLoginOK.jsp";
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
<form action="04.2.cookieLoginProc.jsp" method="post">
	<table border="1" align="center">
		<tr>
			<td colspan="2"><h2>Cookie Login</h2></td>
		</tr>
		<tr>
			<td align="center" >ID</td>
			<td><input name="id" required></td>
		</tr>
		<tr>
			<td align="center" >PW</td>
			<td><input name="pw" required></td>
		</tr>
			<td colspan="2" align="center">
				<input type="submit" value="login"> &emsp;
				<input type="reset">
	
	</table>

</form>
</body>
</html>