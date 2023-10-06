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
	int var1 = 100;
%>

<%= var1 %><br>
<hr>
<custom:set var="var2" value="200"/>
${var2}
<br>
<custom:set var="var3" value="300"/>
<custom:set var="result" value="${var2 + var3 }"/>

두 수의 합은 ${result} 입니다.
</body>
</html>