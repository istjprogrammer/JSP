<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id = "test" class ="mybean.BeanTest" />
	<jsp:setProperty property="name" name="test" value="홍길동" />
	<jsp:setProperty property="price" name="test" value="100000" />	
	
	이름 : <jsp:getProperty property ="name" name="test"/><br>
	가격 : <jsp:getProperty property ="price" name="test"/><br>
	<hr>
	
	<!-- 위의 코드를 ER로 아래와 같이 간단하게 표현가능 -->
	이름 : ${test.name}<br>
	가격 : ${test.price}<br>
	<hr>
	<a href="/ELJSTLApp/eltest.action?name=John">서블릿에게 요청</a>
	
		
</body>
</html>