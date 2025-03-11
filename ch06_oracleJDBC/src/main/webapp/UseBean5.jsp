<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch06_oracleJDBC.* , java.util.* " %>
<jsp:useBean id="bean2" class="ch06_oracleJDBC.UseBeanDB5" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>bean사용 oracle연동 (연습)</h1>
	<table border="1">
		<tr>
			<th>잡코드</th>
			<th>잡이름</th>
		</tr>
		<%
		ArrayList<Bean2> alist = bean2.getList();
			for(int i=0; i<alist.size(); i++) {
				Bean2 bean = alist.get(i);
		%>
		<tr>
			<td><%=bean.getJob_code() %></td>
			<td><%=bean.getJob_name() %></td>
		</tr>
		
		<% 
			}
		%>
	</table>

</body>
</html>