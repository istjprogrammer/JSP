import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletTest2 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("euc-kr");

		PrintWriter out = resp.getWriter();
		out.println("<html><body>");

		/*
		 * String[] singers = req.getParameterValues("singer");
		 * System.out.println("singers:" +singers.length);
		 * out.println("<h3>당신이 입력한 가수이름</h3>"); out.println("<ul>"); for(String singer
		 * : singers) { out.println("<li>" + singer + "<li>"); } out.println("</ul>");
		 * 
		 * 
		 * try { String foods[] = req.getParameterValues("food");
		 * System.out.println("foods:" +foods.length);
		 * out.println("<h3>당신이 입력한 음식이름</h3>"); out.println("<ul>"); for(String food :
		 * foods) { out.println("<li>" + food + "<li>"); } out.println("</ul>"); }
		 * catch(NullPointerException err) { out.println("음식을 선택하지 않았습니다.");
		 * out.println("<br>"); }
		 * 
		 * try { String[] cities = req.getParameterValues("city");
		 * System.out.println("cities:" +cities.length);
		 * out.println("<h3>당신이 선택한 도시</h3>"); out.println("<ul>"); for(String city :
		 * cities) { out.println("<li>" + city + "<li>"); } out.println("</ul>"); }
		 * catch(NullPointerException err) { out.println("도시를 선택하지 않았습니다."); }
		 */

		Enumeration<String> enumer = req.getParameterNames();
		// enumeration은 줄을 세우는 메서드다.
		while (enumer.hasMoreElements()) {
			// hasMoreElements는 요소가 더 이상 없을 때까지 반복하는 메서드
			String name = enumer.nextElement();
			if (name != null) {
				String[] values = req.getParameterValues(name);
				out.println("<h3>당신이 선택한" + name + "입니다.</h3>");
				out.println("<ul>");
				for (String val : values) {
					out.println("<li>" + val + "<li>");
				}
				out.println("</ul>");
			}
		}

		out.println("</body></html>");
		out.close();
	}
}