<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	주소 : <%= pageContext.getAttribute("addr",
				pageContext.SESSION_SCOPE) %>
	<br>
	주소 : <%= session.getAttribute("addr") %>
</body>
</html>