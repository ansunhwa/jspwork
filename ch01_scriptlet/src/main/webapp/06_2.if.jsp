<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
		//여기는 실행값이 넘어오는 곳임(실행X)
		//request.setCharacterEncoding(("UTF-8"); - 한글 깨져서나올 때
		String name = request.getParameter("name1");
		String color = request.getParameter("color");
		if(color.equals("etc")) {
			color="green";
		}

		String kocolor="";
		/*
		switch(color) {
		case "blue" : 
			kocolor = "파란색";
			break;
		case "red" :
			kocolor = "빨간색";
			break;
		case "orange" :
			kocolor = "오렌지색";
			break;
		default : 
			kocolor = "기타";
		}
		*/
		
		if(color.equals("blue"))   //객체기 때문에 equals써야함
			kocolor = "파란색";
		else if(color.equals("red"))
			kocolor = "빨간색";
		else if(color.equals("orange"))
			kocolor = "오렌지색";
		else
			kocolor = "기타";
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="<%=color%>">
	
	<%-- 이름 : <%=name %><br>
	color : <%=color %><br> --%>
	
	<b><%=name %></b> 님이 좋아하는 색상은 <b><%=kocolor %></b> 입니다.

</body>
</html>