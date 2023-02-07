package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.*;

public class JoinHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session= request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		UserDAO userDAO = new UserDAO();
		User user = new User();
		
		user.setUserID(request.getParameter("userID"));
		user.setUserPassword(request.getParameter("userPassword"));
		user.setUserName(request.getParameter("userName"));
		user.setUserAge(request.getParameter("userAge"));
		user.setUserWeight(request.getParameter("userWeight"));
		user.setUserGoalWeight(request.getParameter("userGoalWeight"));
		
		userDAO.join(user);
		
		session.setAttribute("userID", user.getUserID());
		
		return "main.jsp";
	}
}