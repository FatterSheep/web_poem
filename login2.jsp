<%@ page language="java" contentType="text/html;charset=UTF-8"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<link rel="stylesheet" type="text/css" href="css/loginz.css">
</head>

<body>
 <div class="logo">
  　<img src="images/logo0.png"/>
 </div>
 
 <div class="f">
    <h1>管理员登陆</h1>
 <form method="post" action="login2.do"> 
 
 <div style="margin-bottom:50px">
        <label><span> 用户名:</span>
        <input type="text" class="text" name = "user"/>
        </label>
 
  </div>

 
  
  <div style="margin-bottom:30px">
        <label><span> 登录密码:</span>
        <input type="password" class="text" name ="passwd"/>
        </label>
  </div>
  

<!--  <div style="margin-bottom:15px">
        <label><input type="checkbox" class="zd"/>
        <span class="z">自动登录</span>
        </label>
        
        
        <label><a class="w" href="#">忘记密码&gt;&gt;</a>
        </label>
  </div> -->
  
 <div>
        <input class="submitBtn"  type="submit" value="登陆"/>
       <!--  <span class="yi">没有账号?</span><a class="d" href="register.jsp">立即注册&gt;&gt;</a> -->
   </div>

</body>
</html>
