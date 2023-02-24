package cc.openhome.web;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
//UTF-8
@WebFilter(
		urlPatterns = { "/*" }, 
		initParams = { 
				@WebInitParam(name = "ENCODING", value = "UTF-8")
		})
public class EncodingFilter implements Filter {
    private String ENCODING;
    //FilterConfig接口之一
    public void init(FilterConfig config) throws ServletException {	//仅在用于初始化过滤器
        ENCODING = config.getInitParameter("ENCODING");//获取FilterConfig对象
    }
    //当Filter 对象能够拦截访问请求时，Servlet 容器将调用 Filter 对象的 doFilter 方法。
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//接口是不能实例化的,所以需要把request强制类型转换为HttpServletRequest对象
	    HttpServletRequest req = (HttpServletRequest) request;
	  //通过FORM提交的值，在提交以后我要判断是否正确。
	    if("GET".equals(req.getMethod())) {//判断是否为Get方法
	        req = new EncodingWrapper(req, ENCODING);
	    }
	    else {
	        req.setCharacterEncoding(ENCODING);
	    }
	  //将请求转发给过滤器链请求的资源
		chain.doFilter(req, response);
	}
	//该方法在 Web 容器卸载 Filter 对象之前被调用，也仅执行一次。可以完成与 init 方法相反的功能，释放被该 Filter 对象打开的资源
	public void destroy() {}

}
