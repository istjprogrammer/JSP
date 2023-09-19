<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Konny</title>
    
</head>
<%! 
	java.util.Date today;
%>
<body>
   <h1>Welcome To Konny's World</h1>
   <%
		today = new java.util.Date();
   %>
   <h3> 오늘은 <%=today%> 입니다.</h3>
</body>
</html>
