<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");//�ѱ� ���� ������ �����ִ� �ڵ�
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String [] hobbies = request.getParameterValues("hobby");	
	out.print("name");
%>
	<ul>
		<li>�̸� : <%=name %></li>
		<li>�ּ� : <%=addr %></li>
		
		<%	
			if(hobbies != null){//�ΰ��� ��쿡 ����� �����ִ� �ڵ�		
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