<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<% request.setCharacterEncoding("UTF-8"); %>
	이름 : <%= request.getParameter("name") %><br>
	아이디 : <%= request.getParameter("id") %><br>
	<hr>
	
	이름 : ${param.name}<!-- 위의 코드가 옆의 코드처럼 간단해진다! --><br>
	아이디 : ${param.id}<br>
	<hr>
	<%
		String[] foods = request.getParameterValues("food");
	%>
	first food : <%=foods[0]%><br>
	second food : <%=foods[1]%><br>
	<br>
	first food : ${paramValues.food[0]} 
	또는 ${paramValues["food"]["0"]}<br>
	또는 ${paramValues["food"][0]}<br>
	second food : ${paramValues["food"][1]} <br>
	
	<hr>
	<%
		String[] hobbies = request.getParameterValues("hobby");
	%>
	
	<%
		for(int i=0; i<hobbies.length; i++){	
	%>
		취미 : <%=hobbies[i]%><br>
	<%
		}
	%>
	
	<hr>
	취미1: ${paramValues.hobby[0]}<br>
	취미2: ${paramValues.hobby[1]}<br>
	취미3: ${paramValues.hobby[2]}<br>
</body>
</html>