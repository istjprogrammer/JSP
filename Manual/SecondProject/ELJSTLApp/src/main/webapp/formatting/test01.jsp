<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="custom" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="format" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<format:formatNumber value="100000"/><br>
	<format:formatNumber value="100000" groupingUsed="false"/><br>
	<format:formatNumber value="3.145678" pattern="#.###"/><br>
	<format:formatNumber value="0.5" type="percent"/><br>
	<format:formatNumber value="250000" type="currency"
		currencySymbol="$"/><br>
		
	<hr>
	<%
		Date date = new Date();
	%>
	
		<custom:set var="today" value="<%=new Date()%>"/>
	
	<format:formatDate value="${today}" type="date"/><br>
	<format:formatDate value="${today}" type="time"/><br>
	<format:formatDate value="${today}" type="both"/><br>
	<br>
	<format:formatDate value="${today}" dateStyle="short"/><br>
	<format:formatDate value="${today}" dateStyle="medium"/><br>
	<format:formatDate value="${today}" dateStyle="Long"/><br>
	<format:formatDate value="${today}" dateStyle="full"/><br>
	<br>
	<format:formatDate value="${today}" type="time" timeStyle="short"/><br>	
	<format:formatDate value="${today}" type="time" timeStyle="medium"/><br>	
	<format:formatDate value="${today}" type="time" timeStyle="Long"/><br>	
	<format:formatDate value="${today}" type="time" timeStyle="full"/><br>	
	<br>
	<format:formatDate value="${today}" pattern="yyyy/MM/dd(E)"/><br>
	
	<hr>
	
	<!-- 원하는 국가 형태 -->
	<format:setLocale value="ko_kr" />
	<format:formatNumber value="250000" type="currency"
		currencySymbol="$"/><br>
	<format:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/><br>
	
	<hr>
	
	<!-- 해당 국가 표준시간 -->
	<format:setLocale value="ko_kr" />
	서울 : <format:formatDate value="${today}" type="both" /><br>
	<br>
	<format:timeZone value="Asia/Hong_Kong">
	홍콩 : <format:formatDate value="${today}" type="both" /><br>
	</format:timeZone><br>
	
	<format:timeZone value="Euroup/London">
	런던 : <format:formatDate value="${today}" type="both" /><br>
	</format:timeZone><br>
	
	<format:timeZone value="America/New_york">
	뉴욕 : <format:formatDate value="${today}" type="both" /><br>
	</format:timeZone><br>
</body>
</html>