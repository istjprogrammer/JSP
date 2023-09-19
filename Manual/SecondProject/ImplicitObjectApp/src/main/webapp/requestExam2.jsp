<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	if (request.getMethod().equalsIgnoreCase("get")) {
	%>


	<form action="requestExam2.jsp" method="post">
		이름 : <input type="text" name="name" /><br> <br> 주소 : <input
			type="text" name="addr" /><br> <br> 취미 : <br> <input
			type="checkbox" name="hobby" value="등산">등산<br> <input
			type="checkbox" name="hobby" value="독서">독서<br> <input
			type="checkbox" name="hobby" value="여행">여행<br> <input
			type="checkbox" name="hobby" value="낚시">낚시<br> <input
			type="submit" value="전송" />
	</form>
	<%
	} else {//폼 입력시 화면에 내가 입력한 정보를 보여주는 코드
	%>

	<%
	request.setCharacterEncoding("UTF-8");//한글 깨짐 현상을 막아주는 코드
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String[] hobbies = request.getParameterValues("hobby");
	%>
	<ul>
		<li>이름 : <%=name%></li>
		<li>주소 : <%=addr%></li>

		<%
		if (hobbies != null) {//널값일 경우에 출력을 막아주는 코드		
			for (String hobby : hobbies) {
		%>
		<li><%=hobby%></li>
		<%
		}
		}
		%>
	</ul>

	<%
	}
	%>
</body>
</html>