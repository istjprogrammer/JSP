<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="mybean.Board" %>

<jsp:useBean id="dao" class="mybean.BoardDao"/>

<%
    int b_num = Integer.parseInt(request.getParameter("b_num"));
    Board board = dao.getBoard(b_num);

    String subject = board.getB_subject();
    String content = board.getB_content();
%>

<html>
<head><title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<center>
<br><br>
<table width=80% cellspacing=0 cellpadding=3>
 <tr>
  <td bgcolor=84F399 height=25 align=center>글쓰기</td>
 </tr>
</table>
<br>
<table width=80% cellspacing=0 cellpadding=3 align=center>
<form name=post method=post action="ReplyProc.jsp" >
<input type="hidden" name="b_ip" value="<%=request.getRemoteAddr()%>">
<input type="hidden" name="b_num" value="<%=b_num%>"> <!-- 글 번호를 넘겨주는 라인 -->
 <tr>
  <td align=center>
   <table border=0 width=100% align=center>
    <tr>
     <td width=10%>성 명</td>
     <td width=90%><input type=text name=b_name size=10 maxlength=8></td>
    </tr>
    <tr>
     <td width=10%>E-Mail</td>
     <td width=90%><input type=text name=b_email size=30 maxlength=30></td>
    </tr>
    <tr>
     <td width=10%>홈페이지</td>
     <td width=90%><input type=text name=b_homepage size=40 maxlength=30></td>
    </tr>
    <tr>
     <td width=10%>제 목</td>
     <td width=90%><input type=text name=b_subject size=50 maxlength=30
     value="답변:<%=subject %>"></td>
    </tr>
    <tr>
     <td width=10%>내 용</td>
     <td width=90%><textarea name=b_content rows=10 cols=50><%=content %></textarea></td>
    </tr>
    <tr>
     <td width=10%>비밀 번호</td> 
     <td width=90% ><input type=password name=b_pass size=15 maxlength=15></td>
    </tr>
    <tr>
     <td colspan=2><hr size=1></td>
    </tr>
    <tr>
     <td><input type=submit value="등록" >&nbsp;&nbsp;
         <input type=reset value="다시쓰기">&nbsp;&nbsp;
     </td>
    </tr> 
   </table>
  </td>
 </tr>
</form> 
</table>
</center>
</body>
</html>