<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h3>1. formatNumber</h3>
	<p>
	* 숫자데이터의 포맷(형식) 지정<br>
	  - 표현하고자 하는 숫자데이터의 형식을 통화기호, % 등 원하는 형식을 지정하는 태그<br>
	    (fmt:formatNumber value="값" [groupinUsed="true|false" type="percent|currency" currencySymbol="통화기호문자"])<br>
	    => groupingUsed : 세자리마다 구분자(,) 표시여부(기본값 true = 세자리마다 구분자 표시)<br>
	    => type : percent = %로 출력	<br>
	    		  currency = 현재 local지역의 화폐 표시 여부  <br>
	    => currencySymbol : 화폐단위를 넣어 줄 때  <br>
	</p>
	
	<c:set var="num1" value="123456789" />
	<c:set var="num2" value ="0.75" />
	<c:set var="num3" value="50000" />
	
	num1 그대로 출력 : ${num1} <br>
	세자리마다 구분하여 출력 : <fmt:formatNumber value="${num1 }" /><br>
	숫자 그대로 출력 : <fmt:formatNumber value="${num1 }" groupingUsed="false" /> <br>
	
	percent : <fmt:formatNumber value="${num2 }" type="percent" /> <br>
	currency : <fmt:formatNumber value="${num3 }" type="currency" /> <Br>
	
	currency($) : <fmt:formatNumber value="${num3 }" type="currency" currencySymbol="€" /> <Br>
	
	<br><hr>
	
	<h3>2. formatDate</h3>
	<p>날짜 및 시간 데이터의 포맷 지정(단, java.util.Date 객체 사용)</p>
	
	<c:set var="current" value="<%=new java.util.Date() %>"/>
	그대로 출력 : ${current }<br>
	
	<ul>
		<li> 현재 날짜 : <fmt:formatDate value="${current }"/></li>  <!-- type의 기본값 ->년,월,일 -->
		<li> 현재 시간 : <fmt:formatDate value="${current }" type="time" /></li>	<!-- 시간 -->
		<li> 날짜와 시간 : <fmt:formatDate value="${current }" type="both" /></li>  <!-- 날짜, 시간 -->
		<li> Medium : <fmt:formatDate value="${current }" type="both" dateStyle="medium" timeStyle="medium"/></li> <!-- 기본스타일 -->
		<li> Long : <fmt:formatDate value="${current }" type="both" dateStyle="long" timeStyle="long"/></li>
		<li> Short : <fmt:formatDate value="${current }" type="both" dateStyle="short" timeStyle="short"/></li>
		<li> Full : <fmt:formatDate value="${current }" type="both" dateStyle="full" timeStyle="full"/></li>
		<li> 내가만든패턴 : <fmt:formatDate value="${current }" type="both" pattern="yyyy-MM-dd(E) hh:mm:ss(a)"/></li><!-- MM(월) mm(분) -->
	</ul>
	
	
	
	
	
	
	
	
	
</body>
</html>