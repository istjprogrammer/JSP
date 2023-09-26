<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="dbcp.DBConnectionMgr" %>
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
	DBConnectionMgr pool = null;
	
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		pool = DBConnectionMgr.getInstance();
		con = pool.getConnection();
	
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
		pool.freeConnection(con, stmt, rs);
	}
%>