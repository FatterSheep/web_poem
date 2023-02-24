package cc.openhome.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.lang.StringEscapeUtils;

public class EscapeWrapper extends HttpServletRequestWrapper {
    public EscapeWrapper(HttpServletRequest request) {
        super(request);// 将request交给父类，以便于调用对应方法的时候，将其输出
    }
    
    @Override
    public String getParameter(String name) {	//获取方法的名字
        String value = getRequest().getParameter(name);	//获取参数
        return StringEscapeUtils.escapeHtml(value);	//转义html
    }
}