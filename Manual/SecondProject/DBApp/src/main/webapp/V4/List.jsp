<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page import="mybean.*"%>
<%@ page import="java.util.*"%>

<%!
	int totalRecord = 0;//�� ���� ����
	int numPerPage = 5;//�� �������� ��µ� �������� ����
	int totalPage = 0;//��ü ������ ����
	int nowPage = 0;//������ �������� ��Ÿ���� ����
	int beginPerPage = 0;//������ �������� �� ���������� �����ϴ��� �˾ƾ� �Ǳ� ������
	int pagePerBlock = 2;// �� �������� �� ������ �� ������	
	int totalBlock = 0;// ��ü �� ��
	int nowBlock = 0;// ���� ��
	
%>
<HTML>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function check() {
		if (document.search.keyWord.value == "") {
			alert("�˻�� �Է��ϼ���.");
			document.search.keyWord.focus();
			return;
		}
		document.search.submit();
	}
</script>
<BODY>
	<jsp:useBean id="dao" class="mybean.BoardDao" />
	<%
		request.setCharacterEncoding("euc-kr");
		String keyWord = request.getParameter("keyWord");
		String keyField = request.getParameter("keyField");
	
		Vector vec = (Vector) dao.getBoardList(keyField, keyWord);
	
		totalRecord = vec.size();//�� �Խñ��� ����
		totalPage = (int) Math.ceil((double) totalRecord / numPerPage);//�� �������� ����, �Ǽ������� �� ��ȯ�� �ϴ� ������ ���������� �ϸ� ������ ����ó���Ǳ� �����̴�.
		//Math.ceil�� �ݿø��� ���ִ� API
		
		if(request.getParameter("nowPage") != null)
			nowPage = Integer.parseInt(request.getParameter("nowPage"));//�������� ���ڷ� �ٲ��ִ� �޼���
		
		if(request.getParameter("nowBlock") != null)
			nowBlock = Integer.parseInt(request.getParameter("nowBlock"));//�������� ���ڷ� �ٲ��ִ� �޼���
			
		beginPerPage = nowPage * numPerPage;
		totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
		
	%>
	<center>
		<br>
		<h2>JSP Board</h2>

		<table align=center border=0 width=80%>
			<tr>
				<td align=left>Total : Articles( <font color=red> <%=nowPage+1%> / <%=totalPage%>
						Pages </font>)
				</td>
			</tr>
		</table>

		<table align=center width=80% border=0 cellspacing=0 cellpadding=3>
			<tr>
				<td align=center colspan=2>
					<table border=0 width=100% cellpadding=2 cellspacing=0>
						<tr align=center bgcolor=#D0D0D0 height=120%>
							<td>��ȣ</td>
							<td>����</td>
							<td>�̸�</td>
							<td>��¥</td>
							<td>��ȸ��</td>
						</tr>
						<%
						
						if(vec != null || !vec.isEmpty()){
						for (int i = beginPerPage; i <beginPerPage + numPerPage; i++) {
							if(i == totalRecord)
								break;
							
							Board board = (Board) vec.get(i);
						%>
						<tr>
							<td><%=board.getB_num()%></td>
							<td><a href="Read.jsp?b_num=<%=board.getB_num()%>"> <%=board.getB_subject()%></a></td>
							<td><%=board.getB_name()%></td>
							<td><%=board.getB_regdate()%></td>
							<td><%=board.getB_count()%></td>
						</tr>
						<%
						}// for���� ������ ����
					}//if ���� ������ ����
						else{
						%>
						<b>�����Ͱ� �����ϴ�.</b>
						<%
						}
						%>
					</table>
				</td>
			</tr>
			<tr>
				<td><BR>
				<BR></td>
			</tr>
			<tr>
				<td align="left">Go to Page 
					<% if(nowBlock>0) {%>
					<a href = "List.jsp?nowPage=<%=pagePerBlock * (nowBlock-1)%>&nowBlock=<%=nowBlock-1%>">����<%=pagePerBlock%> �� </a>:::&nbsp;&nbsp;&nbsp;
					<% } %>
					<%
						for(int i=0; i<pagePerBlock; i++){
							if((nowBlock * pagePerBlock) + i == totalPage)
								break;
					%>
						
						<a href ="List.jsp?nowPage=<%=(nowBlock * pagePerBlock) + i%>
							&nowBlock=<%=nowBlock%>">
							<%=(nowBlock * pagePerBlock) + i + 1 %>
						</a>&nbsp;&nbsp;&nbsp;							
						
					<%
						}
					%>			
					&nbsp;&nbsp;&nbsp;
					:::
					<% if(totalBlock > nowBlock + 1){ %>
					<a href = "List.jsp?nowPage=<%=pagePerBlock * (nowBlock+1)%>&nowBlock=<%=nowBlock+1%>">����<%=pagePerBlock%>��</a>
					<% } %>	
				</td>
				<td align=right><a href="Post.jsp">[�۾���]</a> 
				<a href="javascript:list()">[ó������]</a></td>
			</tr>
		</table>
		
		<BR>
		<form action="List.jsp" name="search" method="post">
			<table border=0 width=527 align=center cellpadding=4 cellspacing=0>
				<tr>
					<td align=center valign=bottom><select name="keyField"
						size="1">
							<option value="b_name">�̸�
							<option value="b_subject">����
							<option value="b_content">����
					</select> 
					
					
						<input type="text" size="16" name="keyWord"> <input
						type="button" value="ã��" onClick="check()"> <input
						type="hidden" name="page" value="0"></td>
				</tr>
			</table>
		</form>
	</center>
</BODY>
</HTML>