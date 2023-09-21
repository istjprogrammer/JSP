<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>간단한 Bean 예제</h2>
	<h1>현재현재짱 : 현재 is best</h1>
	<jsp:useBean id="cal" class="com.example.CalenderBean" />
	<h3>
		오늘은 <jsp:getProperty property="year" name="cal"/>년
		 	 <jsp:getProperty property="month" name="cal"/>월
		 	 <jsp:getProperty property="date" name="cal"/>일 입니다.
		 	 <!-- 첫번째 글자는 소문자로 입력한다. -->
	</h3>
	</body>
</html>