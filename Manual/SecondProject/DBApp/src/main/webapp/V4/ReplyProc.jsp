<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import = "mybean.Board" %>

<jsp:useBean id="dao" class="mybean.BoardDao" />
<jsp:useBean id="dto" class="mybean.Board" />

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:setProperty property="*" name="dto" />

<%
	Board parent = dao.getBoard(dto.getB_num());
	System.out.println(parent.getPos());
	dao.replyUpdatePos(parent);
	
	dto.setPos(parent.getPos());
	dto.setDepth(parent.getDepth());
	
	dao.replyBoard(dto);
	response.sendRedirect("List.jsp");
%>

