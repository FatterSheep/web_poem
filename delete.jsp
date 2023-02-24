<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String path = request.getContextPath();  //request.getContextPath()拿到的是你的web项目的根路径，就是webContent(MyEclipse中是webRoot)。
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; // 将 "项目路径basePath" 放入pageContext中
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>删除页面</title>
    
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
    request.setCharacterEncoding("UTF-8"); //用来确保发往服务器的参数的编码格式，设置从request中取得的值或从数据库中取出的值。
    String id=request.getParameter("id"); //获取id,如果没有提前指定编码，则会按照服务器端默认的“iso-8859-1”来进行编码；
  // String name=request.getParameter("name");
  //  String age=request.getParameter("age");
  //  String gender=request.getParameter("gender");
  // String major=request.getParameter("major");
  
   //初始化,减少内存浪费
    Connection conn=null; 
    PreparedStatement stmt = null;
    //Statement stat=null; 
    ResultSet rs=null;
    
    //用try/catch做非法判断,捕捉执行语句的错误
    try{
    Class.forName("com.mysql.jdbc.Driver"); 
    String url="jdbc:mysql://127.0.0.1:3306/gossip"; 
    String user="root"; 
    String password="112233"; 
    conn=DriverManager.getConnection(url,user,password); 
//     stat=conn.createStatement(); 

	//执行sql语句,单或多条语句可用prepareStatement执行sql
    stmt = conn.prepareStatement("delete from t_account where id= "+id+""); //执行sql删除语句
    stmt.executeUpdate(); //由于执行的语句不返回任何内容,使用executeUpdate();
    out.println("<center><br><br><h3>删除成功！</h3></center>"); //跳出提示
    }
    //rs = stat.executeQuery("select * from student");
  /*    if(rs.next())
    {
     
    }
    else{
    out.print("<center><h3>删除失败！</h3></center>");
    }
     */ 	

  catch (SQLException e) //捕捉错误,如果try中没有错误则不执行下面语句
	{
		e.printStackTrace();
	}
    
  //判断是否关闭,避免空指针错误
    //
//     if(rs!=null)
//     {
//         rs.close();
//     }
        if(stmt!=null)
    {
        stmt.close();
    }
        if(conn!=null)
    {
        conn.close();
    }
    %> 
        
    <br>
 <br>
     <center> <a href=home.jsp>退出登录</a> <a href=layout.jsp>返回信息查询页面</a></center>
  
  </body>
</html>