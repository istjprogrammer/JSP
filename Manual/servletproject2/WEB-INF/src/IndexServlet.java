import javax.servlet.http.*;

public class IndexServlet extends HttpServlet {
	protected void 	doGet(HttpServletRequest req, HttpServletResponse resp){
		System.out.println("Get Test");
	}
	
	protected void 	doPost(HttpServletRequest req, HttpServletResponse resp){
		System.out.println("Post Test");
	}
}