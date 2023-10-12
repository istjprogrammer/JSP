<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
    	ArrayList advice = (ArrayList)request.getAttribute("advice");
    	for(int i=0; i<advice.size(); i++){
    %>
    
    	<div style="color:blue"><%=advice.get(i) %></div>
    <%
    		
    	}
    %>
</body>
</html>