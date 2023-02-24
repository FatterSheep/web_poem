package cc.openhome.web;

import javax.naming.*;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.sql.DataSource;

import cc.openhome.model.*;

@WebListener
public class GossipListener implements ServletContextListener {
    public void contextInitialized(ServletContextEvent sce) {
    	//通过JNDI(系统接口)取得datasource;
        try{
        	Context initContext = new InitialContext();
     	    Context envContext = (Context)initContext.lookup("java:/comp/env");
     	    DataSource dataSource = (DataSource) envContext.lookup("jdbc/gossip");
     	   
     	    ServletContext context=sce.getServletContext();
     	    context.setAttribute("userService", new UserService(new AccountDAOjdbcImpl(dataSource)));
        
        }catch(NamingException ex){
        	throw new RuntimeException(ex);
        }
    }

    public void contextDestroyed(ServletContextEvent sce) {}
}
