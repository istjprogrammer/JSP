<!-- UpdateProc.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("euc-kr");
    
    String b_num = request.getParameter("b_num"); // 수정할 게시글의 번호
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String home = request.getParameter("homepage");
    String subject = request.getParameter("subject");
    String content = request.getParameter("content");
    String pass = request.getParameter("pass");
    
    Connection con = null;
    PreparedStatement stmt = null;
    
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String id = "scott";
    String pw = "1111";
    
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection(url, id, pw);
    
        String sql = "UPDATE tblboard SET name=?, email=?, b_subject=?, b_content=?  " +
                     "WHERE b_num=?";
        stmt = con.prepareStatement(sql);
        stmt.setString(1, name);
        stmt.setString(2, email);
        stmt.setString(3, home);
        stmt.setString(4, content);
  
        stmt.setInt(7, Integer.parseInt(b_num));
        int rowsUpdated = stmt.executeUpdate();
        
        if (rowsUpdated > 0) {
            response.sendRedirect("List.jsp");
        } else {
            out.println("게시글 수정에 실패했습니다.");
        }
    
    } catch (Exception e) {
        out.println("UpdateProc.jsp: " + e);
    } finally {
        if (stmt != null)
            stmt.close();
        if (con != null)
            con.close();
    }
%>
