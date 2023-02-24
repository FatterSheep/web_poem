<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>联系我们</title>
</head>
<body>
		<a href="index1.jsp">回到首页</a>

	<%
	
				//获取数据库字段
				request.setCharacterEncoding("UTF-8");
				String name=request.getParameter("name");
				String txt=request.getParameter("txt");
			//初始化
 			    Connection conn=null; 
   				PreparedStatement stmt = null;		
	
			//此进行连接数据库
			Class.forName("com.mysql.jdbc.Driver"); 
    		String url="jdbc:mysql://127.0.0.1:3306/gossip"; //gossip为数据库名称
    		String user="root"; //数据库账户
			String password="112233"; //数据库密码
			//取得数据库连接conn
			
			conn=DriverManager.getConnection(url,user,password); 
			
			try 
			{
				Class.forName("com.mysql.jdbc.Driver"); //加载驱动 
			} 
			catch (ClassNotFoundException e) 
			{ 
				e.printStackTrace();
			}  

			

			//用try/catch做非法错误捕捉
			try 
			{ 
				
				
				String sql="insert into t_blah (name,txt) values('"+name+"','"+txt+"')";
				stmt = conn.prepareStatement(sql);
	
				//conDB db = new conDB();
			   // db.connectDB();
			   // Statement state = db.getConnection().createStatement();
			   
			   //定义flag,flag是sql语句执行情况
			    int flag = stmt.executeUpdate(sql);
			   
			    //executeupdate返回的是更新的行数,如果执行成功就是!=0;
			    if(flag != 0)
			    {
			    	 out.println("<p>('提交成功!谢谢您的支持!')</p>");
			    	
			    }
			    //没有执行成功打印失败信息
			    else
			    {
			    	 out.println("<p>('插入失败!')</p>");
			    }
			}
			  
			catch (SQLException e) 
				{
					e.printStackTrace();
				}
				//判断是否关闭
			        if(stmt!=null)
			    {
			        stmt.close();
			    }
			        if(conn!=null)
			    {
			        conn.close();
			    }
			
	%>




</body>
</html>








