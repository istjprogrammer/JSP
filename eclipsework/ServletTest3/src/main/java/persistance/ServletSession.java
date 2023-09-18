package persistance;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ServletSession extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("euc-kr");
		
		String name = req.getParameter("name");
		HttpSession session = req.getSession();
		
		session.setAttribute("name", name);
		
		PrintWriter out = resp.getWriter();
		out.println("<html><body>");
		out.println("당신의 이름은 " + session.getAttribute("name")+ "이다.<br><br>");
		out.println("접속시간 : " + new Date(session.getCreationTime()) + "<br><br>");
		out.println("ID : " + session.getId() + "<br><br>");
		out.println("만료시간 : " + session.getMaxInactiveInterval() + "<br><br>");
		
		if(session.isNew())
			out.println("처음 접속하였습니다.");
		else 
			out.println("최근에 접속하였습니다.");		
		out.println("</body></html>");
		out.close();
	}
}