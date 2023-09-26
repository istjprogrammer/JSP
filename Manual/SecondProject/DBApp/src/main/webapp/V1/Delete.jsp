<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*"%>
<%@ page import="dbcp.DBConnectionMgr" %>

<html>
<head><title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function check() {
		if (document.form.pass.value == "") {
		alert("패스워드를 입력하세요.");
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
	Statement stmt = null;
	ResultSet rs = null;
	DBConnectionMgr pool = null;

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		pool = DBConnectionMgr.getInstance();
		con = pool.getConnection();
		
		String sql = "select b_pass from tblboard where b_num=?";
		stmt = con.prepareStatement(sql);
		
		rs.next();
		
		if(pass.equals(rs.getString("b_pass"))){
		sql = "delete from tblboard where b_num=?";
		stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery(sql);
		
		response.sendRedirect("List.jsp");
		}
		else{
			%>
				<script>
					alert("비밀번호가 틀렸습니다.");
					history.back();
				</script>
			<%
		}
	} catch (Exception e) {
		System.out.println("Delete.jsp: " + e);
	} finally {
		pool.freeConnection(con, stmt, rs);
	}

%>

<center>
<br><br>
<table width=50% cellspacing=0 cellpadding=3>
 <tr>
  <td bgcolor=#dddddd height=21 align=center>
      사용자의 비밀번호를 입력해 주세요.</td>
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
	  <input type=button value="삭제완료" onClick="check()"> 
      <input type=reset value="다시쓰기"> 
      <input type=button value="뒤로" onClick="history.back()">
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
