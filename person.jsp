<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>乾隆</title>
 
</head>
<body background ="images/ccc.jpg">
 
	<%
			 //此进行连接数据库
		    String url="jdbc:mysql://127.0.0.1:3306/gossip"; //gossip为数据库名称
		    String dbuser="root"; //数据库账户
			String dbpwd="112233"; //数据库密码
			try 
			{
				Class.forName("com.mysql.jdbc.Driver"); //加载驱动
			} 
			catch (ClassNotFoundException e) 
			{ 
				e.printStackTrace();
			}  
			//取得数据库连接conn
			Connection conn=DriverManager.getConnection(url, dbuser, dbpwd);;
 
			PreparedStatement ps=null;
			ResultSet rs=null;
			//声明数据库字段
			String 作者="";
			String 书名="";
			String 年份="";
			String 链接="";
			//执行sql语句,放在非法判断中
			try 
			{ 
				//执行sql
				String sql="select * from poems";
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				//遍历结果集
				while(rs.next())
				{
					作者=rs.getString(1);
					书名=rs.getString(2);
					年份=rs.getString(3);
					链接=rs.getString(4);
					
// 					out.println(作者);
// 					out.println(书名); 
// 					out.println(年份);

				%>
				
				
				<%
				//打印链接
				    out.println("<a href="+链接+">"+作者 +书名 +年份 +"</a>"+"<br><br>"); 
				%> 
				
				<%
					//out.println("<img src=\""+img+"\"/>"+"<br><br>"); 
				}
			}
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			//判断是否关闭
			finally
			{ 
					try 
					{
						if(rs!=null)			
							rs.close();
					} 
					catch (SQLException e) 
					{
						e.printStackTrace();
					}
					
					
					finally
					{
							try 
							{
								if(ps!=null)					
									ps.close();
							} 
							catch (SQLException e) 
							{ 
								e.printStackTrace();
							}
							finally
							{
								try 
								{
									if(conn!=null)					
										conn.close();
								} 
								catch (SQLException e) 
								{ 
										e.printStackTrace();
								}
							}
					}
			} 
	%>		
</body>
</html>
 