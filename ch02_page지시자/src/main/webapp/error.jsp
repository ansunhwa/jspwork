<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
                  <!-- (03)에서 오류가 났을때 보여주는 페이지 이다 를 알려줘야 함 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>다음과 같은 예외가 발생되었습니다</p>
	에러타입 : <%=exception.getClass().getName() %> </P>
	에러메세지 : <%=exception.getMessage() %>

</body>
</html>