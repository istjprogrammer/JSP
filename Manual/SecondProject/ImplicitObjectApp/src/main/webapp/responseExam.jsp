<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>1. 다른 페이지로 이동</h2>
	<% response.sendRedirect("https://www.naver.com"); %>
	<!-- 현재 사용자가 페이지를 요청하면 naver를 보여주는 것 -->
</body>
</html>