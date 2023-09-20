<%@ page contentType = "text/html;charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과 페이지</title>
</head>
<body>
    <h1>선택한 상품 가격 합계</h1>
    <%
        // 선택한 상품의 가격 합계를 계산하기 위한 변수를 초기화합니다.
        int totalPrice = 0;

        // 선택한 상품의 값들을 배열로 받아옵니다.
        String[] selectedFoods = request.getParameterValues("food");

        // 선택한 상품들의 가격 합계를 계산합니다.
        if (selectedFoods != null) {
            for (String foodPrice : selectedFoods) {
                totalPrice += Integer.parseInt(foodPrice);
            }
        }
    %>
    <p>선택한 상품의 가격 합계: <%= totalPrice %>원</p>
</body>
</html>