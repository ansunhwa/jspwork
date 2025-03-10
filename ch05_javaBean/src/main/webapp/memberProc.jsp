<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- member2의 모든 데이터를 가지고 여기로 옴 -->
<jsp:useBean id="regBean" class="ch05_javaBean.MemberBean2" />
<jsp:setProperty name="regBean" property="*" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	  <table border="1" align="center">
            <tr>
                <th colspan="2">
                <jsp:getProperty property="name" name="regBean" /> 님이 작성한 내용 
                </th>
            </tr>
			<tr>
				<td>아이디</td>
                <td><jsp:getProperty property="id" name="regBean" /></td>
			</tr>
            <tr>
                <td>비밀번호</td>
                <td><jsp:getProperty property="pwd" name="regBean" /></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><jsp:getProperty property="name" name="regBean" /></td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td><jsp:getProperty property="birthday" name="regBean" /></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><jsp:getProperty property="email" name="regBean" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="회원가입"> &emsp;
                    <input type="reset">
                </td>
            </tr>

	</table>

</body>
</html>