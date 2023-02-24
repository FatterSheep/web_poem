<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String path = request.getContextPath();//获取web根路径
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";// 将 "项目路径basePath" 放入pageContext中
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>学生信息</title>
    
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
 	//设置编码
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
    //获取数据库字段
    String id=request.getParameter("id");
    String name=request.getParameter("name");
    String pasword=request.getParameter("password");
   // String gender=request.getParameter("gender");
    String email=request.getParameter("email");
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
    //执行sql语句
    stat=conn.createStatement(); 
  // stat.execute("insert into student(id,name,age,gender,major)values("+id+",'"+name+"',"+age+",'"+gender+"','"+major+"')"); 
    rs=stat.executeQuery("select * from t_account");
    
  %>
  <br>
    <h2>用户信息</h2>  <hr>    
    <br> 
  <h3>全部用户信息如下</h3>
   <table width="450" border="100" cellSpacing=1 style="font-size:15pt;border:dashed 1pt">
    <tr>
    <td>ID</td>
    <td>姓名</td>
    <td>密码</td>
    <td>邮箱</td>
    </tr>
    <% 
    //遍历结果集
    while(rs.next())
    {
    out.print("<tr>");
    out.print("<td>"+rs.getInt("id")+"</td>");
    out.print("<td>"+rs.getString("name")+"</td>");
    out.print("<td>"+rs.getInt("password")+"</td>");
//    out.print("<td>"+rs.getString("gender")+"</td>");
    out.print("<td>"+rs.getString("email")+"</td>");
    %>
    <td>
    <a href="delete.jsp?id=<%=rs.getInt("id") %>">删除</a>
    </td>
<%--      <td><a href="update3.jsp?id=<%=rs.getInt("id") %>">修改</a></td> --%>
    <%
    out.print("</tr>");
    }
  
    %>
      </table>
      
      <br>
   <form action="idselect.jsp" method="post">
 <h3>按ID查询:<input type="text" name="id"  value="" title="ID不能为空" ></input>
    <input type="submit" value="查询"/></h3>
    <br>
    </form>
    <form action="nameselect.jsp" method="post">
   <h3>按姓名查询:<input type="text" name="name" value="" title="姓名不能为空"></input>
    <input type="submit" value="查询" /></h3>
    <br>
    </form>
<!--     <form action="psselect.jsp"method="post"> -->
<!--   <h3> 按密码查询:<input type="text" name="pasword" value="" title="密码不能为空"></input> -->
<!--     <input type="submit" value="查询"/></h3> -->
<!--     <br> -->
<!--     </form> -->
<!--     <form action="genderselect.jsp"method="post"> -->
<!--   <h3>  按性别查询:<input type="text" name="gender" value=""title="性别不能为空"></input> -->
<!--     <input type="submit" value="查询"/></h3> -->
<!--     <br> -->
<!--     </form> -->
    <form action="majorselect.jsp"method="post">
   <h3> 按邮箱查询:<input type="text" name="email" value=""title="邮箱不能为空"></input>
    <input type="submit" value="查询"/></h3>
    <br>
    </form>
 <br>
<h3><a href=home.jsp>退出登录</a></h3> 
  <h3><a href="fold1.jsp">查看用户留言信息</a></h3>
<br>

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