package controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import today.*;

public class MyPageHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		TodayDAO todayDAO = new TodayDAO();
		List<Today> List = todayDAO.getList("userID");
		request.setAttribute("userInfo", List);
		
		return "myPage.jsp";
	}
}
