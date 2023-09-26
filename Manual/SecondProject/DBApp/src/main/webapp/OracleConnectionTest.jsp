<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>오라클 DB 연결 테스트</h1>
	<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url ="jdbc:oracle:thin:@localhost:1521:xe";
		Connection conn = 
				DriverManager.getConnection(url, "scott", "1111");
	%>
	
	DB 연결 주소 : <%=conn%>
	<%
		conn.close();
	%>
		
</body>
</html>