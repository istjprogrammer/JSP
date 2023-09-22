<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.example.CarDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ParkingControl</title>
</head>
<body>
	<jsp:useBean id="parking" class="com.example.parkingBean" scope="application"/>
	<jsp:setProperty property="enter" name="parking"/>
	<jsp:setProperty property="exit" name="parking"/>
	<h1>주차 관리 프로그램</h1>
	<form action ="parking.jsp" method ="Post">
		주차장에 들어온 차 번호: <input type="text" name ="enter"/>
		&nbsp;&nbsp;&nbsp;
		<input type="submit" value="입차"/>
	</form>
	
	<form action ="parking.jsp" method ="Post">
		주차장에 나간 차 번호: <input type="text" name ="exit"/>
		&nbsp;&nbsp;&nbsp;
		<input type="submit" value="출차"/>
	</form>
	<hr/>
	주차된 차량 목록 <br>
	<table border="1">
		<tr>
			<th>차량 번호</th> 
			<th>입차 시간</th>
		</tr>
		<%
			CarDto[] cars = parking.getCarList();
			for(int i=0; i<cars.length; i++){
				CarDto car = cars[i];
		%>
			<tr>
				<td><%= car.getplateNumber() %></td><!-- 액션 태그로 바꿔보기 -->
				<td><%= car.getparkingTime() %></td><!-- 액션 태그로 바꿔보기 -->
			</tr>
		<%
			}
		%>
	</table>
	총 대수 : <jsp:getProperty property="total" name="parking"/>
	</body>
</html>