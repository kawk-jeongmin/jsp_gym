package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import today.*;

public class RegisterHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session= request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String userID = null;
		if (session.getAttribute("userID") != null)
	    {
	        userID = (String)session.getAttribute("userID");
	    }
		
		TodayDAO todayDAO = new TodayDAO();
		Today today = new Today();
		
		today.setTodayWeight(request.getParameter("todayWeight"));
		today.setTodayFeel(request.getParameter("todayFeel"));
		userID = (String)session.getAttribute("userID");
		today.setTodayBreak(request.getParameter("todayBreak"));
		today.setTodayLunch(request.getParameter("todayLunch"));
		today.setTodayDinner(request.getParameter("todayDinner"));
		
		todayDAO.register(today.getTodayWeight(), today.getTodayFeel(), userID, today.getTodayBreak(), today.getTodayLunch(), today.getTodayDinner(), today.getTodayID());
		session.setAttribute("todayID", today.getTodayID());
		
		
		return "myPage.jsp";
	}
}
