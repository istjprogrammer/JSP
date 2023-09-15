package persistance;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class ServletCookie extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("euc-kr");

		if (req.getMethod() == "POST") {
			String name = req.getParameter("name");
			String addr = req.getParameter("addr");

			Cookie nameCook = new Cookie("name", name);
			Cookie addrCook = new Cookie("addr", addr);

			// cookie의 저장 시간을 정해주는 기능
			// 만약 하루동안 저장하고 싶다면?*(초 * 분 * 시 값을 따로따로 입력)
			nameCook.setMaxAge(60 * 60 * 24);
			addrCook.setMaxAge(60 * 60 * 24);

			resp.addCookie(nameCook);
			resp.addCookie(addrCook);
			resp.getWriter().println("쿠키가 저장되었습니다.");
		}

		else {
			Cookie[] cooks = req.getCookies();
			for (Cookie c : cooks) {
				resp.getWriter().println(c.getName() + "," + c.getValue());
			}
		}
	}
}