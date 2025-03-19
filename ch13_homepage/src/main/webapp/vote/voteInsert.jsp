<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문작성</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
	* {margin: 0 auto;}
	div {width: 800px;}
	h2 {text-align: center;}
	h5 {text-align: center;}
	.m30 {margin-top : 30px;}
</style>
</head>
<body>
<!-- 설문작성하기 -->
	<div>
		<h2 class="m30">투표 프로그램</h2>
		<hr>
		
		<h5 class="m30" >설문 작성</h5>
		<hr>
		<form action="voteInsertProc.jsp" method="post">
			<table class="table">
				<tr>
					<td>질문</td>
					<td colspan="2">Q:<input name="question"></td>  <!-- voteList의 question에들어감 -->
					<td></td>
				</tr>
				<tr>
					<td rowspan="6">항목</td>
					<%
					for(int i=1; i<=4; i++) {
						out.print("<td>" + (i*2-1) + ": <input name='item'></td>");  // 돌때마다 숫자가 바뀜 1,3,5,7
						out.print("<td>" + (i*2) + ": <input name='item'></td>");  //                 2,4,6,8
						out.print("</tr>");
						if(i<4) {
							out.print("<tr>");  //4보다 작으면 tr 넣지 마세요
						}				
					}
					%>
					<tr>
					<td>시작일</td>
					<td>
						<select name="sdateY">  <!-- 데이터베이스에 없는 이름은 값이 들어가지 않음 -->
						<%
						for(int i=2025; i<=2035; i++) {
							out.print("<option value='" + i + "'>" + i + "</option>");
						}
						%>						
						</select>년
						
						<select name="sdateM">
						<%
						for(int i=1; i<=12; i++) {
							out.print("<option value='" + i + "'>" + i + "</option>");
						}
						%>
						</select>월
						
						<select name="sdateD">
						<%
						for(int i=1; i<=31; i++) {
							out.print("<option value='" + i + "'>" + i + "</option>");
						}
						%>
						</select> 일
					</td>
					</tr>
					<tr>
					<td>종료일</td>
					<td>
						<select name="edateY">  <!-- 데이터베이스에 없는 이름은 값이 들어가지 않음 -->
						<%
						for(int i=2025; i<=2035; i++) {
							out.print("<option value='" + i + "'>" + i + "</option>");
						}
						%>						
						</select>년
						
						<select name="edateM">
						<%
						for(int i=1; i<=12; i++) {
							out.print("<option value='" + i + "'>" + i + "</option>");
						}
						%>
						</select>월
						
						<select name="edateD">
						<%
						for(int i=1; i<=31; i++) {
							out.print("<option value='" + i + "'>" + i + "</option>");
						}
						%>
						</select>일     
					</td>
					</tr>
					<tr>
						<td>이중답변</td>
						<td>
							<input type="radio" name="type" value="1" checked>YES  <!-- 데이터베이스 타입에 1or 0 -->
							<input type="radio" name="type" value="0">NO
						</td>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<input type="submit" value="작성하기"> &emsp;
							<input type="reset" value="다시쓰기"> &emsp;
							<input type="button" value="목록보기" onclick="location.href='voteForm.jsp'">
						</td>
					</tr>				

			</table>
		</form>
	</div>
	
	<!-- insert 에서 VoteList 데이터베이스에 들어간 값은 question, type  ->이름이 같기때문 -->
	<!-- insert 에서 VoteItem 데이터베이스에 들어간 값은 String[] item -> 배열에 값을 넣음 -->
	<!-- Proc로 넘어감 -->
	
	
	
	  

</body>
</html>