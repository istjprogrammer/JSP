<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<html>
<head><title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>
<%
	String b_num = request.getParameter("b_num");

	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "scott";
	String pw = "1111";
	
	String name = "";
	String regdate="";
	String email = "";
	String home = "";
	String subject = "";
	String content = "";
	String ip = "";
	int count = 0;
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection(url, id, pw);
		
		String sql = "select * from tblboard where b_num=" + b_num;
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){
		name = rs.getString("b_name");
		regdate = rs.getString("b_regdate");
		email = rs.getString("b_email");
		home = rs.getString("b_homepage");
		subject = rs.getString("b_subject");
		content = rs.getString("b_content");
		ip = rs.getString("b_ip");
		count = rs.getInt("b_count");
		}
	}
	catch(Exception e){
		System.out.println("List.jsp: " + e);
	}
	finally{
	if(rs != null)
		rs.close();
	
	if(stmt != null)
		stmt.close();
	
	if(con != null)
		con.close();
	}
	
%>
<br><br>
<table align=center width=70% border=0 cellspacing=3 cellpadding=0>
 <tr>
  <td bgcolor=9CA2EE height=25 align=center class=m>���б�</td>
 </tr>
 <tr>
  <td colspan=2>
   <table border=0 cellpadding=3 cellspacing=0 width=100%> 
    <tr> 
	 <td align=center bgcolor=#dddddd width=10%> �� �� </td>
	 <td bgcolor=#ffffe8><%=name %></td>
	 <td align=center bgcolor=#dddddd width=10%> ��ϳ�¥ </td>
	 <td bgcolor=#ffffe8><%=regdate %></td>
	</tr>
    <tr>
	 <td align=center bgcolor=#dddddd width=10%> �� �� </td>
	 <td bgcolor=#ffffe8 ><%=email %></td> 
	 <td align=center bgcolor=#dddddd width=10%> Ȩ������</td>
	 <td bgcolor=#ffffe8 ><a href="http://" target="_new">http://</a> <%=home %></td> 
	</tr>
    <tr> 
     <td align=center bgcolor=#dddddd> �� ��</td>
     <td bgcolor=#ffffe8 colspan=3><%=subject %></td>
   </tr>
   <tr> 
    <td colspan=4><%=content %></td>
   </tr>
   <tr>
    <td colspan=4 align=right>
     <%=ip%>�� ���� ���� ����̽��ϴ�./  ��ȸ�� : 
    <%=count %></td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align=center colspan=2> 
	<hr size=1>
	[ <a href="javascript:list()">�� ��</a> | 
    <a href="Update.jsp?b_num=<%=b_num%>">�� ��</a> |
    <a href="">�� ��</a> ]<br>
  </td>
 </tr>
</table>
</body>
</html>
