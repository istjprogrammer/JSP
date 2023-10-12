<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>도서 주문 페이지</h1>
	<form method="post" action="/MVCApp/bookshop">
		<input type="hidden" name="command" value="CART" /> <b>도서 선택</b> <select
			name="book">
			<option>어린 왕자 / 생떽쥐페리 / 15000</option>
			<option>연금술사 / 파올로 코엘료 / 21000</option>
			<option>홍길동전 / 허균 / 25000</option>
			<option>50 Greates Short Stories / Crane, Milton / 9800</option>
		</select> <b>수량 : </b> 
		<input type="text" name="quantity" size="2" value="1" />
		<input type="submit" value="장바구니에 담기" />
	</form>
	<hr>
	<jsp:include page="cart.jsp"></jsp:include>
</body>
</html>