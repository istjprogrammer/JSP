import javax.servlet.http.*;
import java.io.*;

public class IndexServlet extends HttpServlet{
	protected void 	doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException{
		//System.out.println("Get Test");
		PrintWriter out = resp.getWriter();
		out.println("<html><body> <h1>Good Request</h1> </body></html>");
		out.close();
	}

	protected void 	doPost(HttpServletRequest req, HttpServletResponse resp){
		System.out.println("Post Test");
	}
}