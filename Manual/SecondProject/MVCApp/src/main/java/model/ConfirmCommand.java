package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ConfirmCommand implements ICommand {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 입력값 전달 받기
		// 아이디 중복 여부, 패스워드 일치 여부(DB 연동)
		
		MemberDto dto = new MemberDto();
		dto.setEmail(req.getParameter("email"));
		dto.setId(req.getParameter("id"));
		dto.setPw(req.getParameter("pw"));
		
		HttpSession session = req.getSession();
		session.setAttribute("member", dto);
		
		return "/WEB-INF/views/member/registerconfirm.jsp";
	}

}
