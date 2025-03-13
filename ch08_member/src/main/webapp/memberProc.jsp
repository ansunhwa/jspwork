<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:useBean id="mDao" class="ch08.MemberDao" />   <!-- 데이터베이스 넘겨줄 거-->
 <jsp:useBean id="mBean" class="ch08.Member" />    <!-- 데이터받을 거 -->
 <jsp:setProperty name="mBean" property="*" />
 <%
 	boolean result = mDao.insertMember(mBean);
 	String msg ="회원가입에 실패하였습니다";      //회원가입실패하면 다시 가입창으로 가게
 	String url = "member.jsp";
 	
 	if(result) {
 		msg = "축하합니다. 회원가입이 되었습니다";   //회원가입이 되었으면 로그인할 수있게
 		url = "login.jsp";
 	}
 %>
 <script>
 	alert("<%=msg %>");
 	location.href = "<%=url%>";
 </script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	파일

</body>
</html>