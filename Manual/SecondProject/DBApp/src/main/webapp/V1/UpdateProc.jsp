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
	ResultSet rs = null;	//PW 일치 확인을 위해 DB로부터 받아온 값을 저장하기 위해 필요
	DBConnectionMgr pool = null;
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		pool = DBConnectionMgr.getInstance();	// DB연결 주소 가져오기
		con = pool.getConnection();
		
		
		String sql = "select b_pass from tblboard where b_num=?";
		stmt = con.prepareStatement(sql);
		stmt.setString(1, b_num);
		rs = stmt.executeQuery();
		rs.next(); //PW를 갖고 오기 위해 한번 호출해야한다.
			
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
				alert("비밀번호가 틀렸습니다.");
				history.back();
			</script>		
<%
		}
	}
	catch(Exception e){
		System.out.println("UpdateProc.jsp: " + e);
	}
	finally{
		//커넥션 풀 반납
		pool.freeConnection(con,stmt,rs);
	}
%>