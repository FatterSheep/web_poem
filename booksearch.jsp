<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String path = request.getContextPath();	//request.getContextPath()拿到的是你的web项目的根路径，就是webContent(webapp)。
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; // 将 "项目路径basePath" 放入pageContext中
//request.getSchema()可以返回当前页面使用的协议，http 或是 https;
//request.getServerName()可以返回当前页面所在的服务器的名字;
//request.getServerPort()可以返回当前页面所在的服务器使用的端口,就是80;
//request.getContextPath()可以返回当前页面所在的应用的名字;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<!--   <base> 标签为页面上的所有链接规定默认地址或默认目标。
浏览器随后将不再使用当前文档的 URL，而使用指定的基本 URL 来解析所有的相对 URL。
这其中包括 <a>、<img>、<link>、<form> 标签中的 URL。 -->
    <base href="<%=basePath%>">
<!--     使用了basePath,后面就可以直接使用相对路径啦 -->
    <title>按书名查询</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body background ="images/ccc.jpg">
    <% 
    request.setCharacterEncoding("UTF-8");	//用来确保发往服务器的参数的编码格式，设置从request中取得的值或从数据库中取出的值。
    String book=request.getParameter("book");	//获取book字符串,如果没有提前指定，则会按照服务器端默认的“iso-8859-1”来进行编码；
    
  //初始化,减少内存浪费
    Connection conn=null; 
    Statement stat=null; 
    ResultSet rs=null;
    
    //装载mysql数据库
    Class.forName("com.mysql.jdbc.Driver"); 
    String url="jdbc:mysql://127.0.0.1:3306/gossip"; 
    String user="root"; 
    String password="112233"; 
    conn=DriverManager.getConnection(url,user,password); 
    
    //创建一个 Statement 对象来将 SQL 语句发送到数据库
    stat=conn.createStatement(); 
    rs=stat.executeQuery("select * from poems where book like '%"+book+"%'");
    %>
    <br>
        <h3>查询结果</h3><hr> 
    <br>
     <table width="" border="" cellSpacing=1 style="font-size:10pt;border:dashed 1pt">
    <tr>
    <td>作者</td>
    <td>书名</td>
    <td>年份</td>
    <td>全文链接</td>

    </tr>
    
    <% 
    //遍历数据库每一条数据
    while(rs.next())
    {
    out.print("<tr>");

    out.print("<td>"+rs.getString("person")+"</td>");
    out.print("<td>"+rs.getString("book")+"</td>");
    out.print("<td>"+rs.getString("years")+"</td>");

    out.println("<td> "+ "<a href=" +rs.getString("ht") +">"+   "点击查看全文" + "</td>");
    out.print("</tr>");
    }
 
    %>
      </table>
      <br>
      <br>
      <h4><a href=INDE1.jsp>返回查询页面</a></h4> 
    <% 
    //判断是否关闭,避免空指针错误
    if(rs!=null)
    {
        rs.close();
    }
        if(stat!=null)
    {
        stat.close();
    }
        if(conn!=null)
    {
        conn.close();
    }
    %> 
  </body>
</html>