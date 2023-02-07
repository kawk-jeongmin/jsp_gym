package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "*.do",
initParams = {@WebInitParam(name="config", value="/WEB-INF/commandHandler.properties")})

public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Map<String, CommandHandler> commandHandlerMap = new HashMap<>();
	
	//서블릿을 생성하고 초기할 때 가장 먼저 호출되는 init()메소드를 이용
	public void init(ServletConfig config) throws ServletException{
		String ConfigFile = config.getInitParameter("config");
		Properties prop = new Properties();
		String configFilePath = config.getServletContext().getRealPath(ConfigFile);
		
		try(FileInputStream fis = new FileInputStream(configFilePath)){
			prop.load(fis);
		}catch(IOException e) {
			throw new ServletException(e);
	}
		
	Iterator<Object> keyIter = prop.keySet().iterator();
	while(keyIter.hasNext()) {
		String command = (String) keyIter.next();
		String handlerClassName = prop.getProperty(command);
		try {
			Class<?> handlerClass = Class.forName(handlerClassName);
			CommandHandler handlerInstance = (CommandHandler) handlerClass.newInstance();
			commandHandlerMap.put(command, handlerInstance);
		}catch(ClassNotFoundException | InstantiationException | IllegalAccessException e) {
			throw new ServletException(e);
		}
	}
		}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			process(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			process(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String command = request.getRequestURI();
		
		command = command.substring(request.getContextPath().length()+1);
		
		CommandHandler handler = commandHandlerMap.get(command);
		
		String viewPage = null;
		try {
			viewPage = handler.process(request, response);
		}catch(Exception e) {
			throw new ServletException(e);
		}
		
		if(viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}


}
