package cc.openhome.web;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
//此过滤器导致中文输入乱码，故直接删除。
@WebFilter("/hehe")
public class EscapeFilter implements Filter {
	//FilterConfig接口之一
    public void init(FilterConfig fConfig) throws ServletException {} //仅在用于初始化过滤器
    
    //通过调用 Filter Chain 对象引用上的 doFilter方法，之后在处理控制权返回该过滤器时处理响应。
	public void doFilter(ServletRequest request, 
	                     ServletResponse response, 
	                     FilterChain chain) 
	                          throws IOException, ServletException {
		//把request强制类型转换为HttpServletRequest对象
        HttpServletRequest requestWrapper = //创建一个我实现参数的对象
            new EscapeWrapper((HttpServletRequest) request);//把对象传进里面,然后可以使用过滤完的方法了
        //将请求转发给过滤器链请求的资源
        chain.doFilter(requestWrapper, response);
	}

	//释放被该 Filter 对象打开的资源
    public void destroy() {}
}
