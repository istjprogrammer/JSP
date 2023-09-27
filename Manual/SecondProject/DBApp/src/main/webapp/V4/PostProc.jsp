<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="dao" class="mybean.BoardDao" />
<jsp:useBean id="dto" class="mybean.Board" />

<%
	request.setCharacterEncoding("euc-kr");
%>

<jsp:setProperty property="*" name="dto" />

<%
	dao.setBoard(dto);
	response.sendRedirect("List.jsp");
%>

