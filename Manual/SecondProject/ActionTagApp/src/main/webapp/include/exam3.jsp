<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>exam3.jsp</h1>
	pageContext :
	<%=pageContext.getAttribute("first")%><br> request :
	<%=request.getAttribute("first")%><br> session :
	<%=session.getAttribute("first")%><br> application :
	<%=application.getAttribute("first")%><br>
	
	<%
	pageContext.setAttribute("second", "pageContext 객체");
	request.setAttribute("second", "request 객체");
	session.setAttribute("second", "session 객체");
	application.setAttribute("second", "application 객체");
	%>
</body>
</html>