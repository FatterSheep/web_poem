<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String path = request.getContextPath();//获取web根目录
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";// 将 "项目路径basePath" 放入pageContext中
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>按姓名查询</title>
    
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
    request.setCharacterEncoding("UTF-8");//获取根路径
    String name=request.getParameter("name");//获取数据库字段
    //初始化
    Connection conn=null; 
    Statement stat=null; 
    ResultSet rs=null;
    //装载数据库
    Class.forName("com.mysql.jdbc.Driver"); 
    String url="jdbc:mysql://127.0.0.1:3306/gossip"; 
    String user="root"; 
    String password="112233"; 
    conn=DriverManager.getConnection(url,user,password); 
    //执行sql
    stat=conn.createStatement(); 
    rs=stat.executeQuery("select * from t_account where name='"+name+"'");
    %>
    <br>
        <h3>符合条件的信息</h3><hr> 
    <br>
     <table width="450" border="100" cellSpacing=1 style="font-size:15pt;border:dashed 1pt">
    <tr>
    <td>ID</td>
    <td>姓名</td>
    <td>密码</td>
    <td>邮箱</td>
    </tr>
    <% 
    //做if判断,遍历结果集
    if(rs.next())
    {
    	    out.print("<tr>");
    	    out.print("<td>"+rs.getInt("id")+"</td>");
    	    out.print("<td>"+rs.getString("name")+"</td>");
    	    out.print("<td>"+rs.getInt("password")+"</td>");
//    	    out.print("<td>"+rs.getString("gender")+"</td>");
    	    out.print("<td>"+rs.getString("email")+"</td>");
        %>
    <td><a href="delete.jsp?id=<%=rs.getInt("id") %>">删除</a></td>
<%--      <td><a href="update3.jsp?id=<%=rs.getInt("id") %>">修改</a></td> --%>
    <%
    out.print("</tr>");
    }
    //打印错误信息
     else{
    out.print("<h4>不存在此条件的信息！</h4>");
    } 
    %>
      </table>
      <br>
      <br>
      <h4><a href=layout.jsp>返回查询页面</a></h4> 
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