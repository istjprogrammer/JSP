<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>exam5.jsp</h2>
	아이디 : <%= request.getParameter("id") %><br>
	패스워드 : <%= request.getParameter("pw") %><br>
</body>
</html>