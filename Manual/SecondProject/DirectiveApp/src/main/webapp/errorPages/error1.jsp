<%@ page contentType="text/html; charset=EUC-KR"
	isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>에러 발생</h2>
	원인 : <%= exception.getMessage() %>
</body>
