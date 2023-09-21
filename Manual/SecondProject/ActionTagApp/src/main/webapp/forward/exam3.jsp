<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>exam3.jsp</h2>
	당신의 이름은 <%= request.getParameter("name") %> 입니다.
	<br/>
	당신의 국적은 <%= request.getParameter("nation") %> 입니다.
</html>