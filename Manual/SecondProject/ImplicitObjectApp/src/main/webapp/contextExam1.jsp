<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>contextExam1.jsp</h1>
	<h2>session에 값을 저장</h2>
	<%session.setAttribute("i", 10);%>
	
	<h2>Application에 값 저장</h2>
	<%
		application.setAttribute("i", 100);
	%>
	
	<h2>pageContext 값 확인</h2>
	<% pageContext.setAttribute("i", 200); %>
	<!-- pagecontext는 지역변수기에 이 페이지를 벗어나면 쓸 수 없다. -->
</body>
</html>