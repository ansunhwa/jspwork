<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 값들을 데이터베이스(sql)에 넣는, 처리하는 파일 -->
<jsp:useBean id="vDao" class="vote.VoteDao" />  <!-- bean파일로 사용 -->

<jsp:useBean id="vitem" class="vote.VoteItem" />  <!-- 받아온 값 * 다 넣으세요 -->
<jsp:setProperty name="vitem" property="*" />
<!-- item[] 들어옴 -->

<jsp:useBean id="vlist" class="vote.VoteList" />
<jsp:setProperty name="vlist" property="*" />
<!-- question, type -->
<%
	String sdate = request.getParameter("sdateY") + "-"
				+ request.getParameter("sdateM") + "-"
				+ request.getParameter("sdateD");  /* sdate 에는 select에 넣은 값 가져옴 */

	String edate = request.getParameter("edateY") + "-"
				+ request.getParameter("edateM") + "-"
				+ request.getParameter("edateD");  /* edate 에는 select에 넣은 값 가져옴 */
	
	vlist.setSdate(sdate);  /* 가져온 값을 VoteList의 sdate에 넣음 */
	vlist.setEdate(edate);  /* 가져온 값을 VoteList의 edate에 넣음 */
	/* 여기까지 bean에 들어온 객체 -> question, s,edate, type */
	
	
	boolean result = vDao.voteInsert(vlist, vitem);
	
	String msg = "설문추가에 실패하였습니다";
	String url = "voteInsert.jsp";
	
	if(result) {
		msg = "설문을 추가하였습니다";
		url = "voteList.jsp";
	}
%>
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>