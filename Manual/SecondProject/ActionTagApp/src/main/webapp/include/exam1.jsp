<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exam1.jsp</title>
</head>
<body>
	<jsp:include page="inc/header.jsp"></jsp:include>
	<% int i =20; %>
	<%= i %>
	<h1> Hello World </h1>
	
	<%@ include file="inc/footer.jsp" %>
	
	<% //int j=20; %>
	<%= j %>
</body>
</html>