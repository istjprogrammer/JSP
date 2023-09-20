<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String addr = "서울시 강서구";
		pageContext.setAttribute("addr", "서울시 강남구",
				pageContext.SESSION_SCOPE);
	%>
	
		주소 : <%=pageContext.getAttribute("addr") %>
</body>
</html>