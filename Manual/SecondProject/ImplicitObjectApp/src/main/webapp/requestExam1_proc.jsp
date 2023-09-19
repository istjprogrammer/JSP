<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");//한글 깨짐 현상을 막아주는 코드
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String [] hobbies = request.getParameterValues("hobby");	
	out.print("name");
%>
	<ul>
		<li>이름 : <%=name %></li>
		<li>주소 : <%=addr %></li>
		
		<%	
			if(hobbies != null){//널값일 경우에 출력을 막아주는 코드		
			for(String hobby : hobbies){
		
		%>
			<li><%=hobby %></li>
		<%
			}
		}
		%>
	</ul>
</body>
</html>