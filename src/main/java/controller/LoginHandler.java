package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.*;
import java.io.PrintWriter;

public class LoginHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session= request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String userID = request.getParameter("userID");
		String userPassword = request.getParameter("userPassword");
		
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(userID, userPassword);
		
		if(result == 0) {
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('비밀번호를 확인하세요'); location.href=\"login.jsp\";</script>");
			writer.close();
			
		}else if(result == -1) {
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('존재하지 않는 아이디 입니다'); location.href=\"login.jsp\";</script>");
			writer.close();
		}else if(result == -2) {
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('DB 오류'); location.href=\"login.jsp\";</script>");
			writer.close();
		}else if(result == 1) {
			session.setAttribute("userID", userID);
			session.setAttribute("userPassword", userPassword);
			return "main.jsp";
		}
		
		return null;
		
		
	}
}