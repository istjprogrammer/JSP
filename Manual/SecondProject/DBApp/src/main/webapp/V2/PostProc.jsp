<%@ page contentType="text/html;charset=euc-kr" %>

<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("euc-kr");
	
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String home = request.getParameter("homepage");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String pass = request.getParameter("pass");
	
	out.println(name + "," + email + "," + home + "," + subject + "," + content + "," + pass);
	
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	Context ctx = new InitialContext();
	DataSource ds = 
			(DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");

	
	try {
		con = ds.getConnection();
	
		String sql = "insert into tblboard(b_num," +
			"b_name, b_email, b_homepage, b_subject, b_content, " + 
			"b_pass, b_count, b_ip, b_regdate, pos, depth)" + 
			"values(seq_b_num.nextVal, ?,?,?,?,?,?, 0, ?, sysdate, 0, 0)";
		stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery(sql);
		
		response.sendRedirect("List.jsp");

	
	} catch (Exception e) {
		System.out.println("PostProc.jsp: " + e);
	} finally {
		if(rs != null)	rs.close();
		if(stmt != null) stmt.close();
		if(con != null)	con.close();
	}
%>