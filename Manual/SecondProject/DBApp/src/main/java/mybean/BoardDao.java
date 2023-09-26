package mybean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDao {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DataSource ds;
	
	public BoardDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
		}
		catch(Exception err) {
			System.out.println("BoardDao:" + err);
		}
	}
	
	public void freeConnection() {
		if(rs != null) try {rs.close();} catch (SQLException e) {e.printStackTrace();}
		if(stmt != null) try {stmt.close();} catch (SQLException e) {e.printStackTrace();}
		if(con != null)	try {con.close();} catch (SQLException e) {	e.printStackTrace();}
	}
	
	// List.jsp
	public List getBoardList() {
		String sql = "select b_num, b_subject, b_name, b_regdate, b_count from tblboard";
		Vector vector = new Vector();
		
		try {
			con = ds.getConnection(); 
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				Board board = new Board();
				board.setB_subject(rs.getString("b_subject"));
				board.setB_count(rs.getInt("b_count"));		
				board.setB_name(rs.getString("b_name"));
				board.setB_num(rs.getInt("b_num"));
				board.setB_regdate(rs.getString("b_regdate"));
				
				vector.add(board);
			}
		}
		catch(Exception e) {
			System.out.println("List.jsp: " + e);
		}
		finally {
			freeConnection();
		}
		return vector;
	}
}