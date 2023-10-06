<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="custom" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String str1 = "aaa";
	
		if(str1.equals("aaa")){
	%>
		<b>aaa가 맞습니다.</b>
	<%		
		}
	%>
	<hr>
	<custom:set var = "str2" value="aaa"/>
	<custom:if test="${str2 eq 'aaa'}">
		<b>aaa가 맞습니다.</b>
	</custom:if> 
	<hr>
	
	<form action="test02.jsp">
		숫자1 : <input type="text" name="num1"/><br><br>
		숫자2 : <input type="text" name="num2"/><br><br>
		<input type="submit" value="최대값 구하기"	/>	
	</form>
	<br><br>
	<%	
		try{
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		
		if(num1 > num2){
	%>
		<%=num1%>이 최댓값.
	<%
		}
		else{
	%>
			<%=num2%>이 최댓값.
	<%
			}
		}
		catch(Exception err){
			
		}
	%>
	<hr>
	<custom:if test="${param.num1 > param.num2}">
		${param.num1}이 최댓값
	</custom:if>
	<custom:if test="${param.num1 < param.num2}">
		${param.num2}이 최댓값
	</custom:if>
	<hr>
	<custom:choose>
		<custom:when test="${param.num1 > param.num2}">
		${param.num1}이 최댓값
		</custom:when>
		
		<custom:when test="${param.num1 < param.num2}">
		${param.num2}이 최댓값
		</custom:when>
		<custom:otherwise>
			<custom:if test="${!empty param.num1}">
				똑같다.
			</custom:if>
		</custom:otherwise>
	</custom:choose>
</body>
</html>