<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*"%>
<%@ page import="dbcp.DBConnectionMgr" %>

<html>
<head><title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function check() {
		if (document.form.pass.value == "") {
		alert("�н����带 �Է��ϼ���.");
		form.pass.focus();
		return false;
		}
		document.form.submit();
	}
</script>
</head>
<body>

<%
	String b_num = request.getParameter("b_num");
	String pass = request.getParameter("pass");
	Connection con = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "scott";
	String pw = "1111";
	
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection(url, id, pw);
		
		String sql = "select b_pass from tblboard where b_num=?";
		stmt = con.prepareStatement(sql);
		stmt.setString(1, b_num);
		rs = stmt.executeQuery();
		rs.next();
		
		if(pass.equals(rs.getString("b_pass"))){
		sql = "delete from tblboard where b_num=?";
		stmt = con.prepareStatement(sql);
		stmt.setString(1, b_num);
		stmt.executeUpdate();
		
		response.sendRedirect("List.jsp");
		}
		else{
			%>
				<script>
					alert("��й�ȣ�� Ʋ�Ƚ��ϴ�.");
					history.back();
				</script>
			<%
		}
	} catch (Exception e) {
		System.out.println("Delete.jsp: " + e);
	} finally {
		if (stmt != null)
			stmt.close();
		if (con != null)
			con.close();
		if (rs != null)
			rs.close();
	}

%>

<center>
<br><br>
<table width=50% cellspacing=0 cellpadding=3>
 <tr>
  <td bgcolor=#dddddd height=21 align=center>
      ������� ��й�ȣ�� �Է��� �ּ���.</td>
 </tr>
</table>
<table width=70% cellspacing=0 cellpadding=2>
<form name=form method=post action="Delete.jsp" >
<input type ="hidden" name ="b_num" value = <%=b_num %> />
 <tr>
  <td align=center>
   <table align=center border=0 width=91%>
    <tr> 
     <td align=center>  
	  <input type=password name="pass" size=17 maxlength=15>
	 </td> 
    </tr>
    <tr>
     <td><hr size=1 color=#eeeeee></td>
    </tr>
    <tr>
     <td align=center>
	  <input type=button value="�����Ϸ�" onClick="check()"> 
      <input type=reset value="�ٽþ���"> 
      <input type=button value="�ڷ�" onClick="history.back()">
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
