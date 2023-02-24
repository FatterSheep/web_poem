<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";// 将 "项目路径basePath" 放入pageContext中
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>按作者查询</title>
    
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
    request.setCharacterEncoding("UTF-8");//设置编码格式
    String person=request.getParameter("person");//获取数据库字段
    //初始化
    Connection conn=null; 
    Statement stat=null; 
    ResultSet rs=null;
    Class.forName("com.mysql.jdbc.Driver"); 
    String url="jdbc:mysql://127.0.0.1:3306/gossip"; 
    String user="root"; 
    String password="112233"; 
    conn=DriverManager.getConnection(url,user,password);
    //执行sql语句
    stat=conn.createStatement(); 
    rs=stat.executeQuery("select * from poems where person='"+person+"'");//单个结果集,使用executeQuery
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
    //遍历结果集
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
      <h4><a href=index1.jsp>返回查询页面</a></h4> 
    <% 
    //判断是否关闭
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