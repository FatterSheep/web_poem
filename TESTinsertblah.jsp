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
    <h1>联系我们</h1>
 <form method="post" action="insertblah.jsp">
 
 <div style="margin-bottom:50px">
        <label><span> 用户名:</span>
        <input type="text" class="text" name="name"/>
        </label>
 
  </div>

 
  
  <div style="margin-bottom:30px">  
         <h3> 请留言</h3>
<!--          row/cols表示多行文本输入框的可视区域高度/宽度 -->
        <textarea  name="txt" rows="10" cols="50" placeholder="请留言" class="text"></textarea>  
        
  </div>
  
  <div>
        <input class="submitBtn"  type="submit" value="提交"/>

   </div>

  
</body>
</html>
