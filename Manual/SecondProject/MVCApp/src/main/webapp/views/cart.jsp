<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<b>현재 주문한 도서</b>
	<table border="1">
		<tr>
		<th>도서 제목</th><th>작가</th><th>가격</th><th>수량</th><th>삭제</th>
		</tr>
		<!-- 주문한 도서를 출력 -->
	<c:forEach var="dto" items="${bookList}" varStatus="status">
		<tr>
			<td>${dto.title}</td>
			<td>${dto.author}</td>
			<td>${dto.price}</td>
			<td>${dto.quantity}</td>
			<td>
				<form method="post" action ="/MVCApp/bookshop">
					<input type="hidden" name="command" value="DEL"/>
					<input type="hidden" name="cnt" value="${status.index}"/>					
					<input type="submit" value="삭제"/>
				</form>
			</td>
		</tr>
	</c:forEach>
	</table>
	<br>
	<form method="post" action="/MVCApp/bookshop">
		<input type="hidden" name="command" value="CHECKOUT"/>
		<input type="submit" value = "체크아웃"/>
	</form>
</body>
</html>