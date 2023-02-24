package cc.fin.controller;

import java.io.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cc.openhome.model.Account;
import cc.openhome.model.UserService;

@WebServlet(
    urlPatterns={"/register.do"},
    initParams={
        @WebInitParam(name = "SUCCESS_VIEW", value = "success.jsp"),
        @WebInitParam(name = "ERROR_VIEW", value = "register1.jsp")
    }
)
public class Register extends HttpServlet {
    private String SUCCESS_VIEW;
    private String ERROR_VIEW;
//    private String USERS;
    @Override
    public void init() throws ServletException {
//    	USERS = "D:/eclipse-workspace/Gossip/users";
        SUCCESS_VIEW = getServletConfig().getInitParameter("SUCCESS_VIEW");
        ERROR_VIEW = getServletConfig().getInitParameter("ERROR_VIEW");
    }
    
    
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmedPasswd = request.getParameter("confirmedPasswd");//确认密码

        UserService userService = (UserService) getServletContext().getAttribute("userService");
        
        List<String> errors = new ArrayList<String>();
        if (isInvalidEmail(email)) {
            errors.add("未填寫郵件或郵件格式不正確");
        }
        if (userService.isUserExisted(new Account(username,"",""))) {
            errors.add("使用者名稱為空或已存在");
        }
        if (isInvalidPassword(password, confirmedPasswd)) {
            errors.add("請確認密碼符合格式並再度確認密碼");
        }
        String resultPage = ERROR_VIEW;
        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
        } else {
            resultPage = SUCCESS_VIEW;
            userService.add(new Account(username,password,email));;
        }

        request.getRequestDispatcher(resultPage).forward(request, response);
    }

    private boolean isInvalidEmail(String email) {//验证邮箱地址
        return email == null
                || !email.matches("^[_a-z0-9-]+([.]"
                        + "[_a-z0-9-]+)*@[a-z0-9-]+([.][a-z0-9-]+)*$");
    }

    private boolean isInvalidPassword(String password, String confirmedPasswd) {//验证密码
        return password == null || password.length() < 6
                || password.length() > 16 || !password.equals(confirmedPasswd);
    }
}
