<%@ page language="java" contentType="text/html;charset=UTF-8"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册</title>
<link rel="stylesheet" type="text/css" href="css/register.css">
<script language="JavaScript" charset="utf-8" type="text/javascript" src="js/zc.js"></script>
</head>

<body>

 <div class="logo">
  　<img src="images/logo0.png"/>
 </div>
 <div class="f">
    <h1>用户注册</h1>
    

<form method="post" action="register.do">
<!--    <div>   -->
<!--    性别：<input type="radio" class="text" name="gender" value="男">男 -->
<!--        <input type="radio" class="text" name="gender" value="女">女<br> -->
<!--        </div> -->
  <div>
  <div style="margin-bottom:20px">

       <label><span>邮箱:</span>
       <input type="text" class="text" name="email"/>
       </label>
       <p class="msg"><i class="ati"></i>请输入正确的邮箱格式</p>
   </div>

        <label><span> 用户名:</span>
        <input type="text" class="text" name="username"/>
        </label>
        <p class="msg"><i class="ati"></i>5-25个字符</p>
  </div>
  
  <div>
        <label><span></span><b id="count">0个字符</b>
        </label>
  </div>
  
  

   
   <div style="margin-bottom:20px">
        <label><span> 登录密码:</span>
        <input type="password" class="text" name="password"/>
        </label>
        <p class="msg"><i class="err"></i>5-25个字符</p>
  </div>
  
<!--   <div style="margin:3px 0 10px 0">
       <label>
         <span></span><em class="active">弱</em><em>中</em><em>强</em>
       </label>
  </div> -->
     
  <div style="margin-bottom:20px">
       <label><span>确认密码:</span>
       <input type="password" class="text" name="confirmedPasswd"/>
       </label>
       <p class="msg"><i class="ati"></i>请再输入一次</p>
  </div>
  
  
  <div>
        <input class="submitBtn btn"  type="submit" value="同意协议并注册"/>
        <span class="yi">已注册,</span><a class="d" href="login1.jsp">直接登录&gt;&gt;</a>
   </div>
   </form>
   </div>
</body>
</html>



