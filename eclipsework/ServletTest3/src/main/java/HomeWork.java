import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HomeWork extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("euc-kr");
		PrintWriter out = resp.getWriter();
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String gender = req.getParameter("gender");
		String hobby = req.getParameter("hobby");
		String job = req.getParameter("job");
		String say = req.getParameter("say");
		String cook = req.getParameter("cook");
		
		out.println("<html><body>");

		out.println("<h3>당신의 아이디는 " + id + "입니다.<br><br>");
		out.println("당신의 패스워드는 " + pw + "입니다.<br><br>");
		out.println("당신의 성별은 " + gender + "입니다.<br><br>");
		out.println("당신의 취미은 " + hobby + "입니다.<br><br>");
		out.println("당신의 직업은 " + job + "입니다.<br><br>");
		out.println("당신이 하고 싶은 말은 " + say + "입니다.<br><br>");
		out.println("당신은 쿠키 여부는 " + cook + "입니다.</h3>");
		
		if(cook.equals("on")) {
				Cookie cid = new Cookie("id", id);
				Cookie cpw = new Cookie("pw", pw);
				Cookie cgender = new Cookie("gender", gender);
				Cookie chobby = new Cookie("hobby", hobby);
				Cookie cjob = new Cookie("job", job);
				Cookie csay = new Cookie("say", say);
				cid.setMaxAge(60*60*24);
				cpw.setMaxAge(60*60*24);
				cgender.setMaxAge(60*60*24);
				chobby.setMaxAge(60*60*24);
				cjob.setMaxAge(60*60*24);
				csay.setMaxAge(60*60*24);
				resp.addCookie(cid);
				resp.addCookie(cpw);
				resp.addCookie(cgender);
				resp.addCookie(chobby);
				resp.addCookie(cjob);
				resp.addCookie(csay);
				out.println("<h3>쿠키가 저장되었습니다.</h3>");
		}
			
			
		out.println("</body></html>");
		out.close();
	}
}