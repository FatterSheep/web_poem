<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中国古典诗歌</title>
<link rel="stylesheet" type="text/css" href="css/index1.css">
<script type="text/javascript" src="js/index.js"></script>

</head>

<body background ="images/z.jpg">
<div class="top">
  <img src="images/logo1.png" class="logo"/>

<!--   <ul class="h">
    <li>
       <a href="register.jsp" target="_blank">注册</a>
    </li>
    <li>
       <a href="login.jsp" target="_blank">登录</a>
    </li>
  </ul> -->
</div>
   
  <div class="title">
  <img src="images/title1.png"  class="imgt"/>
  </div>
  <div class="search">
      <div id="search-tab" class="search-list">
         <ul>
             <li id="tab1" class="select">
             <a href=index1.jsp>作者</a>
             </li>
             <li id="tab2">
             <a href=INDE1.jsp>书名</a>
             </li>

          </ul>
      </div>
                
      <div class="search-pannel"> 
      

            <form method="post" action="writersearch.jsp">
            <div class="search-button">
             <input type="submit" class="btn-button" value=""/>
            </div>
            <div class="search-pannel1">
             <input type="text" class="text" name="person" />
             <i class="iconfont">ő</i>
            </div>


            </form>
         </div>
       </div>
    <div class="tupian">
      <ul class="tu">
     
        <li>
		   <img src="images/5.png">
		   <span class="gs">总览</span>
		   <a href="person.jsp" >点击</a>
		</li>
        <li>
		   <img src="images/2.png">
		   <span class="gs">年份</span>
		   <a href="year.jsp" >点击</a>
		</li>
      </ul>
     </div>
     <div class="bottom">
        <div class="a">
          <img src="images/logo0.png"  class="t"/><br/><br/>
         <span>400-829-7080</span><br/>
         <span>www.shige.com</span>
       </div>
       <div class="b">
         <span>Copyright ©2019-2023 版权所有</span><br /><br/>
         <span>北京师范大学珠海分校管理学院</span> <br><br>
         <a href="TESTinsertblah.jsp" >联系我们</a>
         <a href="home.jsp" >退出登录</a>
       </div>
       <div class="c">
          <img src="images/erwei.png"/>
       </div>
    </div>
    
    
</body>
</html>
