<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mDao" class="member.MemberDao" />
<%
	String id = request.getParameter("id");  /* 사용자입력한 값 가져오기 */
	boolean result = mDao.chickId(id);
	
	if(result) {
		out.print(id + "는 사용할 수 없습니다");
	} else {
		out.print(id+ "사용 할 수 있습니다");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href=""onclick="self.close()">닫기</a>  <!-- 나 자신 창을 닫으세요 / 닫기창을 누르면 닫힘 -->
</body>
</html>