<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function check() {
		if (document.form.pass.value == "") {
			alert("������ ���� �н����带 �Է��ϼ���.");
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
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;

	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "scott";
	String pw = "1111";

	String name = "";
	String email = "";
	String subject = "";
	String content = "";
	String pass = "";
	int count = 0;

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection(url, id, pw);

		String sql = "select * from tblboard where b_num=" + b_num;
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);

		if (rs.next()) {
			name = rs.getString("b_name");
			email = rs.getString("b_email");
			subject = rs.getString("b_subject");
			content = rs.getString("b_content");
			pass = rs.getString("b_pass");
			count = rs.getInt("b_count");
		}
	} catch (Exception e) {
		System.out.println("List.jsp : " + e);
	} finally {
		if (rs != null) {
			rs.close();
		}
		if (stmt != null) {
			stmt.close();
		}
		if (con != null) {
			con.close();
		}
	}
	%>
	<center>
		<br>
		<br>
		<table width=460 cellspacing=0 cellpadding=3>
			<tr>
				<td bgcolor=#FF9018 height=21 align=center class=m>�����ϱ�</td>
			</tr>
		</table>

		<form name=form method=post action="UpdateProc.jsp">
			<table width=70% cellspacing=0 cellpadding=7>
				<tr>
					<td align=center>
						<table border=0>
							<tr>
								<td width=20%>�� ��</td>
								<td width=80%><input type=text name=name size=30
									maxlength=20 value="<%=name%>"></td>
							</tr>
							<tr>
								<td width=20%>E-Mail</td>
								<td width=80%><input type=text name=email size=30
									maxlength=30 value="<%=email%>"></td>
							</tr>
							<tr>
								<td width=20%>�� ��</td>
								<td width=80%><input type=text name=subject size=50
									maxlength=50 value="<%=subject%>"></td>
							<tr>
								<td width=20%>�� ��</td>
								<td width=80%><textarea name=content rows=10 cols=50><%=content%></textarea>
								</td>
							</tr>
							<tr>
								<td width=20%>��� ��ȣ</td>
								<td width=80%><input type=password name=pass size=15
									maxlength=15> �����ÿ��� ��й�ȣ�� �ʿ��մϴ�.</td>
							</tr>
							<tr>
								<td colspan=2 height=5><hr size=1></td>
							</tr>
							<tr>
								<td colspan=2><input type=Button value="�����Ϸ�"
									onClick="check()"> <input type=reset value="�ٽü���">
									<input type=button value="�ڷ�" onClick="history.back()">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>