package cc.fin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login2.do")
public class Login2 extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request,
                         HttpServletResponse response)
                      throws ServletException, IOException {
    	
        String user = request.getParameter("user");
        String passwd = request.getParameter("passwd");
        
        if("lyy".equals(user) && "123456".equals(passwd)) {
        	
        	response.sendRedirect("layout.jsp");
         
        }
        
        else {
        	response.setContentType("text/html;charset=UTF-8");//把浏览器编码设置为UTF-8
        	PrintWriter out = response.getWriter();//打印对象
        	out.println("登陆失败!请重新输入.或者您不是管理员,请返回至用户登录界面");
        	
        }
        }
    }
