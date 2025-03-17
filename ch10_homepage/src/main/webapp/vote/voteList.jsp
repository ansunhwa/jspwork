<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vote.* , java.util.* " %>  <!-- ch09사용 ArrayList때문에 자바유틸의 모든 것 -->
<jsp:useBean id="vDao" class="vote.VoteDao" />   <!-- 사용하겠습니다 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	* {margin: 0 auto;}
	div {width: 800px;}
	h2 {text-align: center;}
	.m30 {margin-top : 30px;}
	a {text-decoration: none; color:black; cursor:pointer;}
</style>
</head>
<body>
	<div>
		<h2 class="m30">투표 프로그램</h2>
		<hr>
		
		<h5 class="m30">설 문 폼</h5>
		<jsp:include page="voteForm.jsp" />
		<hr>
		
		<h5 class="m30">설문 리스트</h5> <!-- 연동해서 데이터베이스에 있는 설문을 가져와야함 -->
		<table class="table">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>시작일~종료일</th>
			</tr>
		<%
			ArrayList<VoteList> alist = vDao.getList();  /* 만들어진 객체를 alist에 넣음 */
			for(int i=0; i<alist.size(); i++) {
				VoteList vlist = alist.get(i);
				int num = vlist.getNum();  /* 담겨서 있는 값중 num가져오세요 */
				String question = vlist.getQuestion();  /* getList()에는 4개만 담았음 */
				String sdate = vlist.getSdate();
				String edate = vlist.getEdate();
				out.print("<tr>");
				out.print("    <td>"+ (alist.size()-i) +"</td>");   //큰숫자가 최신거기때문에 5,4,3,2,1식으로
				out.print("    <td><a href='voteList.jsp?num="+ num +"'>"+ question +"</a></</td>");
				out.print("    <td>"+ sdate + "~" + edate + "</td>");
				out.print("</tr>");
				
			}
		
		%>	
			<tr>
				<td colspan="3"><button type="button" onclick="location.href='voteInsert.jsp'">설문 작성하기</button>
				<input type="button" onclick="location.href='../index.jsp'" value="홈으로">
				</td>
			</tr>
		
		</table>
		
		
	</div>


</body>
</html>