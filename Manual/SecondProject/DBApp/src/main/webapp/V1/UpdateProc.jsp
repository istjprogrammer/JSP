<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="dbcp.DBConnectionMgr" %>

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
	ResultSet rs = null;	//PW ��ġ Ȯ���� ���� DB�κ��� �޾ƿ� ���� �����ϱ� ���� �ʿ�
	DBConnectionMgr pool = null;
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		pool = DBConnectionMgr.getInstance();	// DB���� �ּ� ��������
		con = pool.getConnection();
		
		
		String sql = "select b_pass from tblboard where b_num=?";
		stmt = con.prepareStatement(sql);
		stmt.setString(1, b_num);
		rs = stmt.executeQuery();
		rs.next(); //PW�� ���� ���� ���� �ѹ� ȣ���ؾ��Ѵ�.
			
		if(pass.equals(rs.getString("b_pass"))){
			sql = "update tblboard set b_name=?, b_email=?, b_subject=?, b_content=? " +
				"where b_num=?";
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
				alert("��й�ȣ�� Ʋ�Ƚ��ϴ�.");
				history.back();
			</script>		
<%
		}
	}
	catch(Exception e){
		System.out.println("UpdateProc.jsp: " + e);
	}
	finally{
		//Ŀ�ؼ� Ǯ �ݳ�
		pool.freeConnection(con,stmt,rs);
	}
%>