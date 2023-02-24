package cc.fin.controller;

import java.io.*;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cc.openhome.model.Account;
import cc.openhome.model.UserService;

@WebServlet(
    urlPatterns={"/login1.do"},//名字
    initParams={
        @WebInitParam(name = "SUCCESS_VIEW", value = "index1.jsp"),//注解
        @WebInitParam(name = "ERROR_VIEW", value = "error.html")
    }
)
public class Login1 extends HttpServlet {
    private String SUCCESS_VIEW;
    private String ERROR_VIEW;
//    private String USERS;
    @Override
    public void init() throws ServletException {
//    	USERS = "D:/eclipse-workspace/Gossip/users";
        SUCCESS_VIEW = getServletConfig().getInitParameter("SUCCESS_VIEW");//String getInitParameter() 返回SUCCESS_VIEW的初始化参数值
        ERROR_VIEW = getServletConfig().getInitParameter("ERROR_VIEW");
        //getServletConfig() 返回传递到servlet的init()方法的ServletConfig对象
        //见Filter
    }


    //获取请求头中的参数
	protected void doPost(HttpServletRequest request, 
	                      HttpServletResponse response) 
	                        throws ServletException, IOException {
	    String username = request.getParameter("username");
	    String password = request.getParameter("password");
	    
	    String page;
	    
	    //获取对象. gossiplistener文件的ServletContext context对象里面已经setAttribute过了关于用户信息的dataSource,要用的话就get出来.
	    UserService userService = (UserService) getServletContext().getAttribute("userService");
	    if(userService.checkLogin(new Account(username, password,""))) {
	        request.getSession().setAttribute("login1", username);//1.request.getSession()
	      //  这是常用的方式，从当前request中获取session，如果获取不到session，则会自动创建一个session
	        //，默认为true,并返回新创建的session；如果获取到，则返回获取到的session;
	        page = SUCCESS_VIEW;
	    }
	    else {
	        request.setAttribute("error", "名稱或密碼錯誤");
	        page = ERROR_VIEW;
	    }
	    request.getRequestDispatcher(page).forward(request, response);//request.getRequestDispatcher()的两个方法以及request域,
	    //一个请求跨多个Servlet，需要使用转发(.forward)和包含(.include)。

	    //请求转发：由下一个Servlet完成响应体！当前Servlet可以设置响应头！（留头不留体）
	}
}
