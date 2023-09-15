package header;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletHeaderInfo extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		
		out.println("<html><body>");
		
		out.println("method : " + req.getMethod() + "<br/>");
		out.println("request URI : " + req.getRequestURI() + "<br/>");
		out.println("protocol : " + req.getProtocol() + "<br/>");
		out.println("Path Info : " + req.getPathInfo() + "<br/>");
		out.println("Remote Addr : " + req.getRemoteAddr() + "<br/>");
		out.println("Context Path : " + req.getContextPath() + "<br/>");
		out.println("Servlet Context : " + req.getServletContext() + "<br/>");
		out.println("Servlet Path : " + req.getServletPath() + "<br/>");
		
		out.println("</body></html>");
		out.close();
	}
	
}
