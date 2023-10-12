package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CompleteCommand;
import model.ConfirmCommand;
import model.FactoryBean;
import model.ICommand;
import model.MainCommand;
import model.RegisterCommand;

//@WebServlet("/member")
public class MemberController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		String command = req.getParameter("command");
		String url = "";
		
		ICommand cmd = null;
		
		if(command.equals("REGISTER")) {
			cmd = new RegisterCommand();
		}
		else if(command.equals("CONFIRM")) {
			cmd = new ConfirmCommand();
		}
		else if(command.equals("COMPLETE")) {
			cmd = new CompleteCommand();
		}
		else if(command.equals("MAIN")) {
			cmd = new MainCommand();
		}
		else {
			// 잘못된 접근에 대한 처리
		}
	
		url = (String)cmd.processCommand(req, resp);
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
		*/
		
		String command = req.getParameter("command");
		String url = "";
		ICommand cmd = null;
		
		FactoryBean factory = FactoryBean.newInstance();
		cmd = factory.createInstance(command);
		
		url = (String)cmd.processCommand(req, resp);
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}
}