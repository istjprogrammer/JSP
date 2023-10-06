<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="mybean.*"%>
<%@ page import="java.util.*"%>

<%!
	int totalRecord = 0;//총 글의 갯수
	int numPerPage = 20;//한 페이지당 출력될 페이지의 갯수
	int totalPage = 0;//전체 페이지 갯수
	int nowPage = 0;//현재의 페이지를 나타내는 변수
	int beginPerPage = 0;//각각의 페이지가 몇 페이지에서 시작하는지 알아야 되기 때문에
	int pagePerBlock = 2;// 몇 페이지를 한 블럭으로 할 것인지	
	int totalBlock = 0;// 전체 블럭 수
	int nowBlock = 0;// 현재 블럭
	
%>
<HTML>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function check() {
		if (document.search.keyWord.value == "") {
			alert("검색어를 입력하세요.");
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
	
		totalRecord = vec.size();//총 게시글의 갯수
		totalPage = (int) Math.ceil((double) totalRecord / numPerPage);//총 페이지의 갯수, 실수형으로 형 변환을 하는 이유는 정수형으로 하면 무조건 버림처리되기 때문이다.
		//Math.ceil은 반올림을 해주는 API
		
		if(request.getParameter("nowPage") != null)
			nowPage = Integer.parseInt(request.getParameter("nowPage"));//문자형을 숫자로 바꿔주는 메서드
		
		if(request.getParameter("nowBlock") != null)
			nowBlock = Integer.parseInt(request.getParameter("nowBlock"));//문자형을 숫자로 바꿔주는 메서드
			
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
							<td>번호</td>
							<td>제목</td>
							<td>이름</td>
							<td>날짜</td>
							<td>조회수</td>
						</tr>
						<%
						
						if(vec != null || !vec.isEmpty()){
						for (int i = beginPerPage; i <beginPerPage + numPerPage; i++) {
							if(i == totalRecord)
								break;
							
							Board board = (Board) vec.get(i);
						%>
						
						<!-- 답글 들여쓰기 기능 구현 -->
						<tr>
							<td><%=board.getB_num()%></td>
							<td>
								<%=dao.useDepth(board.getDepth()) %>
								<%
									if(board.getDepth() > 0){
								%>
									<img src="../image/re.gif" />
								<%
									}
								%>
								<a href="Read.jsp?b_num=<%=board.getB_num()%>"> 
								<%=board.getB_subject()%></a></td>
							<td><%=board.getB_name()%></td>
							<td><%=board.getB_regdate()%></td>
							<td><%=board.getB_count()%></td>
						</tr>
						<%
						}// for문이 닫히는 구간
					}//if 문이 닫히는 구간
						else{
						%>
						<b>데이터가 없습니다.</b>
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
					<a href = "List.jsp?nowPage=<%=pagePerBlock * (nowBlock-1)%>&nowBlock=<%=nowBlock-1%>">이전<%=pagePerBlock%> 개 </a>:::&nbsp;&nbsp;&nbsp;
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
					<a href = "List.jsp?nowPage=<%=pagePerBlock * (nowBlock+1)%>&nowBlock=<%=nowBlock+1%>">다음<%=pagePerBlock%>개</a>
					<% } %>	
				</td>
				<td align=right><a href="Post.jsp">[글쓰기]</a> 
				<a href="javascript:list()">[처음으로]</a></td>
			</tr>
		</table>
		
		<BR>
		<form action="List.jsp" name="search" method="post">
			<table border=0 width=527 align=center cellpadding=4 cellspacing=0>
				<tr>
					<td align=center valign=bottom><select name="keyField"
						size="1">
							<option value="b_name">이름
							<option value="b_subject">제목
							<option value="b_content">내용
					</select> 
					
					
						<input type="text" size="16" name="keyWord"> <input
						type="button" value="찾기" onClick="check()"> <input
						type="hidden" name="page" value="0"></td>
				</tr>
			</table>
		</form>
	</center>
</BODY>
</HTML>