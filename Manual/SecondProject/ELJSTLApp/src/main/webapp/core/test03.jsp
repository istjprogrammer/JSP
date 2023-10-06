<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="custom" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String[] foods = {"불고기", "갈비탕", "감자탕"};
		request.setAttribute("foods", foods);
	%>
	
	<%
		String[] arrFoods = (String[])request.getAttribute("foods");
	
		for(int i=0; i<arrFoods.length; i++){
	%>
		<%=arrFoods[i]%>
	<%	
		}
	%>
	<br>
	
	<custom:forEach begin= "0" end= "3" step="1" var="i">
		${foods[i]}
	</custom:forEach>
	<br>
	<custom:forEach var= "food" items= "${requestScope.foods}">
		${food}
	</custom:forEach>
	<hr>
	<custom:set var="guests" value="토끼/거북이*너구리-호랑이,기린" />
	<custom:forTokens items="${guests}" delims="/*-," var="token">
		${token}
	</custom:forTokens>
	
	<custom:redirect url="test04.jsp">
		<custom:param name="irum" value="이현재"></custom:param>
		<custom:param name="age" value="26세"></custom:param>
	</custom:redirect>
</body>
</html>