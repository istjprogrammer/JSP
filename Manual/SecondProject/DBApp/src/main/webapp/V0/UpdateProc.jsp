<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>

<%
request.setCharacterEncoding("euc-kr");

String b_num = request.getParameter("b_num");

String name = request.getParameter("name");
String email = request.getParameter("email");
String subject = request.getParameter("subject");
String content = request.getParameter("content");
String pass = request.getParameter("pass");

//out.println(name + ", " + email + ", " + subject +
//		", " + content + ", " + pass);

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
	sql = "update tblboard set b_name=?, b_email=?, b_subject=?, b_content=? " + "where b_num=?";
	stmt = con.prepareStatement(sql);
	stmt.setString(1, name);
	stmt.setString(2, email);
	stmt.setString(3, subject);
	stmt.setString(4, content);
	stmt.setString(5, b_num);
	stmt.executeUpdate();

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
	System.out.println("UpdateProc.jsp: " + e);
} finally {
	if (stmt != null)
		stmt.close();
	if (con != null)
		con.close();
	if (rs != null)
		rs.close();
}
%>