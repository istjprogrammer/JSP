<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="custom" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${param.irum} ${param.age}
	<h2>내가 좋아하는 영화들</h2>
	
	
	<hr>
	
	<h2>댓글 리스트</h2>
	<!-- 여기에 임의의 댓글을 출력한다. -->
	<br><br><br>
	<!-- 회원일 경우에만 아래의 댓글 달기 폼이 보여지게 한다. -->
	<form>
		댓글 달기<br>
		<textarea rows="3" cols="60"></textarea>
		<input type="submit" value="댓글달기"/>
	</form>
	
</body>
</html>