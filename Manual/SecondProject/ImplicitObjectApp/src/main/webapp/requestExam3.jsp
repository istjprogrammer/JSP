<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Date today = (Date) request.getAttribute("currentDate");
	//타입이 안 맞으면 맞춰주면 된다.
	%>
	오늘은
	<%=today%>
	입니다.
	<br>
	<br>

	<%
	request.removeAttribute("currentDate");
	today = (Date) request.getAttribute("currentDate");
	%>
	오늘은
	<%=today%>
	입니다.
	<br>
	<br>
</body>
</html>