<%@ page contentType="text/html; charset=UTF-8"%>
	<hr/>
	[꼬릿말 내용]<br>
	<jsp:useBean id="req" class="com.example.requestBean" scope="request"/>
	<jsp:getProperty property="footer" name = "req"/>