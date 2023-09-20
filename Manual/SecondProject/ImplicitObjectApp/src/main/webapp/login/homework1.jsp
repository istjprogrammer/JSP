<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int mat = Integer.parseInt(request.getParameter("mat"));

	int avg = kor + eng + mat;
	double result = (double) avg / 3;
	String formattedResult = String.format("%.2f", result);
	%>

	<h3>당신의 성적입니다.</h3>
	평균 :
	<%=formattedResult%>
	<br /> 학점 :
	<%
	if (result >= 90) {
	%>
	A
	<%
	} else if (result >= 80) {
	%>
	B
	<%
	} else if (result >= 70) {
	%>
	C
	<%
	} else if (result >= 60) {
	%>
	D
	<%
	} else {
	%>
	E
	<%
	}
	%>

</body>
</html>
