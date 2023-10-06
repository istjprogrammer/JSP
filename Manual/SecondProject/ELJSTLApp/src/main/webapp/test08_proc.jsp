<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test08_proc.jsp</title>
</head>
<body>
	<h2> ${param.name}님 환영합니다.</h2>
	총 방문자 수 : ${requestScope.visitCount} 명<br>
	<hr>
	<h2>${param.name}님이 좋아하는 음식</h2>
	${requestScope.foods[0]}, ${foods[1]}, ${foods[2]}, ${foods[3]}
	
	<hr>
	메시의 주인 이름 : ${requestScope.Lee}<br>
	이현재의 강아지 이름 : ${requestScope.messi} 
</body>
</html>
