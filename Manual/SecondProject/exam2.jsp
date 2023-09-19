<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Konny</title>
    <script>
		function sum(){
			var sum = 0;
			for(var i=0; i<=10; i++){
					sum += i;
			}
			return sum;
		}
	</script>
</head>

<body>
   <h1>1부터 10까지 합계</h1>
   <ul>
		<li>자바스크립트 결과 : <script>document.write(sum());</script></li>
		<li>자바 결과 : 
			<%
				int sum = 0;
				for(int i =0; i<=10; i++){
					sum +=i;
				}
			%>
			<%=sum%>
		</li>
   </ul>
</body>
</html>
