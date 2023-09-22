<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%request.setCharacterEncoding("UTF-8");%>
	<jsp:useBean id="req" class="com.example.requestBean" scope="request"/>
	
	<jsp:setProperty property="header" name="req" param="header"/>
	<!-- 만약 param을 생략하면 property의 이름을 따라간다. -->
	<jsp:setProperty property="footer" name="req" param="footer"/>
	
	<jsp:include page="inc/header.jsp"></jsp:include>
	<form method="post" action="requestExam.jsp">
	머릿말에 들어갈 내용 : <br> 
	<textarea rows="2" cols="60" name="header"></textarea>
	<br><br>
	꼬릿말에 들어갈 내용 : <br> 
	<textarea rows="2" cols="60" name="footer"></textarea>
	<br><br>
	<input type="submit" value ="입력"/>
	</form>
	<jsp:include page="inc/footer.jsp"></jsp:include>
</body>
</html>
<!-- 
Bean ClassName : com.example.RequestBean
Name 	r/w 	datatype
--------------------------------
herder 	r/w		String
footer 	r/w		String
 -->