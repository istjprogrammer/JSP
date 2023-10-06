<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setAttribute("cnt1", 100);
	int cnt2 = (Integer)request.getAttribute("cnt1");
%>

<%= cnt2 %><br>
<% out.println(cnt2); %><br>
${cnt1}, ${requestScope.cnt1}<br>
<!-- 원래는 request.getAttribute를 써야 하는데, 간편하게 쓸 수 있다. -->

<%= session.getAttribute("cnt1") %><br>

${requestScope["cnt1"]}
${cnt2}
</body>
</html>