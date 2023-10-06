package myservlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybean.Dog;
import mybean.Person;

public class ELTestServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		
		req.setAttribute("visitCount", 100);
		
		String[] favorateFood = {"냉면", "돼지갈비", "순댓국", "콩국수"};
		req.setAttribute("foods", favorateFood);
		
		ArrayList<String> movies = new ArrayList<String>();
		movies.add("인터스텔라");
		movies.add("메멘토");
		movies.add("인셉션");
		req.setAttribute("movies", movies);		
		
		Person Lee = new Person();
		Dog messi = new Dog();
		
		Lee.setName("이현재");
		messi.setName("현재짱");
		
		Lee.setDog(messi);
		req.setAttribute("Lee", Lee);
		
		//core/test04.jsp에서 사용할 데이터
		String[] movie1 = {"인터스텔라", "테이큰", "007"};
		String[] movie2 = {"타짜", "광해", "도둑들"};
		
		ArrayList list = new ArrayList();
		list.add(movie1);
		list.add(movie2);
		req.setAttribute("movieList", list);
		
		//댓글 데이터
		String[] comment = {"이 사이트는 편리합니다.", "정말 좋은 사이트네요!","자주 올 예정입니다."};
		req.setAttribute("comments", comment);
		
		//MEMBER변수에 guest와 member값을 번갈아서 사용		
		req.getSession().setAttribute("MEMBER", "guest");
		
		RequestDispatcher view = req.getRequestDispatcher("test08_proc.jsp");
		view.forward(req, resp);
	}

}
