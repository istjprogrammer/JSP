package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BookDto;

public class BookController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = "";
		req.setCharacterEncoding("utf-8");
		String cmd = req.getParameter("command");
		System.out.println("cmd:" + cmd);
		HttpSession session = req.getSession();
		ArrayList bookList = 
				(ArrayList)session.getAttribute("bookList");
		
		if(cmd.equals("BOOKSHOP")) {
			url = "views/bookshop.jsp";
		}
		else if(cmd.equals("CART")) {			
			url = "views/bookshop.jsp";
			
			if(bookList == null) {
				bookList = new ArrayList();
			}
			
			String book = req.getParameter("book");
			String quantity = req.getParameter("quantity");
			
			StringTokenizer token = new StringTokenizer(book, "/");
			String title = token.nextToken().trim();
			String author = token.nextToken().trim();
			String price = token.nextToken().trim();
			
			BookDto dto = new BookDto();
			dto.setAuthor(author);
			dto.setPrice(Integer.parseInt(price));
			dto.setQuantity(Integer.parseInt(quantity));
			dto.setTitle(title);
			
			bookList.add(dto);
			session.setAttribute("bookList", bookList);
		}
		else if(cmd.equals("CHECKOUT")) {
			url = "views/checkout.jsp";
			
			int sum = 0;
			for(int i=0; i<bookList.size(); i++) {
				BookDto book = (BookDto)bookList.get(i);
				sum += book.getPrice() * book.getQuantity();
			}
			session.setAttribute("amount", sum);
		}
		else if(cmd.equals("DEL")) {
			url = "views/bookshop.jsp";
			int idx = Integer.parseInt(req.getParameter("cnt"));
			System.out.println("idx:" + idx);
			bookList.remove(idx);
		}
		
		RequestDispatcher view =
				req.getRequestDispatcher(url);
		view.forward(req, resp);
	}
}